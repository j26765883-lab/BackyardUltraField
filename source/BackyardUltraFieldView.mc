import Toybox.Activity;
import Toybox.Lang;
import Toybox.Time;
import Toybox.WatchUi;

class BackyardUltraFieldView extends WatchUi.SimpleDataField {
    const TARGET_LAP_DISTANCE_M = 6706.14f; // 4.167 miles in meters
    const MAX_SECONDS = 86400.0f; // 24 hours in seconds

    var lapStartTime = 0;
    var lapStartDistance = 0.0f;
    var isInitialized = false; // Tracks if we've synced with the activity

    function initialize() {
        SimpleDataField.initialize();
        label = "EST BYU LAP TIME";
    }
   
    function onTimerLap() as Void {
        var info = Activity.getActivityInfo();
        if (info != null) {
            lapStartDistance = (info.elapsedDistance != null) ? info.elapsedDistance : 0.0f;
            lapStartTime = (info.timerTime != null) ? info.timerTime : 0;
        }
    }

    function onTimerReset() as Void {
        lapStartDistance = 0.0f;
        lapStartTime = 0;
        isInitialized = false; 
    }

    function compute(info as Activity.Info) as Numeric or Duration or String or Null {
        
        // Ensure we have GPS/timer data before doing math
        if (info == null || info.elapsedDistance == null || info.timerTime == null) {
            return "--:--";
        }

        // Handle mid-activity startup/recovery
        if (!isInitialized) {
            // If the timer is already running but our variables are 0, we sync them to NOW
            // to prevent the current lap distance from looking like the entire run distance.
            if (info.timerTime > 0 && lapStartTime == 0) {
                lapStartDistance = info.elapsedDistance;
                lapStartTime = info.timerTime;
            }
            isInitialized = true;
        }

        var currentLapDistance = info.elapsedDistance - lapStartDistance;
        var currentLapTime = info.timerTime - lapStartTime; // measured in milliseconds

        // Wait until we have moved at least 20 meters and time is positive
        if (currentLapTime <= 0 || currentLapDistance < 20.0f) {
            return "--:--";
        }

        // Calculate Lap Speed = distance / time (Meters per millisecond)
        var lapSpeed = currentLapDistance / currentLapTime.toFloat(); 

        // Prevent division by zero if we are standing perfectly still
        if (lapSpeed <= 0.0f) {
            return "--:--";
        }

        var estimatedTotalLapTimeMs = TARGET_LAP_DISTANCE_M / lapSpeed;
        
        // Convert milliseconds to total seconds using float math to prevent integer overflow
        var totalSecondsFloat = estimatedTotalLapTimeMs / 1000.0f;

        // Cap the float at our maximum allowed seconds BEFORE converting to Integer
        if (totalSecondsFloat > MAX_SECONDS || totalSecondsFloat <= 0.0f) {
            return "--:--";
        }

        // Now it's safe to cast to an integer
        var totalSeconds = totalSecondsFloat.toNumber();

        // Format into HH:MM:SS or MM:SS
        var hours = totalSeconds / 3600;
        var minutes = (totalSeconds % 3600) / 60;
        var seconds = totalSeconds % 60;

        if (hours > 0) {
            return hours.format("%d") + ":" + minutes.format("%02d") + ":" + seconds.format("%02d");
        } else {
            return minutes.format("%d") + ":" + seconds.format("%02d");
        }
    }
}
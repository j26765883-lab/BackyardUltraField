# Backyard Ultra Lap Predictor 🏃‍♂️⏳
**A Garmin Connect IQ Data Field for pacing Backyard Ultra races.**

In a Backyard Ultra, runners must complete a 4.167-mile (6706.14-meter) loop every single hour until only one runner remains. Pacing is everything—run too fast, and you burn out; run too slow, and you miss the cutoff. 

This custom Garmin Data Field calculates your **Estimated Lap Time** for the current loop based on your real-time average lap speed, helping you perfectly dial in your pace to get the exact amount of rest you want before the next yard begins.

## ✨ Features
* **Real-Time Estimation:** Predicts your total time for the current 4.167-mile lap based on your average speed since the lap began.
* **Lap Button Integration:** Automatically resets calculations when you trigger a new lap (via the physical lap button or auto-lap).
* **Mid-Run Recovery:** Safely handles mid-activity app restarts or data field additions without skewing your data.
* **Smart Stabilization:** Waits for 20 meters of movement before displaying an estimate to prevent erratic jumping at the start of a yard.
* **Clean Formatting:** Dynamically scales between `MM:SS` and `HH:MM:SS` formatting.

## ⚙️ Installation & Setup

### 1. Install via Connect IQ
1. Open the **Connect IQ Store** app on your smartphone.
2. Search for **Backyard Ultra Lap Predictor**.
3. Tap **Install** and wait for your watch to sync with your phone.

### 2. Add the Data Field to a Screen
Since this is a *Data Field* and not a standalone app, you need to add it to your existing running activity screens.
1. On your watch, open the activity you plan to use for the race (e.g., **Run**, **Trail Run**, or **Ultra Run**).
2. Hold the **Up/Menu** button to open the activity settings.
3. Select **[Activity Name] Settings** > **Data Screens**.
4. Scroll to the screen you want to edit (or add a new one) and press the **Start/Stop** button.
5. Select **Data Fields** and choose the specific field you want to replace.
6. Scroll down to **Connect IQ Fields** and select **Backyard Ultra Lap Time Estimator**.
7. Press the **Back** button to save your changes.

### 3. Configure Manual Laps (Important for BYUs!)
To ensure the math works perfectly for a Backyard Ultra, you must turn off Auto Lap and ensure the manual Lap Key is enabled. You want the app to reset *only* when you manually press the lap button at the start/end of a yard.
1. Hold the **Up/Menu** button from your watch face and go to your activity settings (e.g., **Trail Run Settings**).
2. Scroll to **Auto Lap** and ensure it is toggled **Off** (otherwise, the watch will reset the calculation every 1 mile/km).
3. Scroll to **Lap Key** and ensure it is toggled **On**. 
4. **During the race:** Simply press the physical **Lap** (bottom right) button right as the bell rings for a new yard. The data field will automatically reset and begin estimating your new loop time!

## 🤝 Contributing
Pull requests are welcome! If you have suggestions for improving battery efficiency, adding new features (like a dynamic "time remaining until the hour" field), or fixing bugs, feel free to open an issue or submit a PR.

## 📄 License
[MIT License](LICENSE)

# Lottie Animation in Flutter

This project demonstrates how to integrate and control Lottie animations in a Flutter application. Inspired by the animations seen in the Mrsool app, this implementation provides a smooth, interactive experience using the `AnimationController`.

## Implementation

- **Step 1: Add the Lottie Package:**: First, add the Lottie package to your `pubspec.yaml` file.
   ```bash
  dependencies:
    flutter:
      sdk: flutter
    lottie: ^last_version
 
- **Step 2: Add Lottie Animation JSON File:**: Make sure to include your Lottie animation JSON file in the assets/json/ directory. Update your pubspec.yaml to reference the assets.
   ```bash
   flutter:
     assets:
      - assets/json/
- **Step 3: Use the Lottie Widget**: Utilize the Lottie.asset widget to display the animation in your Flutter app.
  ```bash
   Lottie.asset(
        'assets/json/main_page.json',
        controller: _animationController,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.cover,
        onLoaded: (composition) {
          _animationController.duration = composition.duration;
          _playSegment();
        },
      )

- **Step 4: Use AnimationController**: Implement AnimationController for precise control over animation playback, including play, pause, and stop functionality.
  ```bash
   _animationController.forward();
   _animationController.stop();

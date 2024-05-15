### Example

1. Using Lottie animation:

```dart
import 'package:splasher/splasher.dart';

Splasher.withLottie(
  logo: 'assets/animations/app_logo.json', // Path to Lottie file
  backgroundColor: Colors.white,
  loadingText: 'Loading...',
  durationInSeconds: 3,
  navigator: HomeScreen(),
  // ... other customizations
);
```

2. Using image logo:

```dart
import 'package:splasher/splasher.dart';

Splasher.withImage(
  logo: AssetImage('assets/images/app_logo.png'), // Image asset
  backgroundColor: Colors.white,
  loadingText: 'Loading...',
  durationInSeconds: 3,
  navigator: HomeScreen(),
  // ... other customizations
);
```

### Screenshots

<img src="https://iili.io/J6GpHYX.gif" alt="drawing" width="200"/>

### Related Links

* [Splasher on pub.dev](https://pub.dev/packages/splasher)
* [Splasher on GitHub](https://github.com/magradze/splasher)
* [Lottie Files](https://lottiefiles.com/)

### Description

The **Splasher** widget allows you to customize various aspects of your splash screen:

* **App Title:** Displayed in the middle of the screen if no image is available.

* **Background Color:** Set the background color of the splash screen.

* **Background Image:** Optionally set a background image for the entire screen.

* **Logo:** Display a logo, either as an image or as a Lottie animation.

* **Loader:** Display a loader, such as a CircularProgressIndicator, while the app initializes.

* **Loading Text:** Optionally display text indicating that the app is loading.

* **Duration:** Specify how long the splash screen should remain visible before navigating to the main content.

* **Navigator:** Define where to navigate after the splash screen, either by specifying a route name or a widget.

* **Future Navigator:** Alternatively, provide a function that returns a future, and the navigation will occur once that future is complete.

* **Gradient Background:** Set a gradient background for the entire screen.

### Mini-Instructions

To use the **Splasher** widget:

1. Instantiate the **Splasher** widget with required parameters like the **logo**.

2. Optionally, customize other parameters like **backgroundColor**, **loadingText**, **durationInSeconds**, etc.

3. Specify the navigation destination either directly with **navigator** or using a future with **futureNavigator**.

4. Place the **Splasher** widget at the root of your app or wherever appropriate.

5. Run your application, and the splash screen will be displayed according to your configurations before navigating to the main content.

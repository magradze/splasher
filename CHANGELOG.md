## 0.0.6

**New Features:**

* **Factory constructors:**

  * Added two factory constructors: Splasher.withLottie and Splasher.withImage.

  * These constructors provide a more convenient way to create splash screens with either Lottie animations or images.

  * They simplify usage by:

    * Taking arguments specific to their use case (Lottie or image).

    * Automatically handling asset names for Lottie logos.

**Code Improvements:**

* **\_renderer method:**

  * Introduced a new private method \_renderer to handle logo rendering.

  * This method checks the file extension of the logo property to determine if it's a Lottie animation or an image.

  * Based on the extension, it returns the appropriate widget (Lottie.asset or Image.asset).

  * This improves code readability and separation of concerns.

**Documentation:**

The splasher package now offers two ways to create a splash screen:

1. Using Lottie animation:

```dart
Splasher.withLottie(
  logo: 'assets/animations/app_logo.json', // Path to Lottie file
  // ... other customizations
);
```

2. Using image logo:

```dart
Splasher.withImage(
  logo: AssetImage('assets/images/app_logo.png'), // Image asset
  // ... other customizations
);
```

These factory constructors make it easier to create splash screens with the desired logo type. The \_renderer method efficiently handles logo rendering based on the provided file.

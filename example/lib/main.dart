
import 'package:flutter/material.dart';
import 'package:splasher/splasher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.black,
  //     body: Splasher.withImage(
  //       logo: const AssetImage('assets/images/logo.png'),
  //       logoWidth: 200,
  //       backgroundColor: Colors.black,
  //       loadingText: const Text('Loading...'),
  //       navigator: const HomeScreen(),
  //       durationInSeconds: 10000,
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Splasher.withLottie(
          logo: 'assets/animations/logo.json',
          logoWidth: 200,
          title: const Text('Splasher'),
          backgroundColor: Colors.black,
          loadingText: const Text('Loading...'),
          navigator: const HomeScreen(),
          durationInSeconds: 3,
        ));
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

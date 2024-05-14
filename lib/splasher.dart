library splasher;

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splasher extends StatefulWidget {
  /// App title, shown in the middle of screen in case of no image available
  final Text? title;

  /// Page background color
  final Color backgroundColor;

  ///  Background image for the entire screen
  final ImageProvider? backgroundImage;

  /// logo width as in radius
  final double logoWidth;

  /// lottie file for logo
  final String logo;

  /// Loader color
  final Color loaderColor;

  /// Loading text
  final Text loadingText;

  /// Padding for long Loading text, default: EdgeInsets.all(0)
  final EdgeInsets loadingTextPadding;

  /// Background gradient for the entire screen
  final Gradient? gradientBackground;

  /// Whether to display a loader or not
  final bool showLoader;

  /// durationInSeconds to navigate after for time based navigation
  final int durationInSeconds;

  /// The page where you want to navigate if you have chosen time based navigation
  /// String or Widget
  final dynamic navigator;

  /// expects a function that returns a future, when this future is returned it will navigate
  /// Future<String> or Future<Widget>
  /// If both futureNavigator and navigator are provided, futureNavigator will take priority
  final Future<Object>? futureNavigator;
  const Splasher({
    super.key,
    this.loaderColor = Colors.black,
    this.futureNavigator,
    this.navigator,
    this.durationInSeconds = 3,
    required this.logo,
    this.logoWidth = 50,
    this.title,
    this.backgroundColor = Colors.white,
    this.loadingText = const Text(''),
    this.loadingTextPadding = const EdgeInsets.only(top: 10.0),
    this.backgroundImage,
    this.gradientBackground,
    this.showLoader = true,
  });

  @override
  State<Splasher> createState() => _SplasherState();
}

class _SplasherState extends State<Splasher> {
  @override
  void initState() {
    super.initState();
    if (widget.futureNavigator == null) {
      Timer(Duration(seconds: widget.durationInSeconds), () {
        if (widget.navigator is String) {
          Navigator.of(context).pushReplacementNamed(
            widget.navigator as String,
          );
        } else if (widget.navigator is Widget) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => widget.navigator as Widget));
        }
      });
    } else {
      widget.futureNavigator!.then((route) {
        if (route is String) {
          Navigator.of(context).pushReplacementNamed(route);
        } else if (route is Widget) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => route));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          if (widget.backgroundImage != null)
            Image(
              image: widget.backgroundImage!,
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.6),
              colorBlendMode: BlendMode.darken,
            ),
          if (widget.gradientBackground != null)
            Container(
              decoration: BoxDecoration(gradient: widget.gradientBackground),
            ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Lottie.asset(
                  widget.logo,
                  width: widget.logoWidth,
                  height: widget.logoWidth,
                  fit: BoxFit.cover,
                ),
                if (widget.title != null) widget.title!,
                if (widget.showLoader) ...[
                  const SizedBox(height: 20),
                  // CircularProgressIndicator(
                  //   valueColor:
                  //       AlwaysStoppedAnimation<Color>(widget.loaderColor),
                  // ),
                  if (widget.loadingText.data != '')
                    Padding(
                      padding: widget.loadingTextPadding,
                      child: widget.loadingText,
                    ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
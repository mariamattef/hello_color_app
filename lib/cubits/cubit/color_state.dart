import 'package:flutter/material.dart';

// Base state class
abstract class ColorState {
  final Color backgroundColor;
  final Color appBarAndFabColor;

  ColorState({required this.backgroundColor, required this.appBarAndFabColor});
}

class BackgroundColorChanged extends ColorState {
  BackgroundColorChanged(Color backgroundColor, Color appBarAndFabColor)
    : super(
        backgroundColor: backgroundColor,
        appBarAndFabColor: appBarAndFabColor,
      );
}

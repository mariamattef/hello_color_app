import 'package:flutter/material.dart';



abstract class ColorState {
  final Color backgroundColor;
  final Color appBarAndFabColor;

  ColorState({
    required this.backgroundColor,
    required this.appBarAndFabColor,
  });
}

class BackgroundColorChanged extends ColorState {
  BackgroundColorChanged(Color bgColor, Color appBarColor)
      : super(backgroundColor: bgColor, appBarAndFabColor: appBarColor);
}
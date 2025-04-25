import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Base state class
abstract class ColorState {
  final Color backgroundColor;
  final Color appBarAndFabColor;

  ColorState({
    required this.backgroundColor,
    required this.appBarAndFabColor,
  });
}

// State when background color changes
class BackgroundColorChanged extends ColorState {
  BackgroundColorChanged(Color backgroundColor, Color appBarAndFabColor)
      : super(
          backgroundColor: backgroundColor,
          appBarAndFabColor: appBarAndFabColor,
        );
}

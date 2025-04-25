import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_color_app/cubits/cubit/color_state.dart';


class ColorCubit extends Cubit<ColorState> {
  ColorCubit()
      : super(BackgroundColorChanged(Colors.white, Colors.blue)); 


  void changeBackgroundColor() {
    final random = Random();
    final newBackgroundColor = _randomColor(random);
    emit(BackgroundColorChanged(newBackgroundColor, state.appBarAndFabColor));
  }


  void changeAppBarAndFabColor() {
    final random = Random();
    final newColor = _randomColor(random);
    emit(BackgroundColorChanged(state.backgroundColor, newColor));
  }

  static Color _randomColor(Random random) {
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
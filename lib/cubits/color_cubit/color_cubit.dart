import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_color_app/cubits/color_cubit/color_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorCubit extends Cubit<ColorState> {
  ColorCubit()
      : super(BackgroundColorChanged(Colors.white, Colors.blue)) {
    _loadSavedColors();
  }

  final String _bgKey = 'backgroundColor';
  final String _barKey = 'appBarAndFabColor';

  void changeBackgroundColor(BuildContext context) {
    final newColor = _randomColor();
    emit(BackgroundColorChanged(newColor, state.appBarAndFabColor));
    _saveColors();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Background changed: ${_colorToHex(newColor)}')),
    );
  }

  void changeAppBarAndFabColor() {
    final newColor = _randomColor();
    emit(BackgroundColorChanged(state.backgroundColor, newColor));
    _saveColors();
  }

  Color _randomColor() {
    final rand = Random();
    return Color.fromARGB(255, rand.nextInt(256), rand.nextInt(256), rand.nextInt(256));
  }

  String _colorToHex(Color color) {
    return '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
  }

  Future<void> _saveColors() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_bgKey, state.backgroundColor.value);
    prefs.setInt(_barKey, state.appBarAndFabColor.value);
  }

  Future<void> _loadSavedColors() async {
    final prefs = await SharedPreferences.getInstance();
    final bg = prefs.getInt(_bgKey);
    final bar = prefs.getInt(_barKey);
    if (bg != null && bar != null) {
      emit(BackgroundColorChanged(Color(bg), Color(bar)));
    }
  }

  String get bgColorHex => _colorToHex(state.backgroundColor);
}
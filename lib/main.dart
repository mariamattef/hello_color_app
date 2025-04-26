import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_color_app/cubits/color_cubit/color_cubit.dart';
import 'package:hello_color_app/screens/color_screen.dart';

void main() {
  runApp(const HelloColorApp());
}

class HelloColorApp extends StatelessWidget {
  const HelloColorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ColorCubit(),
      child: const MaterialApp(
        home: HelloScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_color_app/cubits/cubit/color_cubit.dart';
import 'package:hello_color_app/cubits/cubit/color_state.dart';

class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorCubit, ColorState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => context.read<ColorCubit>().changeBackgroundColor(),
          child: Scaffold(
            backgroundColor: state.backgroundColor, // Change background color
            appBar: AppBar(
              backgroundColor: state.appBarAndFabColor, // Same color for AppBar
              title: const Text('Hello there'),
              centerTitle: true,
            ),
            body: const Center(
              child: Text(
                'Tap anywhere to change background\nTap FAB to change AppBar & FAB',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: state.appBarAndFabColor, // Same color for FAB
              onPressed:
                  () => context.read<ColorCubit>().changeAppBarAndFabColor(),
              child: const Icon(Icons.color_lens),
            ),
          ),
        );
      },
    );
  }
}

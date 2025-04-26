import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hello_color_app/cubits/color_cubit/color_cubit.dart';
import 'package:hello_color_app/cubits/color_cubit/color_state.dart';

class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorCubit, ColorState>(
      builder: (context, state) {
        final cubit = context.read<ColorCubit>();

        return Scaffold(
          appBar: AppBar(
            backgroundColor: state.appBarAndFabColor,
            title: const Text(
              'Hello there',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'monospace',
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            leading: const Icon(Icons.palette),
          ),
          body: GestureDetector(
            onTap: () => cubit.changeBackgroundColor(context),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              color: state.backgroundColor,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Hello there',

                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'monospace',
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Tap anywhere to change background\nFAB changes AppBar & FAB color',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'monospace',
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4.0,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        'BG Color: ${cubit.bgColorHex}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: state.appBarAndFabColor,
            onPressed: () => cubit.changeAppBarAndFabColor(),
            child: const Icon(Icons.color_lens),
          ),
        );
      },
    );
  }
}

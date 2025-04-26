# HelloColorApp

A simple Flutter app that demonstrates how to change the background color, AppBar, and FloatingActionButton colors dynamically. The colors are saved in **SharedPreferences** and are persisted even after the app is closed. The app uses **Cubit** from `flutter_bloc` for state management.

## Features

- **Change Background Color**: Tap anywhere on the screen to change the background color randomly.
- **Change AppBar and FAB Color**: Press the FloatingActionButton to change both the AppBar and FloatingActionButton colors.
- **Persist Colors**: The colors are saved using **SharedPreferences** and are loaded when the app restarts.
- **State Management**: Uses `flutter_bloc` (Cubit) to manage the app state.

## Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/your_username/hello_color_app.git
import 'package:flutter/material.dart';

import 'package:meals_app/categories.dart';
import 'package:meals_app/tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  // textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(
      ProviderScope(
          child: App() ) );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: theme,
        home: tabBar(),
    );
  }
}
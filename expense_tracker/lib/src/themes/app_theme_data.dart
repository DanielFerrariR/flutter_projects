import 'package:flutter/material.dart';

class AppThemeData {
  final ColorScheme _colorScheme =
      ColorScheme.fromSeed(seedColor: Colors.deepPurple);

  final ColorScheme _darkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Color.fromARGB(255, 6, 13, 17),
  );

  ThemeData get lightTheme {
    return ThemeData().copyWith(
      useMaterial3: true,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      colorScheme: _colorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: _colorScheme.onPrimaryContainer,
        foregroundColor: _colorScheme.primaryContainer,
      ),
      cardTheme: const CardTheme().copyWith(
        color: _colorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _colorScheme.primaryContainer,
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: _colorScheme.onSecondaryContainer,
              fontSize: 16,
            ),
          ),
    );
  }

  ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
        useMaterial3: true,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        colorScheme: _darkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: _darkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: _darkColorScheme.primaryContainer,
            foregroundColor: _darkColorScheme.onPrimaryContainer,
          ),
        ));
  }
}

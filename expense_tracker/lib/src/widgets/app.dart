import 'package:flutter/material.dart';

import 'package:expense_tracker/src/widgets/expenses/expenses.dart';
import 'package:expense_tracker/src/themes/app_theme_data.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: AppThemeData().darkTheme,
      theme: AppThemeData().lightTheme,
      // themeMode: ThemeMode.system, // default
      home: const Expenses(),
    );
  }
}

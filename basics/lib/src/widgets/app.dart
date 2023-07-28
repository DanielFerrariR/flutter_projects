import 'package:flutter/material.dart';

import 'dice_roller.dart';
import 'gradient_container.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          [Colors.red, Colors.yellow],
          child: DiceRoller(),
        ),
      ),
    );
  }
}

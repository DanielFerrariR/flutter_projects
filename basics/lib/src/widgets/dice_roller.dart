import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  var _currentDiceRoll = 2;

  void _rollDice() {
    setState(() {
      _currentDiceRoll = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/dice-$_currentDiceRoll.png',
            width: 200,
          ),
          const Gap(20),
          TextButton(
            onPressed: _rollDice,
            style: TextButton.styleFrom(
              // padding: const EdgeInsets.only(
              //   top: 20,
              // ),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 28),
            ),
            child: const Text('Roll Dice'),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:adv_basics/src/data/questions.dart';
import 'questions_screen/questions_screen.dart';
import 'results_screen/results_screen.dart';
import 'start_screen/start_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  String _activeScreen = 'start-screen';
  List<String> _selectedAnswers = [];
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   super.initState();
  //   activeScreen = StartScreen(switchScreen);
  // }

  void _switchScreen() {
    setState(() {
      // activeScreen = const QuestionsScreen();
      _activeScreen = 'questions-screen';
    });
  }

  void _chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        _activeScreen = 'results-screen';
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      _activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(_switchScreen);

    if (_activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectedAnswer: _chooseAnswer);
    }

    if (_activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
          chosenAnswers: _selectedAnswers, restartQuiz: _restartQuiz);
    }

    return MaterialApp(
      theme: ThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 56, 0, 83),
                Color.fromARGB(255, 120, 9, 176),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

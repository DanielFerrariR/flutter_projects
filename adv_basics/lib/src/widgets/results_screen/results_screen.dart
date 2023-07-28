import 'package:flutter/material.dart';
import 'package:adv_basics/src/utils/list_gap_extension.dart';
import 'package:adv_basics/src/data/questions.dart';

import 'questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.restartQuiz,
  });

  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var index = 0; index < chosenAnswers.length; index++) {
      summary.add({
        'question_index': index,
        'question': questions[index].text,
        'correct_answer': questions[index].answers[0],
        'user_answer': chosenAnswers[index]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 183, 95, 255),
              ),
            ),
            QuestionsSummary(summaryData),
            TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              onPressed: restartQuiz,
              icon: const Icon(
                Icons.replay_outlined,
                color: Colors.white,
              ),
              label: const Text(
                'Restart quiz!',
                style: TextStyle(color: Colors.white),
              ),
            )
          ].withSpaceBetween(32),
        ),
      ),
    );
  }
}

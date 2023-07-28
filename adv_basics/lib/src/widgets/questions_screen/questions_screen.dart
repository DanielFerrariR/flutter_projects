import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adv_basics/src/utils/list_gap_extension.dart';
import 'package:adv_basics/src/data/questions.dart';

import 'answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var _currentQuestionIndex = 0;

  void _answerQuestion(String answer) {
    widget.onSelectedAnswer(answer);
    setState(() {
      _currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[_currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  currentQuestion.text,
                  style: GoogleFonts.lato(
                      color: const Color.fromARGB(255, 206, 131, 255),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const Gap(16),
              ...[
                for (final answer in currentQuestion.shuffledAnswers)
                  AnswerButton(
                    answer,
                    onTap: () {
                      _answerQuestion(answer);
                    },
                  )
              ].withSpaceBetween(8)
            ]),
      ),
    );
  }
}

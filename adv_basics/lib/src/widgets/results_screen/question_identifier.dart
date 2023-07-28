import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier({
    super.key,
    required this.isCorrectAnswer,
    required this.questionIndex,
  });

  final int questionIndex;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer
            ? const Color.fromARGB(255, 81, 195, 252)
            : const Color.fromARGB(255, 254, 61, 135),
        shape: BoxShape.circle,
      ),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

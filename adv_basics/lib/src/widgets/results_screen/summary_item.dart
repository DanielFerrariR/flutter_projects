import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({super.key, required this.itemData});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    var isCorrectAnswer = itemData['user_answer'] == itemData['correct_answer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          isCorrectAnswer: isCorrectAnswer,
          questionIndex: itemData['question_index'] as int,
        ),
        const Gap(16),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                itemData['question'] as String,
                style: const TextStyle(color: Colors.white),
              ),
              const Gap(8),
              Text(
                'Yours: ${itemData['user_answer'] as String}',
                style: const TextStyle(
                  color: Color.fromARGB(255, 254, 61, 135),
                ),
              ),
              Text(
                'Correct: ${itemData['correct_answer'] as String}',
                style: const TextStyle(
                  color: Color.fromARGB(255, 81, 195, 252),
                ),
              ),
            ],
          ),
        ),
      ],
    );
    ;
  }
}

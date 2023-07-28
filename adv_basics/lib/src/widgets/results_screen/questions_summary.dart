import 'package:adv_basics/src/utils/list_gap_extension.dart';
import 'package:flutter/material.dart';

import 'summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (final itemData in summaryData) SummaryItem(itemData: itemData)
          ].withSpaceBetween(8),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

extension ListSpaceBetweenExtension on List<Widget> {
  List<Widget> withSpaceBetween(double gap) => [
        if (isNotEmpty) this[0],
        for (var index = 1; index < length; index++) ...[
          Gap(gap),
          this[index],
        ],
      ];
}

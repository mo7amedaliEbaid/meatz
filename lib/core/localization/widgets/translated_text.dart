import 'package:flutter/material.dart';

import '../repositories/localization.dart';

class TranslatedText extends StatelessWidget {
  final String translationKey;
  final TextStyle textStyle;

  const TranslatedText({
    Key? key,
    required this.translationKey,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalization = AppLocalization.of(context);
    final translatedText = appLocalization.getTranslatedValue(translationKey);

    return Text(
      translatedText ?? '', // Handle null value gracefully
      style: textStyle,
    );
  }
}


 // Definition for singly-linked list.
  class ListNode {
    int val;
    ListNode? next;
   ListNode([this.val = 0, this.next]);
}
class Solution {
  int getDecimalValue(ListNode? head) {
    if (head == null) return 0; // Return 0 if the head is null

    List<int> values = [];
    ListNode? current = head;

    while (current != null) {
      values.add(current.val);
      current = current.next;
    }

    // Convert the binary list to a decimal number
    int decimalValue = 0;
    for (int i = 0; i < values.length; i++) {
      decimalValue = decimalValue * 2 + values[i];
    }

    return decimalValue;
  }
}

import 'package:flutter/material.dart';
import 'package:tp_flutter/choice_item.dart';
import 'core/models/Tag.dart';


class Footer extends StatelessWidget {
  final List<Tag> choices;
  final ValueChanged<Tag> onSelect;

  const Footer({super.key, required this.choices, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SingleChildScrollView(
        child: Wrap(
          spacing: 8,
          runSpacing: 6,
          children: choices.map((Tag choice) => ChoiceItem(
            choice: choice,
            onSelect: () => onSelect(choice),
            isClickable: true,
          )).toList(),
        ),
      ),
    );
  }
}

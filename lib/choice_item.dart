import 'package:flutter/material.dart';
import 'package:tp_flutter/core/models/Tag.dart';

class ChoiceItem extends StatelessWidget {
  final Tag choice;
  final VoidCallback? onSelect;
  final bool isClickable;

  const ChoiceItem({super.key, required this.choice, this.onSelect, required this.isClickable});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isClickable ? onSelect : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
            ),
          ],
        ),
        child: Text(
          choice.title,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

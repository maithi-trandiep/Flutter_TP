import 'package:flutter/material.dart';
import 'package:tp_flutter/choice_item.dart';
import 'package:tp_flutter/tag_detail_page.dart';

import 'core/models/Tag.dart';

class Header extends StatelessWidget {
  final List<Tag> selectedChoices;
  final Color color;

  const Header({super.key, required this.selectedChoices, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Vos choix :',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              if (selectedChoices.isEmpty)
                const Text(
                  'Cliquez sur les choix en dessous !',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: selectedChoices.map((Tag choice) => Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TagDetailPage(tag: choice),
                          ),
                        );
                      },
                      child: ChoiceItem(
                        choice: choice,
                        isClickable: false,
                      ),
                    ),
                  )).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

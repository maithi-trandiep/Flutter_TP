import 'package:flutter/material.dart';
import 'package:tp_flutter/choice_item.dart';

class Header extends StatelessWidget {
  final List<String> selectedChoices;
  final Color color;

  const Header({super.key, required this.selectedChoices, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Vos choix :',
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Cliquez sur les choix en dessous !',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                for (var choice in selectedChoices)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: ChoiceItem(
                      choice: choice,
                      isClickable: false,
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

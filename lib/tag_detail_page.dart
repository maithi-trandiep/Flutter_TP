import 'package:flutter/material.dart';
import 'core/models/Tag.dart';

class TagDetailPage extends StatelessWidget {
  final Tag tag;

  const TagDetailPage({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tag.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Titre : ${tag.title}', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            Text('Description : ${tag.description}', style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

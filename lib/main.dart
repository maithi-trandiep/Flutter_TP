import 'package:flutter/material.dart';
import 'package:tp_flutter/header.dart';
import 'package:tp_flutter/footer.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'core/models/Tag.dart';
import 'core/services/api_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Tag> selectedChoices = [];
  Color headerColor = Colors.purple;
  late Future<List<Tag>> listTags;

  void changeColor(Color color) => setState(() {
    headerColor = color;
  });

  void changeChoice(Tag choice) {
    setState(() {
      if (selectedChoices.contains(choice)) {
        selectedChoices.remove(choice);
      } else {
        selectedChoices.add(choice);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    listTags = ApiServices.getTags();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Header(
              selectedChoices: selectedChoices,
              color: headerColor,
            ),
          ),
          Expanded(
            flex: 1,
            child: FutureBuilder<List<Tag>>(
              future: listTags,
              builder: (context, snapshot) {
                final isLoading = snapshot.connectionState == ConnectionState.waiting;
                if (isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error!.toString()),
                    );
                  }

                  if (snapshot.hasData) {
                    return Footer(
                      choices: snapshot.data!,
                      onSelect: changeChoice,
                    );
                  }

                  return const SizedBox();
                }
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Choisissez une couleur !'),
                content: SingleChildScrollView(
                  child: ColorPicker(
                    pickerColor: headerColor,
                    onColorChanged: changeColor,
                    pickerAreaHeightPercent: 0.8,
                  ),
                ),
                actions: <Widget>[
                  ElevatedButton(
                    child: const Text('Confirmer'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.palette),
      ),
    );
  }
}
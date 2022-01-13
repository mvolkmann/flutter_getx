import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'game_controller.dart';

class ScoreEntry extends StatefulWidget {
  const ScoreEntry({Key? key}) : super(key: key);

  @override
  _ScoreEntryState createState() => _ScoreEntryState();
}

class _ScoreEntryState extends State<ScoreEntry> {
  final GameController ctrl = Get.find();

  final tec = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: tec,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'score',
              labelText: 'Score'),
          keyboardType: TextInputType.number,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: tec,
              builder: (context, value, child) {
                return ElevatedButton(
                  child: Text('Save'),
                  onPressed: value.text.isEmpty ? null : save,
                );
              },
            ),
            ElevatedButton(
              child: Text('Reset'),
              onPressed: () => ctrl.clearScores(),
            ),
          ],
        ),
      ],
    );
  }

  void save() {
    var score = int.parse(tec.text);
    if (score != 0) ctrl.addScore(score);
    tec.clear();
  }
}

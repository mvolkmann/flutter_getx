import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'game_controller.dart';

// This needs to be stateful in order
// to hold a TextEditingController instance.
class ScoreEntry extends StatefulWidget {
  const ScoreEntry({Key? key}) : super(key: key);

  @override
  _ScoreEntryState createState() => _ScoreEntryState();
}

class _ScoreEntryState extends State<ScoreEntry> {
  final gameCtrl = Get.find<GameController>();

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
            // This is necessary so onPressed can be updated
            // when the text in the TextEditingController changes.
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: tec,
              builder: (context, value, child) {
                return ElevatedButton(
                  child: Text('Save'),
                  onPressed: value.text.isEmpty ? null : save,
                );
              },
            ),
            SizedBox(width: 10),
            ElevatedButton(
              child: Text('Reset'),
              onPressed: () => gameCtrl.clearScores(),
            ),
          ],
        ),
      ],
    );
  }

  void save() {
    var score = int.parse(tec.text);
    if (score != 0) gameCtrl.addScore(score);
    tec.clear();
  }
}

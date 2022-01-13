import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'player_controller.dart';

class PlayerEntry extends StatefulWidget {
  const PlayerEntry({Key? key}) : super(key: key);

  @override
  _PlayerEntryState createState() => _PlayerEntryState();
}

class _PlayerEntryState extends State<PlayerEntry> {
  final PlayerController playerCtrl = Get.find();

  final tec = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: tec,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'player name',
                labelText: 'Player'),
          ),
        ),
        SizedBox(width: 10),
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: tec,
          builder: (context, value, child) {
            return ElevatedButton(
              child: Text('Save'),
              onPressed: value.text.isEmpty ? null : save,
            );
          },
        ),
      ],
    );
  }

  void save() {
    playerCtrl.setName(tec.text);
  }
}

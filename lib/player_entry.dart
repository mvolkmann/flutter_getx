import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'player_controller.dart';

class PlayerEntry extends StatefulWidget {
  const PlayerEntry({Key? key}) : super(key: key);

  @override
  _PlayerEntryState createState() => _PlayerEntryState();
}

class _PlayerEntryState extends State<PlayerEntry> {
  // How does Get.find get the correct controller?
  // Is it based on the type of the left-hand side?
  final PlayerController playerCtrl = Get.find();

  final tec = TextEditingController();

  @override
  void initState() {
    tec.text = playerCtrl.name.value;
    super.initState();
  }

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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'player_controller.dart';

// This needs to be stateful in order
// to hold a TextEditingController instance.
class PlayerEntry extends StatefulWidget {
  const PlayerEntry({Key? key}) : super(key: key);

  @override
  _PlayerEntryState createState() => _PlayerEntryState();
}

class _PlayerEntryState extends State<PlayerEntry> {
  final playerCtrl = Get.find<PlayerController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'player name',
              labelText: 'Player',
            ),
            initialValue: playerCtrl.name,
            onChanged: (String name) {
              playerCtrl.name = name;
            },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'player_controller.dart';

class PlayerEntry extends StatelessWidget {
  PlayerEntry({Key? key}) : super(key: key);

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

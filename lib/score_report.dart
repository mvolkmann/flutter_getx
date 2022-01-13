import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'game_controller.dart';
import 'player_controller.dart';

class ScoreReport extends StatelessWidget {
  //final GameController gameCtrl = Get.find();
  final gameCtrl = Get.find<GameController>();
  final playerCtrl = Get.find<PlayerController>();

  ScoreReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // Widgets that need to update when controller data changes
      // need to be wrapped in Obx.
      Obx(() => Text('Player is ${playerCtrl.name}')),
      Obx(() => Text('Total is ${gameCtrl.total}')),
      Obx(() => Text('Average is ${gameCtrl.average.toStringAsFixed(2)}')),
    ]);
  }
}

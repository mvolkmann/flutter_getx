import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'game_controller.dart';

class ScoreReport extends StatelessWidget {
  final GameController ctrl = Get.find();

  ScoreReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // Widgets that need to update when controller data changes
      // need to be wrapped in Obx.
      Obx(() => Text('Total is ${ctrl.total}')),
      Obx(() => Text('Average is ${ctrl.average.toStringAsFixed(2)}')),
    ]);
  }
}

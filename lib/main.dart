import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'game_controller.dart';
import 'player_controller.dart';
import 'player_entry.dart';
import 'score_entry.dart';
import 'score_report.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Change MaterialApp to GetMaterialApp here to use features of GetX
    // not related to state management such as navigation.
    return MaterialApp(
      title: 'GetX Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Register controllers with GetX so other widgets can find them.
    final GameController ctrl = Get.put(GameController());
    Get.put(PlayerController());

    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PlayerEntry(),
            ScoreEntry(),
            ScoreReport(),
            Obx(() => Text('Number of scores = ${ctrl.scores.length}')),
          ],
        ),
      ),
    );
  }
}

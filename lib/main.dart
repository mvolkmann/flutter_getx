import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'game_controller.dart';
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
    // Register GameController with GetX so other widgets can find it.
    final GameController ctrl = Get.put(GameController());

    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ScoreEntry(),
            ScoreReport(),
            Obx(() => Text('Number of scores = ${ctrl.scores.length}')),
          ],
        ),
      ),
    );
  }
}

import 'package:get/get.dart';

int sum(List<int> numbers) =>
    numbers.isEmpty ? 0 : numbers.reduce((acc, score) => acc + score);

class GameController extends GetxController {
  final _scores = <int>[].obs; // observable List of int values

  void addScore(int score) {
    _scores.add(score);
    update(); // notifies listeners
  }

  void clearScores() {
    _scores.clear();
    update();
  }

  double get average => _scores.isEmpty ? 0 : sum(_scores) / _scores.length;

  int get count => _scores.length;

  int get total => sum(_scores);
}

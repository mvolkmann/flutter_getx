import 'package:get/get.dart';

int sum(List<int> numbers) =>
    numbers.isEmpty ? 0 : numbers.reduce((acc, score) => acc + score);

class GameController extends GetxController {
  //var scores = <int>[].obs; // observable List of int values
  //var scores = RxList<int>([1, 2, 3]); // observable List of int values
  var scores = <int>[].obs; // observable List of int values

  void addScore(int score) {
    scores.add(score);
    update(); // notifies listeners
  }

  void clearScores() {
    scores.clear();
    update();
  }

  double get average => scores.isEmpty ? 0 : sum(scores) / scores.length;

  int get total => sum(scores);
}

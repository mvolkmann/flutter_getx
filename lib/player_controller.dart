import 'package:get/get.dart';

class PlayerController extends GetxController {
  var name = 'Mark'.obs; // observable String

  void setName(String value) {
    name.value = value;
    update();
  }
}

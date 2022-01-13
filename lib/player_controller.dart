import 'package:get/get.dart';

class PlayerController extends GetxController {
  final name = 'Mark'.obs; // observable String

  void setName(String value) {
    // name is an RxString.
    // We need to add .value to set its value.
    name.value = value;
    update();
  }
}

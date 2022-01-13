import 'package:get/get.dart';

class PlayerController extends GetxController {
  final _name = 'Mark'.obs; // observable String

  // _name is an RxString.
  // We need to add .value to get its value.
  String get name => _name.value;

  set name(String value) {
    _name.value = value;
    update();
  }
}

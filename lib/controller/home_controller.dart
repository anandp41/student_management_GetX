import 'package:get/get.dart';

class HomeController extends GetxController {
  bool _isListOn = true;
  bool get isListOn => _isListOn;
  void toggleListView() {
    _isListOn = !_isListOn;
    update();
  }
}

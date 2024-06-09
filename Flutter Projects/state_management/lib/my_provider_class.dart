import 'package:flutter/cupertino.dart';

class MyProviderClass extends ChangeNotifier {
  String text = "Initial Text";

  void changeText(String data) {
    text = data;
    notifyListeners();
  }
}
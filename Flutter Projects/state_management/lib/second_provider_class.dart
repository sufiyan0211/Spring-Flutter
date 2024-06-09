import 'package:flutter/cupertino.dart';


class SecondProviderClass extends ChangeNotifier {
  String text2 = "Initial Text2";

  void changeText2(String data) {
    text2 = data;
    notifyListeners();
  }
}
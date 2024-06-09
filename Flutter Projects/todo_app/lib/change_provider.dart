import 'package:flutter/cupertino.dart';

class ChangeNotifictionCustom extends ChangeNotifier {
  String someText = '';

  void setProvider(String data) {
    someText = data;
    notifyListeners();
  }
}
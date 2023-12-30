import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "This is Title",
      home: Scaffold(
        appBar: AppBar(
          title: Text("This is appBar title"),
        ),
        body: Center(child: Text("Hello World")),
      ),
    );
  }
}

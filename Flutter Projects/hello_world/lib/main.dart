import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp1());
}

class MyApp1 extends StatelessWidget {

  const MyApp1({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My First Flutter App1",
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First Flutter App1"),
        ),
         body: const Center(
           child: Text("Hello World App2"),
         ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
        ),
      )
    );
  }

}
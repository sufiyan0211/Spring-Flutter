import 'package:flutter/material.dart';
import 'package:state_management/second_page.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String someText = "Initial Text";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(someText, style: TextStyle(fontSize: 20)),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  someText = "Text Changed from home screen";
                });
              },
              child: const Text('Change Text'),
            ),
            ElevatedButton(
              onPressed: () {
                navigateToSecondPage();
              },
              child: const Text('Go to Second Page'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> navigateToSecondPage() async {
    final route = MaterialPageRoute(builder: (context) => SecondPage(text: someText));
    await Navigator.push(context, route);
  }

}

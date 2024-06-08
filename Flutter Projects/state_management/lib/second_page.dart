import 'package:flutter/material.dart';


class SecondPage extends StatefulWidget {

  final String text;

  const SecondPage({super.key, required this.text});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late String text;

  @override
  void initState() {
    super.initState();
    text = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(text, style: const TextStyle(fontSize: 20)),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  text = "Text Changed from second screen";
                });
              },
              child: const Text('Change Text'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}


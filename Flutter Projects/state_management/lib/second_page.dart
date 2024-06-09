import 'package:flutter/material.dart';
import 'package:state_management/my_provider_class.dart';
import 'package:provider/provider.dart';


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
            Consumer<MyProviderClass>(
              builder: (context, provider, child) {
                return Text(provider.text, style: const TextStyle(fontSize: 20));
              },
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<MyProviderClass>(context, listen: false).changeText(
                    "2nd screen");
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


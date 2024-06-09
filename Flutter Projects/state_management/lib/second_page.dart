import 'package:flutter/material.dart';
import 'package:state_management/my_provider_class.dart';
import 'package:state_management/second_provider_class.dart';
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
            Consumer<SecondProviderClass>(
              builder: (context, secondProvider, child) {
                return Text(secondProvider.text2, style: const TextStyle(fontSize: 20));
              },
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<SecondProviderClass>(context, listen: false).changeText2(
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


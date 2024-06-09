import 'package:flutter/material.dart';

import 'home_page.dart';
import 'my_provider_class.dart';
import 'second_provider_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';


void main() {
  // runApp(const MyApp());

  // runApp(ChangeNotifierProvider<MyProviderClass>(
  //   create: (context) => MyProviderClass(),
  //   child: MyApp(),
  // ));

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<MyProviderClass>(
        create: (context) => MyProviderClass(),
      ),
      ChangeNotifierProvider<SecondProviderClass>(
        create: (context) => SecondProviderClass(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}


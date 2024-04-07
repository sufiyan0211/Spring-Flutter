import 'package:flutter/material.dart';
import 'package:responsive_project/responsive/desktop_body.dart';
import 'package:responsive_project/responsive/mobile_body.dart';
import 'package:responsive_project/responsive/responsive_layout.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: const MobileBody(),
        desktopBody: const DesktopBody(),
      )
    );
  }
}
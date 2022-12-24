import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loadanimate/Widgets/loading_widget.dart';
import 'package:loadanimate/responsive/mobile_layout.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MobileLayout()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          LoadingWidget(),
          SizedBox(
            height: 16,
          ),
          Text(
            "Loading...",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      )),
    );
  }
}

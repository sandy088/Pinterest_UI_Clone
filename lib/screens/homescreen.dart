import 'package:flutter/material.dart';
import 'package:loadanimate/Widgets/dumy_list.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: DummyList()),
    );
  }
}

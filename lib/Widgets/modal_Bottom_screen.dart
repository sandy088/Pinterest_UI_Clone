import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container();
          });
    });
  }
}

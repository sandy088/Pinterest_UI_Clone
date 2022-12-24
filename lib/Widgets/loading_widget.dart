import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..repeat();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const count = 6;
    const minheight = 10.0;
    const maxHeight = 30.0;
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          double t = controller.value;
          int current = (count * t).floor();
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              count,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 700 ~/ count),
                margin: index == (count - 1)
                    ? EdgeInsets.zero
                    : const EdgeInsets.only(right: 5),
                height: index == current ? maxHeight : minheight,
                width: 5,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(9999)),
              ),
            ),
          );
        });
  }
}

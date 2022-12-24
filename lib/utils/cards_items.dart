import 'package:flutter/material.dart';
import 'package:loadanimate/Widgets/corousal_cards.dart';

const cards = [
  Corusalcard(icon: Icons.rocket_launch, label: 'Rocket'),
  Corusalcard(icon: Icons.rocket_launch_rounded, label: '2nd Rocket'),
  Corusalcard(icon: Icons.rocket_launch, label: '3rd Rocket'),
];

final carousalController = PageController(viewportFraction: 0.7);

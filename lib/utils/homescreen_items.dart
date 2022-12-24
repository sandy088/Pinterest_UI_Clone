import 'package:flutter/material.dart';
import 'package:loadanimate/screens/feed_screen.dart';
import 'package:loadanimate/screens/search_screen.dart';

final homescreenItems = [
  const FeedScreen(),
  const Center(child: SearchScreen()),
  const Center(child: Text("Coming Soon")),
];

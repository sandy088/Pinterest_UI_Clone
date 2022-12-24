import 'package:flutter/material.dart';
import 'package:loadanimate/screens/detail_page.dart';
import 'package:loadanimate/screens/feed_screen.dart';

import 'package:loadanimate/screens/loading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/feed': (context) => const FeedScreen(),
        '/detail': (context) => const DetailPage(),
      },
      home: const LoadingScreen(),
    );
  }
}

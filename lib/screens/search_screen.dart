import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 234, 234, 234),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, top: 6, bottom: 6, right: 4),
                  child: Row(children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.search),
                    ),
                    Expanded(child: Text("Search for Ideas")),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.camera_alt_outlined),
                    ),
                  ]),
                ),
              ),
              const Expanded(
                child: Center(
                  child: Icon(
                    Icons.search,
                    size: 150,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MyStoryBar extends StatelessWidget {
  final List<double> percentWatcher;

  const MyStoryBar({super.key, required this.percentWatcher});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 10,
      right: 10,
      child: Row(
        children: List.generate(percentWatcher.length, (index) {
          double percent = index < percentWatcher.length ? percentWatcher[index] : 0.0;
          return Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 2),
              child: LinearProgressIndicator(
                value: percent,
                backgroundColor: Colors.white.withOpacity(0.5),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          );
        }),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MyStory1 extends StatelessWidget {
  const MyStory1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Text('i love Jonathan', style: TextStyle(color: Colors.white, fontSize: 30)),
      ),
    );
  }
}
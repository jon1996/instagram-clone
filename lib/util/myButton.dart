import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  String? txt;
  Mybutton({super.key, this.txt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: 165,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(
              7), // Adjust the radius for the circular shape
        ),
        child: Center(
          child: Text(
            txt!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

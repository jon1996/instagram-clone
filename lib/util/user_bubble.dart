// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class UserBubble extends StatelessWidget {
  String txt = '';
   UserBubble({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40, // Adjust size as needed
            backgroundImage: NetworkImage(
                'https://practicaltyping.com/wp-content/uploads/2020/02/ichigo.jpg'), // Replace with your image URL
          ),
          Text(txt,style: TextStyle(fontSize: 12),),
        ],
      ),
    );
  }
}

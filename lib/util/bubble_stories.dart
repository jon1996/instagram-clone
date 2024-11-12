// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../model/user.dart';

class BubbleStories extends StatelessWidget {
  final User user;
  final VoidCallback? onViewStory;
  final VoidCallback? onAddStory;

  const BubbleStories({
    Key? key,
    required this.user,
    this.onViewStory,
    this.onAddStory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: user.isUser ? onAddStory : onViewStory,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: user.hasGradient && !user.isNormalUser
                        ? LinearGradient(
                            colors: [Colors.purple, Colors.orange],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )
                        : null,
                  ),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(user.avatar), // Show avatar by default
                    backgroundColor: Colors.grey[300],
                  ),
                ),
                if (user.isUser && !user.isNormalUser)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.add, color: Colors.white, size: 20),
                    ),
                  ),
              ],
            ),
          ),
          Text(user.name, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}

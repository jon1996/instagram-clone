import 'package:flutter/material.dart';

import '../model/user_data.dart';

class Userappbar extends StatelessWidget {
  final UserInfo? userInfo;
  const Userappbar({this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28.0), // Add padding for alignment
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 40, // Adjust size as needed
              backgroundImage: NetworkImage(userInfo?.avatar ??
                  'https://practicaltyping.com/wp-content/uploads/2020/02/ichigo.jpg'), // Replace with your image URL
            ),

            // Plus Icon Button
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 30, // Adjust size as needed
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
        Column(children: [
          Text(userInfo?.posts?.length.toString() ?? "0",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          Text(
            'Posts',
          ),
        ]),
        Column(children: [
          Text(userInfo?.followers.toString() ?? "0",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          Text(
            'Followers',
          ),
        ]),
        Column(children: [
          Text(userInfo?.following.toString() ?? "0",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          Text(
            'following',
          ),
        ]),
        SizedBox(
          width: 7,
        )
      ]),
    );
  }
}

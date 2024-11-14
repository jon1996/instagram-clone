// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/user_data.dart';
import '../pages/user_page.dart';

class UserPosts extends StatelessWidget {
  final UserInfo userInfo;

  const UserPosts({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // Optional: to add a background color
                        image: DecorationImage(
                          image: NetworkImage(userInfo.avatar), // Image URL
                          fit: BoxFit
                              .cover, // This ensures the image covers the whole circle
                        ),
                      ),
                    ),
                    SizedBox(width: 7),
                    GestureDetector(
                      onTap: () {
                        // Navigate to UserDetailsPage with the userInfo data
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserPage(userInfo: userInfo),
                          ),
                        );
                      },
                      child: Text(
                        userInfo.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Icon(Icons.more_horiz),
              ],
            )),
        Container(
          height: 400,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  userInfo.posts!.first.imageUrl!.first), // Image URL
              fit: BoxFit
                  .cover, // This ensures the image covers the whole circle
            ),
          ),
        ),
        // below the post
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.favorite_border_outlined),
                      SizedBox(width: 3),
                      Text(
                        userInfo.posts!.first.likes.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.comment,
                          color: Colors.black, // Customize color
                          size: 24, // Customize size
                        ),
                        SizedBox(width: 3),
                        Text(
                          userInfo.posts!.first.comments!.length.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.paperPlane,
                          color: Colors.black, // Customize color
                          size: 24, // Customize size
                        ),
                        SizedBox(width: 3),
                        Text(
                          userInfo.posts!.first.shared.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Icon(
                Icons.bookmark_border_outlined,
                weight: 60,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              Text('Liked by '),
              Text(
                'Bahavu',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(' and '),
              Text(
                'others',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        // captions
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 8),
          child: Align(
            alignment: Alignment
                .centerLeft, // Aligns the RichText to the left within its container
            child: RichText(
                textAlign: TextAlign.start,
                text:
                    TextSpan(style: TextStyle(color: Colors.black), children: [
                  TextSpan(
                    text: userInfo.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: userInfo.bio,
                  )
                ])),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text(
                userInfo.posts!.first.comments!.first.userName!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 3),
              Text(
                userInfo.posts!.first.comments!.first.text!,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        )
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserPosts extends StatelessWidget {
  final String name;
  const UserPosts({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 20.0,right: 20,bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey[300], shape: BoxShape.circle),
                    ),
                    SizedBox(width: 7),
                    Text(
                      name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Icon(Icons.more_horiz),
              ],
            )),
        Container(
          height: 300,
          color: Colors.grey[300],
        ),
        // below the post
        const Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.favorite_border_outlined),
                      Text(
                        "47",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: FaIcon(
                      FontAwesomeIcons.comment,
                      color: Colors.black, // Customize color
                      size: 24, // Customize size
                    ),
                  ),
                  FaIcon(
                    FontAwesomeIcons.paperPlane,
                    color: Colors.black, // Customize color
                    size: 24, // Customize size
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
    alignment: Alignment.centerLeft, // Aligns the RichText to the left within its container
    child: RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        style: TextStyle(color: Colors.black), 
        children: [
          TextSpan(
            text: name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: ' posted a photo ',
          )
        ]
      )
    ),
  ),
),

      ],
    );
  }
}

/* return Column(
      children: [
        Container(
          height: 400,
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment:
                  Alignment.topLeft, // Aligns content to the top-left corner
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 24, 24, 24),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text("Name"),
                ],
              ),
            ),
          ),
        ),
      ],
    );****/
import 'package:flutter/material.dart';

class Userappbar extends StatelessWidget {
  const Userappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding:
                const EdgeInsets.only(left: 28.0), // Add padding for alignment
            child: 
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      // Profile Picture
                      CircleAvatar(
                        radius: 40, // Adjust size as needed
                        backgroundImage: NetworkImage(
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
                    Text('237',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      'Posts',
                    ),
                  ]),
                  Column(children: [
                    Text('3958',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      'Followers',
                    ),
                  ]),
                  Column(children: [
                    Text('30',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      'following',
                    ),
                  ]),
                  SizedBox(width: 7,)
                ]),
          )
          
          ;
  }
}
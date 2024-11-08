// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram/pages/story_page.dart';
import 'package:instagram/util/bubble_stories.dart';
import 'package:instagram/util/user_posts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../model/user.dart';

class userHome extends StatefulWidget {
  final int unreadMessages;
  userHome({required this.unreadMessages});

  @override
  State<userHome> createState() => _userHomeState();
}

class _userHomeState extends State<userHome> {
  final List<String> persons = [
    'User',
    'soleil',
    'pascal',
    'bahavu',
    'jonathan',
    'pascal',
    'bahavu',
  ];
  Map<String, List<String>> userStories = {};
final List<User> users = [
    User(name: 'User', isUser: true, stories: [], avatar: 'https://practicaltyping.com/wp-content/uploads/2020/02/ichigo.jpg'),
    User(name: 'Gojo', isUser: false, stories: [
      Story(imageUrl: 'https://practicaltyping.com/wp-content/uploads/2020/02/ichigo.jpg'),
      Story(text: 'Hello from Gojo!'),
    ], avatar: 'https://images.alphacoders.com/127/thumb-1920-1272715.png'),
    // Add more users with image or text stories
      User(name: 'toji', isUser: false, stories: [
      Story(imageUrl: 'https://jankenpo.com.br/wordpress/wp-content/files/jankenpo.com.br/2024/05/jujutsu-kaisen-gojo-forte.png'),
            Story(imageUrl: 'https://glowx.studio/cdn/shop/files/Tojiwatermark_2.png'),

    ], avatar: 'https://www.citypng.com/public/uploads/preview/toji-fushiguro-from-jujutsu-kaisen-hd-png-735811696676715ravfofa7e1.png'),
  ];
  String? userImagePath; // To store the selected image path

  

 void _viewStory(User user) {
    if (user.stories.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StoryPage(user: user),
        ),
      ).then((_) {
        // Move the viewed user to the end of the list
        setState(() {
          users.remove(user);
          users.add(user..hasGradient = false);
        });
      });
    }
  }




  void _addStory(User user) async {
    // Open gallery or get input for a new story and add to user's stories
    final newStory = Story(imageUrl: 'https://freebiehive.com/wp-content/uploads/2023/09/Gojo-Satoru-PNG.jpg'); // Replace with actual story selection logic
    setState(() {
      user.stories.add(newStory);
    });
  }

  Future<void> _openGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        userImagePath = pickedFile.path; // Store the selected image path
        userStories['User'] = [userImagePath!]; // Set the user's story
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "Instagram",
                  style: TextStyle(
                    fontFamily: 'Instagram Sans Headline',
                    color: Colors.black,
                    fontSize: 36,
                  ),
                ),
                                Icon(Icons.keyboard_arrow_down),

              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: IconFavBadge(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconWithBadge(
                    unreadMessages: widget.unreadMessages,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return GestureDetector(
                  onTap: () {
                   
                      _viewStory(user);
                    
                  },
                  child: BubbleStories(
                   user: user,
            onViewStory: () => _viewStory(user),
            onAddStory: user.isUser ? () => _addStory(user) : null,
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return UserPosts(name: users[index].name);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class IconWithBadge extends StatelessWidget {
  final int unreadMessages;

  IconWithBadge({required this.unreadMessages});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        FaIcon(
          FontAwesomeIcons.facebookMessenger,
          color: Colors.black,
        ),
        if (unreadMessages > 0)
          Positioned(
            right: -6,
            top: -6,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              constraints: BoxConstraints(
                minWidth: 20,
                minHeight: 20,
              ),
              child: Text(
                '$unreadMessages',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}

class IconFavBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Icon(
          Icons.favorite_border_outlined,
        ),
        Positioned(
          right: -6,
          top: -48,
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            constraints: BoxConstraints(
              minWidth: 20,
              minHeight: 20,
            ),
            child: Text(
              '.',
              style: TextStyle(
                color: Colors.red,
                fontSize: 55,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

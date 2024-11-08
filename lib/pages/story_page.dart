import 'dart:async';
import 'package:flutter/material.dart';
import '../model/user.dart';
import '../util/story_bars.dart';

class StoryPage extends StatefulWidget {
  final User user;

  const StoryPage({super.key, required this.user});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  int currentStoryIndex = 0;
  List<double> percentWatcher = [];

  @override
  void initState() {
    super.initState();

    // Initialize percentWatcher based on the number of stories
    percentWatcher = List.filled(widget.user.stories.length, 0.0);

    // Start the watcher for the first story
    _startWatcher();
  }

  void _startWatcher() {
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        if (percentWatcher[currentStoryIndex] + 0.02 < 1) {
          percentWatcher[currentStoryIndex] += 0.02;
        } else {
          percentWatcher[currentStoryIndex] = 1;
          timer.cancel();

          // Move to the next story or exit if it's the last one
          if (currentStoryIndex < widget.user.stories.length - 1) {
            currentStoryIndex++;
            _startWatcher();
          } else {
            // Mark story as viewed by removing the gradient and returning to previous screen
            widget.user.hasGradient = false;
            Navigator.pop(context);
          }
        }
      });
    });
  }

  void _onTapDown(TapDownDetails details) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;
    setState(() {
      if (dx < screenWidth / 2) {
        // Go to previous story if possible
        if (currentStoryIndex > 0) {
          percentWatcher[currentStoryIndex - 1] = 0;
          percentWatcher[currentStoryIndex] = 0;
          currentStoryIndex--;
        }
      } else {
        // Go to next story if possible
        if (currentStoryIndex < widget.user.stories.length - 1) {
          percentWatcher[currentStoryIndex] = 1;
          currentStoryIndex++;
        } else {
          percentWatcher[currentStoryIndex] = 1;
          widget.user.hasGradient = false;
          Navigator.pop(context);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Story currentStory = widget.user.stories[currentStoryIndex];

    return GestureDetector(
      onTapDown: (details) => _onTapDown(details),
      child: Scaffold(
        body: Stack(
          children: [
            // Display either image or text story
            currentStory.imageUrl != null
                ? Image.network(
                    currentStory.imageUrl!,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Center(
                    child: Text(
                      currentStory.text ?? '',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
            // Display story progress bar
            MyStoryBar(
              percentWatcher: percentWatcher,
            ),
            Positioned(
              top: 55,
              left: 20,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.user.avatar), // Placeholder avatar URL
                    radius: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    widget.user.name,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    ' 3h',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

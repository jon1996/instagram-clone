import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/model/user.dart';
import 'package:instagram/util/post_gred.dart';
import 'package:instagram/util/reel_grid.dart';
import 'package:instagram/util/save_grid.dart';
import '../model/user_data.dart';
import '../util/bubble_stories.dart';
import '../util/myAppBar.dart';
import '../util/mySVG.dart';
import '../util/userAppBar.dart';
import '../util/user_buttons.dart';
import 'story_page.dart';

class UserPage extends StatefulWidget {
  final UserInfo userInfo;

  UserPage({required this.userInfo});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
      int _selectedIndex = 0;

  final List<User> users = [
    User(
        name: 'User',
        isUser: false,
        isNormalUser: true,
        stories: [ Story(
              imageUrl:
                  'https://practicaltyping.com/wp-content/uploads/2020/02/ichigo.jpg',),
          Story(text: 'Hello from Gojo!'),],
        avatar:
            'https://practicaltyping.com/wp-content/uploads/2020/02/ichigo.jpg'),
    User(
        name: 'Gojo',
        isUser: false,
        isNormalUser: true,
        stories: [
          Story(
              imageUrl:
                  'https://practicaltyping.com/wp-content/uploads/2020/02/ichigo.jpg'),
          Story(text: 'Hello from Gojo!'),
        ],
        avatar: 'https://images.alphacoders.com/127/thumb-1920-1272715.png'),
    // Add more users with image or text stories
    User(
        name: 'toji',
        isUser: false,
        isNormalUser: true,
        stories: [
          Story(
              imageUrl:
                  'https://jankenpo.com.br/wordpress/wp-content/files/jankenpo.com.br/2024/05/jujutsu-kaisen-gojo-forte.png'),
          Story(
              imageUrl:
                  'https://glowx.studio/cdn/shop/files/Tojiwatermark_2.png'),
        ],
        avatar:
            'https://www.citypng.com/public/uploads/preview/toji-fushiguro-from-jujutsu-kaisen-hd-png-735811696676715ravfofa7e1.png'),
  ];

  String? userImagePath;

  String svgCode = '''
<svg xmlns="http://www.w3.org/2000/svg" shape-rendering="geometricPrecision" text-rendering="geometricPrecision" image-rendering="optimizeQuality" fill-rule="evenodd" clip-rule="evenodd" viewBox="0 0 439.999 511.429"><path fill-rule="nonzero" d="M342.382 237.037a175.843 175.843 0 00-6.707-3.045c-3.947-72.737-43.692-114.379-110.428-114.805-38.505-.256-72.972 15.445-94.454 48.041l36.702 25.178c15.265-23.159 39.221-28.097 56.864-28.097.203 0 .408 0 .61.003 21.973.139 38.555 6.528 49.287 18.987 7.81 9.071 13.034 21.606 15.62 37.425-19.482-3.312-40.552-4.329-63.077-3.039-63.449 3.656-104.24 40.661-101.5 92.081 1.39 26.083 14.384 48.522 36.586 63.18 18.773 12.391 42.95 18.451 68.078 17.08 33.183-1.819 59.214-14.48 77.376-37.631 13.793-17.579 22.516-40.362 26.368-69.068 15.814 9.543 27.535 22.103 34.007 37.2 11.007 25.665 11.648 67.84-22.764 102.222-30.15 30.121-66.392 43.151-121.164 43.554-60.757-.45-106.707-19.934-136.582-57.914-27.976-35.563-42.434-86.93-42.973-152.675.539-65.745 14.997-117.113 42.973-152.675 29.875-37.979 75.824-57.464 136.581-57.914 61.197.455 107.948 20.033 138.967 58.195 15.21 18.713 26.677 42.248 34.236 69.688l43.011-11.476c-9.163-33.775-23.581-62.881-43.203-87.017C357.031 25.59 298.872.519 223.935 0h-.3C148.851.518 91.343 25.683 52.709 74.794 18.331 118.498.598 179.308.002 255.534l-.002.18.002.18c.596 76.226 18.329 137.037 52.707 180.741 38.634 49.11 96.142 74.277 170.926 74.794h.3c66.487-.462 113.352-17.868 151.96-56.442 50.511-50.463 48.991-113.717 32.342-152.548-11.944-27.847-34.716-50.464-65.855-65.402zm-114.795 107.93c-27.809 1.566-56.7-10.917-58.124-37.652-1.056-19.823 14.108-41.942 59.83-44.577 5.237-.302 10.375-.45 15.422-.45 16.609 0 32.146 1.613 46.272 4.702-5.268 65.798-36.173 76.483-63.4 77.977z"/></svg>''';

  String svgReel = '''
<?xml version="1.0" encoding="utf-8"?><svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 122.14 122.88" style="enable-background:new 0 0 122.14 122.88" xml:space="preserve"><g><path d="M35.14,0H87c9.65,0,18.43,3.96,24.8,10.32c6.38,6.37,10.34,15.16,10.34,24.82v52.61c0,9.64-3.96,18.42-10.32,24.79 l-0.02,0.02c-6.38,6.37-15.16,10.32-24.79,10.32H35.14c-9.66,0-18.45-3.96-24.82-10.32l-0.24-0.27C3.86,105.95,0,97.27,0,87.74 V35.14c0-9.67,3.95-18.45,10.32-24.82S25.47,0,35.14,0L35.14,0z M91.51,31.02l0.07,0.11h21.6c-0.87-5.68-3.58-10.78-7.48-14.69 C100.9,11.64,94.28,8.66,87,8.66h-8.87L91.51,31.02L91.51,31.02z M81.52,31.13L68.07,8.66H38.57l13.61,22.47H81.52L81.52,31.13z M42.11,31.13L28.95,9.39c-4.81,1.16-9.12,3.65-12.51,7.05c-3.9,3.9-6.6,9.01-7.48,14.69H42.11L42.11,31.13z M113.48,39.79H8.66 v47.96c0,7.17,2.89,13.7,7.56,18.48l0.22,0.21c4.8,4.8,11.43,7.79,18.7,7.79H87c7.28,0,13.9-2.98,18.69-7.77l0.02-0.02 c4.79-4.79,7.77-11.41,7.77-18.69V39.79L113.48,39.79z M50.95,54.95l26.83,17.45c0.43,0.28,0.82,0.64,1.13,1.08 c1.22,1.77,0.77,4.2-1,5.42L51.19,94.67c-0.67,0.55-1.53,0.88-2.48,0.88c-2.16,0-3.91-1.75-3.91-3.91V58.15h0.02 c0-0.77,0.23-1.55,0.7-2.23C46.76,54.15,49.19,53.72,50.95,54.95L50.95,54.95L50.95,54.95z"/></g></svg>
''';

  String svgGrid =
      '''��<svg xmlns="http://www.w3.org/2000/svg" shape-rendering="geometricPrecision" text-rendering="geometricPrecision" image-rendering="optimizeQuality" fill-rule="evenodd" clip-rule="evenodd" viewBox="0 0 512 510.87"><path d="M10.69 0h119.84c5.88 0 10.68 4.8 10.68 10.68v119.85c0 5.88-4.8 10.68-10.68 10.68H10.69c-5.88 0-10.69-4.8-10.69-10.68V10.68C0 4.8 4.81 0 10.69 0zm370.78 369.66h119.84c5.89 0 10.69 4.8 10.69 10.68v119.85c0 5.88-4.8 10.68-10.69 10.68H381.47c-5.88 0-10.68-4.8-10.68-10.68V380.34c0-5.88 4.8-10.68 10.68-10.68zm-185.39 0h119.84c5.89 0 10.69 4.8 10.69 10.68v119.85c0 5.88-4.8 10.68-10.69 10.68H196.08c-5.88 0-10.69-4.8-10.69-10.68V380.34c0-5.88 4.81-10.68 10.69-10.68zm-185.39 0h119.84c5.88 0 10.68 4.8 10.68 10.68v119.85c0 5.88-4.8 10.68-10.68 10.68H10.69c-5.88 0-10.69-4.8-10.69-10.68V380.34c0-5.88 4.81-10.68 10.69-10.68zm370.78-184.83h119.84c5.89 0 10.69 4.8 10.69 10.68v119.85c0 5.88-4.8 10.68-10.69 10.68H381.47c-5.88 0-10.68-4.8-10.68-10.68V195.51c0-5.88 4.8-10.68 10.68-10.68zm-185.39 0h119.84c5.89 0 10.69 4.8 10.69 10.68v119.85c0 5.88-4.8 10.68-10.69 10.68H196.08c-5.88 0-10.69-4.8-10.69-10.68V195.51c0-5.88 4.81-10.68 10.69-10.68zm-185.39 0h119.84c5.88 0 10.68 4.8 10.68 10.68v119.85c0 5.88-4.8 10.68-10.68 10.68H10.69c-5.88 0-10.69-4.8-10.69-10.68V195.51c0-5.88 4.81-10.68 10.69-10.68zM381.47 0h119.84C507.2 0 512 4.8 512 10.68v119.85c0 5.88-4.8 10.68-10.69 10.68H381.47c-5.88 0-10.68-4.8-10.68-10.68V10.68c0-5.88 4.8-10.68 10.68-10.68zM196.08 0h119.84c5.89 0 10.69 4.8 10.69 10.68v119.85c0 5.88-4.8 10.68-10.69 10.68H196.08c-5.88 0-10.69-4.8-10.69-10.68V10.68C185.39 4.8 190.2 0 196.08 0z"/></svg>''';

  String svgPerson =
      '''<svg id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 122.88 122.88"><title>account</title><path d="M61.44,0A61.31,61.31,0,0,1,84.92,4.66h0A61.66,61.66,0,0,1,118.21,38l.1.24a61.39,61.39,0,0,1-.1,46.73h0A61.42,61.42,0,0,1,38,118.21h0A61.3,61.3,0,0,1,18,104.88l0,0A61.5,61.5,0,0,1,4.66,84.94l-.09-.24A61.48,61.48,0,0,1,4.66,38v0A61.37,61.37,0,0,1,18,18l0,0A61.5,61.5,0,0,1,37.94,4.66l.24-.09A61.35,61.35,0,0,1,61.44,0ZM48.78,79.89a16.44,16.44,0,0,1-1.34-1.62c-2.6-3.56-4.93-7.58-7.27-11.33-1.7-2.5-2.59-4.73-2.59-6.52s1-4.13,3-4.64a101,101,0,0,1-.18-11.73A16.86,16.86,0,0,1,41,41.11a17,17,0,0,1,7.58-9.64,19.26,19.26,0,0,1,4.11-2c2.59-1,1.34-4.91,4.19-5C63.54,24.33,74.52,30,78.8,34.68a16.91,16.91,0,0,1,4.38,11l-.27,10.57a3.31,3.31,0,0,1,2.41,2.41c.36,1.43,0,3.39-1.25,6.16h0c0,.09-.09.09-.09.18-2.75,4.53-5.62,9.78-8.78,14-1.59,2.12-2.9,1.75-1.54,3.78,6.45,8.87,19.18,7.64,27,13.55a52.66,52.66,0,0,0,9.36-54.72l-.09-.2A52.7,52.7,0,0,0,98.55,24.33h0a52.63,52.63,0,0,0-57-11.49l-.21.09a52.53,52.53,0,0,0-17,11.4h0a52.63,52.63,0,0,0-11.49,57l.09.21A52.66,52.66,0,0,0,22.19,96.3c7.85-5.91,20.58-4.68,27-13.55,1.12-1.68.83-1.52-.44-2.86Z"/></svg>''';

  Map<String, List<String>> userStories = {};

  void _viewStory(User user) {
    if (user.stories.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StoryPage(user: user),
        ),
      );
    }
  
  }
   void _addStory(User user) async {
    // Open gallery or get input for a new story and add to user's stories
    final newStory = Story(
        imageUrl:
            'https://freebiehive.com/wp-content/uploads/2023/09/Gojo-Satoru-PNG.jpg'); // Replace with actual story selection logic
    setState(() {
      user.stories.add(newStory);
    });
  }

  @override
  Widget build(BuildContext context) {
     return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          title: Myappbar(userInfo: widget.userInfo,),
        ),
        body: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Aligns children to the left

          children: [
            Userappbar(userInfo: widget.userInfo,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                widget.userInfo.name,
                style: TextStyle(
                  fontFamily: 'Instagram Sans Headline',
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 122,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(
                      10), // Adjust the radius for the circular shape
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SvgPicture.string(
                      svgCode,
                      width: 12.0,
                      height: 12.0,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      widget.userInfo.name,
                      style: TextStyle(
                        fontFamily: 'Instagram Sans Headline',
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            UserButtons(),
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
            TabBar(
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              tabs: [
                Tab(
                  icon: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: _selectedIndex == 0
                        ? SvgIconWidget(svgGrid) // Selected icon
                        : SvgIconWidget(svgGrid,svgColor: ColorFilter.mode(Colors.grey[700]!, BlendMode.srcIn)), // Unselected icon
                  ),
                ),
                Tab(
                  icon: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: _selectedIndex == 1
                        ? SvgIconWidget(svgReel) // Selected icon
                        : SvgIconWidget(svgReel, svgColor: ColorFilter.mode(Colors.grey[700]!, BlendMode.srcIn)), // Unselected icon
                  ),
                ),
                Tab(
                  icon: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: _selectedIndex == 2
                        ? SvgIconWidget(svgPerson) // Selected icon
                        : SvgIconWidget(svgPerson,svgColor: ColorFilter.mode(Colors.grey[700]!, BlendMode.srcIn)), // Unselected icon
                  ),
                ),
              ],
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
            ),
            Expanded(
                child: TabBarView(
              children: [
                PostGred(userInfo: widget.userInfo,),
                ReelGrid(),
                SaveGrid(),
              ],
            ))
          ],
        ),
      ),
    );
 
  }
}
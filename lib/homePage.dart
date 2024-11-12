// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/pages/account.dart';
import 'package:instagram/pages/home.dart';
import 'package:instagram/pages/reel.dart';
import 'package:instagram/pages/search.dart';
import 'package:instagram/pages/shop.dart';
import 'package:instagram/util/mySVG.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
String svgReel = '''
<?xml version="1.0" encoding="utf-8"?><svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 122.14 122.88" style="enable-background:new 0 0 122.14 122.88" xml:space="preserve"><g><path d="M35.14,0H87c9.65,0,18.43,3.96,24.8,10.32c6.38,6.37,10.34,15.16,10.34,24.82v52.61c0,9.64-3.96,18.42-10.32,24.79 l-0.02,0.02c-6.38,6.37-15.16,10.32-24.79,10.32H35.14c-9.66,0-18.45-3.96-24.82-10.32l-0.24-0.27C3.86,105.95,0,97.27,0,87.74 V35.14c0-9.67,3.95-18.45,10.32-24.82S25.47,0,35.14,0L35.14,0z M91.51,31.02l0.07,0.11h21.6c-0.87-5.68-3.58-10.78-7.48-14.69 C100.9,11.64,94.28,8.66,87,8.66h-8.87L91.51,31.02L91.51,31.02z M81.52,31.13L68.07,8.66H38.57l13.61,22.47H81.52L81.52,31.13z M42.11,31.13L28.95,9.39c-4.81,1.16-9.12,3.65-12.51,7.05c-3.9,3.9-6.6,9.01-7.48,14.69H42.11L42.11,31.13z M113.48,39.79H8.66 v47.96c0,7.17,2.89,13.7,7.56,18.48l0.22,0.21c4.8,4.8,11.43,7.79,18.7,7.79H87c7.28,0,13.9-2.98,18.69-7.77l0.02-0.02 c4.79-4.79,7.77-11.41,7.77-18.69V39.79L113.48,39.79z M50.95,54.95l26.83,17.45c0.43,0.28,0.82,0.64,1.13,1.08 c1.22,1.77,0.77,4.2-1,5.42L51.19,94.67c-0.67,0.55-1.53,0.88-2.48,0.88c-2.16,0-3.91-1.75-3.91-3.91V58.15h0.02 c0-0.77,0.23-1.55,0.7-2.23C46.76,54.15,49.19,53.72,50.95,54.95L50.95,54.95L50.95,54.95z"/></g></svg>
''';
String svgAdd = '''<?xml version="1.0" encoding="utf-8"?><svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="122.879px" height="122.88px" viewBox="0 0 122.879 122.88" enable-background="new 0 0 122.879 122.88" xml:space="preserve"><g><path d="M8.773,0h105.332c2.417,0,4.611,0.986,6.199,2.574c1.589,1.588,2.574,3.783,2.574,6.199v105.333 c0,2.416-0.985,4.61-2.574,6.199c-1.588,1.588-3.782,2.574-6.199,2.574H8.773c-2.416,0-4.611-0.986-6.199-2.574 C0.986,118.717,0,116.522,0,114.106V8.773c0-2.417,0.986-4.611,2.574-6.199S6.357,0,8.773,0L8.773,0z M57.876,30.852 c0-1.968,1.596-3.564,3.563-3.564c1.969,0,3.563,1.596,3.563,3.564v27.024l27.024,0c1.969,0,3.563,1.596,3.563,3.563 s-1.595,3.563-3.563,3.563H65.003v27.024c0,1.969-1.596,3.563-3.563,3.563s-3.563-1.595-3.563-3.563V65.003H30.852 c-1.968,0-3.563-1.595-3.563-3.563c0-1.968,1.596-3.563,3.563-3.563h27.024V30.852L57.876,30.852z M114.105,7.129H8.773 c-0.449,0-0.859,0.186-1.159,0.485c-0.3,0.3-0.486,0.71-0.486,1.159v105.333c0,0.448,0.186,0.859,0.486,1.159 c0.3,0.299,0.71,0.485,1.159,0.485h105.332c0.449,0,0.86-0.187,1.159-0.485c0.3-0.3,0.486-0.711,0.486-1.159V8.773 c0-0.449-0.187-0.859-0.486-1.159C114.966,7.315,114.555,7.129,114.105,7.129L114.105,7.129z"/></g></svg>''';
 
String svgPerson = '''<svg id="Layer_1" data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 122.88 122.88"><title>account</title><path d="M61.44,0A61.31,61.31,0,0,1,84.92,4.66h0A61.66,61.66,0,0,1,118.21,38l.1.24a61.39,61.39,0,0,1-.1,46.73h0A61.42,61.42,0,0,1,38,118.21h0A61.3,61.3,0,0,1,18,104.88l0,0A61.5,61.5,0,0,1,4.66,84.94l-.09-.24A61.48,61.48,0,0,1,4.66,38v0A61.37,61.37,0,0,1,18,18l0,0A61.5,61.5,0,0,1,37.94,4.66l.24-.09A61.35,61.35,0,0,1,61.44,0ZM48.78,79.89a16.44,16.44,0,0,1-1.34-1.62c-2.6-3.56-4.93-7.58-7.27-11.33-1.7-2.5-2.59-4.73-2.59-6.52s1-4.13,3-4.64a101,101,0,0,1-.18-11.73A16.86,16.86,0,0,1,41,41.11a17,17,0,0,1,7.58-9.64,19.26,19.26,0,0,1,4.11-2c2.59-1,1.34-4.91,4.19-5C63.54,24.33,74.52,30,78.8,34.68a16.91,16.91,0,0,1,4.38,11l-.27,10.57a3.31,3.31,0,0,1,2.41,2.41c.36,1.43,0,3.39-1.25,6.16h0c0,.09-.09.09-.09.18-2.75,4.53-5.62,9.78-8.78,14-1.59,2.12-2.9,1.75-1.54,3.78,6.45,8.87,19.18,7.64,27,13.55a52.66,52.66,0,0,0,9.36-54.72l-.09-.2A52.7,52.7,0,0,0,98.55,24.33h0a52.63,52.63,0,0,0-57-11.49l-.21.09a52.53,52.53,0,0,0-17,11.4h0a52.63,52.63,0,0,0-11.49,57l.09.21A52.66,52.66,0,0,0,22.19,96.3c7.85-5.91,20.58-4.68,27-13.55,1.12-1.68.83-1.52-.44-2.86Z"/></svg>'''; 
 
String svgSearch = '''<?xml version="1.0" encoding="utf-8"?><svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="119.828px" height="122.88px" viewBox="0 0 119.828 122.88" enable-background="new 0 0 119.828 122.88" xml:space="preserve"><g><path d="M48.319,0C61.662,0,73.74,5.408,82.484,14.152c8.744,8.744,14.152,20.823,14.152,34.166 c0,12.809-4.984,24.451-13.117,33.098c0.148,0.109,0.291,0.23,0.426,0.364l34.785,34.737c1.457,1.449,1.465,3.807,0.014,5.265 c-1.449,1.458-3.807,1.464-5.264,0.015L78.695,87.06c-0.221-0.22-0.408-0.46-0.563-0.715c-8.213,6.447-18.564,10.292-29.814,10.292 c-13.343,0-25.423-5.408-34.167-14.152C5.408,73.741,0,61.661,0,48.318s5.408-25.422,14.152-34.166C22.896,5.409,34.976,0,48.319,0 L48.319,0z M77.082,19.555c-7.361-7.361-17.53-11.914-28.763-11.914c-11.233,0-21.403,4.553-28.764,11.914 C12.194,26.916,7.641,37.085,7.641,48.318c0,11.233,4.553,21.403,11.914,28.764c7.36,7.361,17.53,11.914,28.764,11.914 c11.233,0,21.402-4.553,28.763-11.914c7.361-7.36,11.914-17.53,11.914-28.764C88.996,37.085,84.443,26.916,77.082,19.555 L77.082,19.555z"/></g></svg>''';

String svgHome = '''<?xml version="1.0" encoding="utf-8"?><svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 122.88 112.07" style="enable-background:new 0 0 122.88 112.07" xml:space="preserve"><style type="text/css">.st0{fill-rule:evenodd;clip-rule:evenodd;}</style><g><path class="st0" d="M61.44,0L0,60.18l14.99,7.87L61.04,19.7l46.85,48.36l14.99-7.87L61.44,0L61.44,0z M18.26,69.63L18.26,69.63 L61.5,26.38l43.11,43.25h0v0v42.43H73.12V82.09H49.49v29.97H18.26V69.63L18.26,69.63L18.26,69.63z"/></g></svg>''';
void _navigateBottomNavBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  List<Widget> _list = [
    userHome(unreadMessages: 4,),
    userSearch(),
    userReel(),
    userShop(),
    userAccount(unreadMessages: 9,),
  ];
   

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: _list[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _navigateBottomNavBar,
        showSelectedLabels: false,
  showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: SvgIconWidget(svgHome),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgIconWidget(svgSearch),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgIconWidget(svgAdd),
            label: 'add',
          ),
           BottomNavigationBarItem(
            icon: SvgIconWidget(svgReel),
            label: 'reels',
          ),
           BottomNavigationBarItem(
            icon: SvgIconWidget(svgPerson),
            label: 'account',
          ),
        ],
      ),
    );
  }
}


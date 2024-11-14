import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:reels_viewer/reels_viewer.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ReelModel> reelsList = [
    ReelModel(
        'https://www.w3schools.com/html/mov_bbb.mp4',
        'Darshan Patil',
        likeCount: 2000,
        isLiked: true,
        musicName: 'In the name of Love',
        reelDescription: "Life is better when you're laughing.",
        profileUrl:
            'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
        commentList: [
          ReelCommentModel(
            comment: 'Nice...',
            userProfilePic:
                'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
            userName: 'Darshan',
            commentTime: DateTime.now(),
          ),
          ReelCommentModel(
            comment: 'Superr...',
            userProfilePic:
                'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
            userName: 'Darshan',
            commentTime: DateTime.now(),
          ),
          ReelCommentModel(
            comment: 'Great...',
            userProfilePic:
                'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
            userName: 'Darshan',
            commentTime: DateTime.now(),
          ),
        ]),
    ReelModel(
      'https://filesamples.com/samples/video/mp4/sample_640x360.mp4',
      'Rahul',
      musicName: 'In the name of Love',
      reelDescription: "Life is better when you're laughing.",
      profileUrl:
          'https://opt.toiimg.com/recuperator/img/toi/m-69257289/69257289.jpg',
    ),
    ReelModel(
      'https://assets.mixkit.co/videos/24240/24240-720.mp4',
      'Rahul',
      reelDescription: "Man serving the turkey for his family.",
    ),

     ReelModel(
      'https://assets.mixkit.co/videos/52437/52437-720.mp4',
      'Jonathan',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ReelsViewer(
      reelsList: reelsList,
      onShare: (url) {
        log('Shared reel url ==> $url');
      },
      onLike: (url) {
        log('Liked reel url ==> $url');
      },
      onFollow: () {
        log('======> Clicked on follow <======');
      },
      onComment: (comment) {
        log('Comment on reel ==> $comment');
      },
      onClickMoreBtn: () {
        log('======> Clicked on more option <======');
      },
      onClickBackArrow: () {
        log('======> Clicked on back arrow <======');
      },
      onIndexChanged: (index){
        log('======> Current Index ======> $index <========');
      },
      showProgressIndicator: true,
      showVerifiedTick: true,
      
    );
  }
}
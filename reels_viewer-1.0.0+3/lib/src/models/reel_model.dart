import 'package:reels_viewer/reels_viewer.dart';
import 'package:video_player/video_player.dart';

class ReelModel {
  final String? id;
  final String url;
  final bool isLiked;
  final int likeCount;
  final String userName;
  final String? profileUrl;
  final String? reelDescription;
  final String? musicName;
  final List<ReelCommentModel>? commentList;
  VideoPlayerController? videoPlayerController;

  ReelModel(this.url, this.userName,
      {this.id,
      this.isLiked = false,
      this.likeCount = 0,
      this.profileUrl,
      this.reelDescription,
      this.musicName,
      this.commentList,
          this.videoPlayerController,
});
}

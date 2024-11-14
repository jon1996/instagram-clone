class UserData {
  final String name;
  final String? imageUrl;
  final String? posts;
  final int? likes;
  final int? comments;
  final int? shared;
  final String avatar;

  UserData({
    required this.name,
    this.imageUrl,
    required this.posts,
    required this.likes,
    required this.comments,
    required this.shared,
    required this.avatar,
  });
}


class Comments{
  final String? text;
  final String? userName;
  final String? userAvatar;
  final String? time;
  Comments({this.text, this.userName, this.userAvatar, this.time});
}

class UserInfo {
  final String name;
  final String? nickname;
  final String avatar;
  final String? bio;
  final int? followers;
  final int? following;
  final List<Post>? posts;

  UserInfo({
    required this.name,
    this.nickname,
    required this.avatar,
    this.bio,
    this.followers,
    this.following,
    this.posts,
  });
  
}

class Post{
  final List<String>? imageUrl;
  final String? bio;
  final int? likes;
  final List<Comments>? comments;
  final int? shared;

  Post({
    this.imageUrl,
    this.bio,
    this.likes,
    this.comments,
    this.shared,
  });
}

class userStories{
  final String? imageUrl; // For image stories
  final String? text; // For text stories
  final String? videoUrl; // For video stories
  userStories({this.imageUrl, this.text, this.videoUrl});

}




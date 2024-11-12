class Story {
  final String? imageUrl; // For image stories
  final String? text; // For text stories

  Story({this.imageUrl, this.text});
}

class User {
  final String name;
  final bool isUser;
  final String avatar;
  final List<Story> stories;
  bool hasGradient = true; 
  bool isNormalUser = false;

  User({
    required this.name,
    required this.isUser,
    required this.avatar,
    required this.stories,
    required this.isNormalUser,
  });
}



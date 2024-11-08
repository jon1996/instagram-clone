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
  bool hasGradient = true; // To control the gradient after viewing

  User({
    required this.name,
    required this.isUser,
    required this.avatar,
    required this.stories,
  });
}

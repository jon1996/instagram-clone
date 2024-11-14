import '../model/user_data.dart';

List<UserInfo> usersInfo = [
  UserInfo(
    name: "Alice Johnson",
    nickname: "Ali",
    avatar: "https://pict.ai/images/secure/mvgWJ3/jRBW2mIVyYTboIB_1727461558.png",
    bio: "Lover of adventures and good coffee.",
    followers: 1500,
    following: 300,
    posts: [
      Post(
        imageUrl: ["https://pict.ai/images/secure/mvgWJ3/jRBW2mIVyYTboIB_1727461558.png"],
        bio: "Exploring the mountains 🏔️",
        likes: 200,
        comments: [
          Comments(
            text: "Beautiful view!",
            userName: "Charlie Brown",
            userAvatar: "https://static.vecteezy.com/system/resources/previews/035/647/628/non_2x/ai-generated-man-athlete-flexing-muscle-isolated-on-transparent-background-free-png.png",
            time: "2h ago",
          ),
          Comments(
            text: "Wish I was there!",
            userName: "Eva White",
            userAvatar: "https://static.vecteezy.com/system/resources/previews/035/647/628/non_2x/ai-generated-man-athlete-flexing-muscle-isolated-on-transparent-background-free-png.png",
            time: "3h ago",
          ),
        ],
        shared: 10,
      ),
          Post(
        imageUrl: ["https://cdn.lucidpic.com/cdn-cgi/image/w=600,format=auto,metadata=none/66e3080f2a0ec.png"],
        bio: "Exploring the mountains 🏔️",
        likes: 200,
        comments: [
          Comments(
            text: "Beautiful view!",
            userName: "Charlie Brown",
            userAvatar: "https://static.vecteezy.com/system/resources/previews/035/647/628/non_2x/ai-generated-man-athlete-flexing-muscle-isolated-on-transparent-background-free-png.png",
            time: "2h ago",
          ),
          Comments(
            text: "Wish I was there!",
            userName: "Eva White",
            userAvatar: "https://static.vecteezy.com/system/resources/previews/035/647/628/non_2x/ai-generated-man-athlete-flexing-muscle-isolated-on-transparent-background-free-png.png",
            time: "3h ago",
          ),
        ],
        shared: 10,
      ),
    ],
  ),
  
  UserInfo(
    name: "Bob Smith",
    nickname: "Bobby",
    avatar: "https://static.vecteezy.com/system/resources/previews/035/647/628/non_2x/ai-generated-man-athlete-flexing-muscle-isolated-on-transparent-background-free-png.png",
    bio: "Tech enthusiast and coffee lover ☕️",
    followers: 1200,
    following: 400,
    posts: [
      Post(
        imageUrl: ["https://cdn.lucidpic.com/cdn-cgi/image/w=600,format=auto,metadata=none/66c43929de4e6.png"],
        bio: "Trying out some new tech gadgets!",
        likes: 250,
        shared: 15,
        comments: [
          Comments(
            text: "Looking cool!",
            userName: "Diana Green",
            userAvatar: "https://pict.ai/images/secure/mvgWJ3/jRBW2mIVyYTboIB_1727461558.png",
            time: "1h ago",
          ),
          Comments(
            text: "Can’t wait to hear your review!",
            userName: "Ian Gold",
            userAvatar: "https://cdn.lucidpic.com/cdn-cgi/image/w=600,format=auto,metadata=none/66c43929de4e6.png",
            time: "5h ago",
          ),
        ],
      ),
    ],
  ),
  UserInfo(
    name: "Charlie Brown",
    nickname: "Char____",
    avatar: "https://cdn.lucidpic.com/cdn-cgi/image/w=600,format=auto,metadata=none/66e3080f2a0ec.png",
    bio: "Hiker and nature photographer 📷",
    followers: 1800,
    following: 500,
    posts: [
      Post(
        imageUrl: ["https://cdn.lucidpic.com/cdn-cgi/image/w=600,format=auto,metadata=none/66c43929de4e6.png"],
        bio: "A serene lake in the morning mist.",
        likes: 320,
        comments: [
          Comments(
            text: "This is stunning!",
            userName: "Alice Johnson",
            userAvatar: "https://img.freepik.com/premium-psd/latin-woman-smiling_1187-27326.jpg",
            time: "1h ago",
          ),
        ],
        shared: 25,
      ),
    ],
  ),
  ];

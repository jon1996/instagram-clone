import 'package:flutter/material.dart';

import '../model/user_data.dart';

class PostGred extends StatelessWidget {
  final UserInfo? userInfo;
  const PostGred({super.key, this.userInfo});

  @override
  Widget build(BuildContext context) {
   return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: userInfo?.posts?.length ?? 0,
      itemBuilder: (context, index) {
        return Padding(padding: const EdgeInsets.all(1.0), 
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  userInfo?.posts!.first.imageUrl!.first ?? ""), // Image URL
              fit: BoxFit
                  .cover, // This ensures the image covers the whole circle
            ),
          ),

        ));
      },
    );
  }
}
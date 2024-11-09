import 'package:flutter/material.dart';

class PostGred extends StatelessWidget {
  const PostGred({super.key});

  @override
  Widget build(BuildContext context) {
   return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: 7,
      itemBuilder: (context, index) {
        return Padding(padding: const EdgeInsets.all(1.0), child: Container(
          color: Colors.purple[600],
        ));
      },
    );
  }
}
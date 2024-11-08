import 'package:flutter/material.dart';

class ExploreGrid extends StatelessWidget {
  const ExploreGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: 200,
      itemBuilder: (context, index) {
        return Padding(padding: const EdgeInsets.all(2.0), child: Container(
          color: Colors.purple[100],
        ));
      },
    );
  }
}
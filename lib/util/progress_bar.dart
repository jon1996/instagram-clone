import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyProgressBar extends StatelessWidget {
  double percentWatcher = 0.0;
  MyProgressBar({required this.percentWatcher});

  @override
 Widget build(BuildContext context) {
  return LinearPercentIndicator(
    lineHeight: 5,
    barRadius: Radius.circular(10),
    animation: false,
        animationDuration: 600,  // Increase the duration

    animateFromLastPercent: true,  // Add this property
    percent: percentWatcher,
    backgroundColor: Colors.grey[600],
    progressColor: Colors.grey[400],
  );
}

}

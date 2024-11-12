import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class SvgIconWidget extends StatelessWidget {
  final String svgCode;
  ColorFilter? svgColor;
  SvgIconWidget(this.svgCode, {this.svgColor});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      svgCode,
      width: 20.0,
      height: 20.0,
      colorFilter: svgColor,
    );
  }
}
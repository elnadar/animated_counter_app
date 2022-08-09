import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedCircles extends StatelessWidget {
  const AnimatedCircles(
      {Key? key,
      this.height = 300,
      this.weight = 300,
      this.animation = 'Alarm',
      this.color})
      : super(key: key);

  final double height;
  final double weight;
  final String animation;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height.r,
        width: weight.r,
        child: FlareActor(
          'assets/flares/circle.flr',
          animation: animation,
          color: color,
        ));
  }
}

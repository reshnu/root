import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter/material.dart';

class FAProgressBar1 extends StatelessWidget {
  final int currentValue;
  FAProgressBar1({@required this.currentValue});
  @override
  Widget build(BuildContext context) {
    return FAProgressBar(
      currentValue: currentValue,
      maxValue: 100,
      size: 5,
      progressColor: Colors.amber,
      animatedDuration: Duration(seconds: 5),
    );
  }
}

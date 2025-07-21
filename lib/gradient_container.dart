import 'package:dice/dice_roller.dart';
import 'package:flutter/material.dart';
// import 'package:dice/styled_text.dart';

const topLeftAlignment = Alignment.topLeft;
const bottomRightAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.colors});
  final List<Color> colors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: topLeftAlignment,
          end: bottomRightAlignment,
        ),
      ),
      child: Center(
        child: DiceRoller()
      ),
    );
  }
}

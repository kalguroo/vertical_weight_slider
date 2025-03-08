import 'package:flutter/material.dart';

class WeightPointer extends StatelessWidget {
  const WeightPointer({
    Key? key,
    this.width = 130.0,
    this.height = 3.0,
    this.color = Colors.grey,
    this.textPointer,
  }) : super(key: key);

  /// If non-null, requires the child to have exactly this Width.
  final double width;

  /// If non-null, requires the child to have exactly this height.
  final double height;

  /// The color of the gradation.
  final Color color;

  final Widget? textPointer;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 5, left: 4),
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
        ),
      ),
    );
  }
}

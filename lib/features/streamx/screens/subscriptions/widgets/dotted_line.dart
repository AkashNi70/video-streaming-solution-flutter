import 'package:flutter/material.dart';

class DottedLine extends StatelessWidget {
  const DottedLine({super.key,
    this.height = 2.0,
    this.color = Colors.black,
  });

  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // Width of the available space for the separator.
        final boxWidth = constraints.constrainWidth();

        // Width of each dash.
        const double dashWidth = 10.0;

        // The number of dashes that can fit in the available width.
        final int dashCount = (boxWidth / (2 * dashWidth)).floor();

        return Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (index) {
            return SizedBox(
              width: dashWidth,
              height: height,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
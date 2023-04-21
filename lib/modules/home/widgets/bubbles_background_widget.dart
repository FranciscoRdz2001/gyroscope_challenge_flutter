import 'package:flutter/material.dart';

import '../../../app/utils/responsive_util.dart';
import '../../../widgets/painters/bubbles_painter.dart';

class BubblesBackgroundWidget extends StatelessWidget {
  final List<Color> colors;
  final List<double> positions;
  final List<int> directions;
  final double x;
  final double y;
  const BubblesBackgroundWidget({
    super.key,
    required this.colors,
    required this.positions,
    required this.directions,
    required this.x,
    required this.y,
  });

  @override
  Widget build(BuildContext context) {
    final resp = ResponsiveUtil.of(context);
    return CustomPaint(
      painter: BubblesPainter(
        colors: colors,
        positions: positions,
        radius: resp.wp(50),
        spacing: 200 * x,
        ySpacing: 200 * y,
        directions: directions,
      ),
    );
  }
}

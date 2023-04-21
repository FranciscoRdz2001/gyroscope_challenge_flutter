import 'package:flutter/material.dart';

class BubblesPainter extends CustomPainter {
  final List<Color> colors;
  final List<double> positions;
  final List<int> directions;
  final double radius;
  final double spacing;
  final double ySpacing;

  BubblesPainter({
    required this.colors,
    required this.radius,
    required this.spacing,
    required this.positions,
    required this.directions,
    required this.ySpacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, 0, size.width, size.height);
    final paint = Paint();

    // Dibujar fondo blanco
    paint.color = Colors.white;
    canvas.drawRect(rect, paint);

    // Dibujar burbujas de colores
    for (int i = 0; i < colors.length; i++) {
      paint.color = colors[i];

      final x = positions[i] * (size.width - 2 * radius) + radius;
      final y = positions[i + 1] * (size.height - 2 * radius) + radius;

      canvas.drawCircle(
        Offset((x + spacing) * directions[i], (y + ySpacing) * directions[i]),
        radius,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

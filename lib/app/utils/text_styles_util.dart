import 'package:flutter/material.dart';

class TextStyles {
  static final TextStyles _styles = TextStyles._internal();

  factory TextStyles.of(final BuildContext context) {
    return _styles;
  }
  TextStyles._internal();

  static TextStyle _getCopy(
    final double size,
    final FontWeight weight,
    final Color? color,
  ) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontSize: size,
      fontWeight: weight,
      color: color,
    );
  }

  TextStyle w400(final double size, [final Color? color]) {
    return _getCopy(size, FontWeight.w400, color);
  }

  TextStyle w500(final double size, [final Color? color]) {
    return _getCopy(size, FontWeight.w500, color);
  }

  TextStyle w600(final double size, [final Color? color]) {
    return _getCopy(size, FontWeight.w600, color);
  }

  TextStyle w700(final double size, [final Color? color]) {
    return _getCopy(size, FontWeight.w700, color);
  }

  TextStyle w800(final double size, [final Color? color]) {
    return _getCopy(size, FontWeight.w800, color);
  }

  TextStyle w900(final double size, [final Color? color]) {
    return _getCopy(size, FontWeight.w900, color);
  }
}

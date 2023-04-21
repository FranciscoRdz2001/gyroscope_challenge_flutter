import 'package:flutter/material.dart';
import 'package:gyroscope_challenge/app/utils/responsive_util.dart';
import 'package:gyroscope_challenge/app/utils/text_styles_util.dart';

class CardWidget extends StatelessWidget {
  final double x;
  final double y;
  final Color color;
  const CardWidget({
    super.key,
    required this.color,
    required this.x,
    required this.y,
  });

  @override
  Widget build(BuildContext context) {
    final resp = ResponsiveUtil.of(context);
    final styles = TextStyles.of(context);
    const fontColor = Color(0xffbc99e0);

    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateX(y)
        ..rotateY(x),
      alignment: Alignment.center,
      child: Container(
        height: resp.hp(50),
        width: resp.wp(70),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: BoxDecoration(
          color: color.withOpacity(0.65),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: color.withOpacity(0.605),
            width: 3,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'ABC Bank',
                    style: styles.w400(20, fontColor),
                  ),
                ),
                Text(
                  'VISA',
                  style: styles.w700(20, fontColor),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.sd_card_rounded, color: fontColor, size: 40),
                  SizedBox(height: resp.hp(1)),
                  Text(
                    '1234 5678 9012 3456',
                    style: styles.w400(18, fontColor),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Francisco Rodríguez',
                    style: styles.w400(14, fontColor),
                  ),
                ),
                Text(
                  '04/23',
                  style: styles.w400(14, fontColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

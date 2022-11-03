import 'dart:math';

import 'package:flutter/material.dart';

class WaterRipplePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke
      ..color = Colors.red
      ..invertColors = false;
    canvas.drawCircle(Offset(size.width / 2, size.height / 6), size.width / 6,
        paint..color = Colors.red.withOpacity(0.1));
    canvas.drawCircle(Offset(size.width / 2, size.height / 6 * 1.4),
        size.width / 6, paint..color = Colors.red.withOpacity(0.14));
    canvas.drawCircle(Offset(size.width / 2, size.height / 6 * 1.8),
        size.width / 6, paint..color = Colors.red.withOpacity(0.18));
    canvas.drawCircle(Offset(size.width / 2, size.height / 6 * 2.2),
        size.width / 6, paint..color = Colors.red.withOpacity(0.22));
    canvas.drawCircle(Offset(size.width / 2, size.height / 6 * 2.6),
        size.width / 6, paint..color = Colors.red.withOpacity(0.26));
    canvas.drawCircle(Offset(size.width / 2, size.height / 6 * 3.0),
        size.width / 6, paint..color = Colors.red.withOpacity(0.30));
    canvas.drawCircle(Offset(size.width / 2, size.height / 6 * 3.0),
        size.width / 6, paint..color = Colors.red.withOpacity(0.34));
    canvas.drawCircle(Offset(size.width / 2, size.height / 6 * 3.0),
        size.width / 6, paint..color = Colors.red.withOpacity(0.38));
    canvas.drawCircle(Offset(size.width / 2, size.height / 6 * 3.0),
        size.width / 6, paint..color = Colors.red.withOpacity(0.42));
    canvas.drawCircle(Offset(size.width / 2, size.height / 6 * 3.0),
        size.width / 6, paint..color = Colors.red.withOpacity(0.46));
    // canvas.drawCircle(Offset(size.width / 2, size.height / 6 * 3.0),
    //     size.width / 6, paint..color = Colors.red.withOpacity(0.46));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

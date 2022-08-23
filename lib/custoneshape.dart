import 'dart:ui';

import 'package:flutter/cupertino.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.08;

    Path path0 = Path();
    path0.moveTo(size.width * 0.3812500, size.height * 0.2480000);
    path0.quadraticBezierTo(size.width * 0.3821875, size.height * 0.5450000,
        size.width * 0.3137500, size.height * 0.5960000);
    path0.quadraticBezierTo(size.width * 0.5443750, size.height * 0.5945000,
        size.width * 0.6212500, size.height * 0.5940000);
    path0.quadraticBezierTo(size.width * 0.6746875, size.height * 0.5715000,
        size.width * 0.6300000, size.height * 0.2000000);
    path0.quadraticBezierTo(size.width * 0.6193750, size.height * 0.2480000,
        size.width * 0.3812500, size.height * 0.2480000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

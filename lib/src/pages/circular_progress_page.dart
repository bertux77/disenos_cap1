import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({ Key? key }) : super(key: key);

  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          width: 300,
          height: 300,
          color: Colors.red,
          child: CustomPaint(
            painter: _MiRadialProgress(),
          ),
        ),
      ),
    );
  }
}

class _MiRadialProgress extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 10
      ..color       = Colors.grey
      ..style       = PaintingStyle.stroke;

      Offset center = Offset(size.width * 0.5, size.height/2);
      double radio = min(size.width * 0.50, size.height * 0.50);
     
      Rect rect =  Offset(80.0, 0.0) & const Size(130.0, 140.0);
      Rect rect2 =  Offset(80.0, 140.0) & const Size(130.0, 140.0);
      //canvas.drawCircle(center, radio, paint);
      canvas.drawOval(rect, paint);
      canvas.drawOval(rect2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }

}
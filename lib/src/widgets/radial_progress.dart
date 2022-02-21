import 'dart:math';
import 'package:flutter/material.dart';
// Graficas circulares

class RadialProgress extends StatefulWidget {
  final porcentaje;

  RadialProgress({this.porcentaje});

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _MiRadialProgress(widget.porcentaje),
      ),
    );
  }
}


class _MiRadialProgress extends CustomPainter{

  final porcentaje;

  _MiRadialProgress(this.porcentaje);
  @override
  void paint(Canvas canvas, Size size) {

    

    // CIRCULO COMPLETO
    final paint = Paint()
      ..strokeWidth = 10
      ..color       = Colors.grey
      ..style       = PaintingStyle.stroke;

      Offset center = Offset(size.width * 0.5, size.height/2);
      double radio = min(size.width * 0.50, size.height * 0.50);
     
      Rect rect =  Offset(80.0, 0.0) & const Size(130.0, 140.0);
     
      canvas.drawCircle(center, radio, paint);
      
      //CIRCULO OVALADO
      //Rect rect2 =  Offset(80.0, 140.0) & const Size(130.0, 140.0);
      //canvas.drawOval(rect, paint);


      //ARCO
      final paintArco= Paint()
      ..strokeWidth = 10
      ..color       = Colors.pink
      ..style       = PaintingStyle.stroke;

      // Parte que se va a ir llenando
      double arcAngle = 2 * pi * (porcentaje / 100);
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radio), 
        -pi/2, 
        arcAngle, 
        false, 
        paintArco,
        );       
  }



  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }

}
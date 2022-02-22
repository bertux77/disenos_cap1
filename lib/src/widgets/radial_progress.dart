import 'dart:math';
import 'package:flutter/material.dart';
// Graficas circulares

class RadialProgress extends StatefulWidget {
  final porcentaje;
  final Color? colorPrimario;
  final Color? colorSecundario;
  final double? grosorfondo;
  final double? grosorCirculo;

  RadialProgress({
    required this.porcentaje,
    this.colorPrimario = Colors.green,
    this.colorSecundario = Colors.grey,
    this.grosorfondo = 4.0,
    this.grosorCirculo = 10.0,
  });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double porcentajeAnterior;
  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress(
                ((widget.porcentaje - diferenciaAnimar) +
                    (diferenciaAnimar * controller.value)),
                widget.colorPrimario!,
                widget.colorSecundario!,
                widget.grosorfondo!,
                widget.grosorCirculo!),
          ),
        );
      },
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorfondo;
  final double grosorCircular;

  _MiRadialProgress(this.porcentaje, this.colorPrimario, this.colorSecundario,
      this.grosorfondo, this.grosorCircular);
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(
      center: const Offset(0, 0),
      radius: 180,
    );

    const Gradient gradiente = LinearGradient(
        colors: [Color(0xffc012ff), Color(0xff6d05e8), Colors.red]);
    // CIRCULO COMPLETO
    final paint = Paint()
      ..strokeWidth = grosorfondo
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width * 0.5, size.height / 2);
    double radio = min(size.width * 0.50, size.height * 0.50);

    //Rect rect = const Offset(80.0, 0.0) & const Size(130.0, 140.0);

    canvas.drawCircle(center, radio, paint);

    //CIRCULO OVALADO
    //Rect rect2 =  Offset(80.0, 140.0) & const Size(130.0, 140.0);
    //canvas.drawOval(rect, paint);

    //ARCO
    final paintArco = Paint()
      ..strokeWidth = grosorCircular
      //..color = colorPrimario
      ..shader = gradiente.createShader(rect)
      ..strokeCap = StrokeCap.round // bordes redondeados
      ..style = PaintingStyle.stroke;

    // Parte que se va a ir llenando
    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio),
      -pi / 2,
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

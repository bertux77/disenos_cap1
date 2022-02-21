import 'package:flutter/material.dart';
import 'package:flutter/src/animation/curves.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotacion;

  late Animation<double> opacidad;
  late Animation<double> opacidadOut;

  late Animation<double> moverDerecha;
  late Animation<double> agrandar;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 4000)); // tiempo del movimiento

    rotacion = Tween(
      begin: 0.0,
      end: 2.0 * Math.pi, // Velocidad del movimiento
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    moverDerecha = Tween(begin: 0.0, end: 100.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));

    agrandar = Tween(begin: 0.0, end: 2.0) // 0 a 2 veces su tamaño original
        .animate(CurvedAnimation(parent: controller, curve: Curves.decelerate));
    // Interval indica cuando empieza y cuando termina la opacidad, se le puede agregar un curve para animar la propia opacidad
    opacidad = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: const Interval(0, 1, curve: Curves.easeIn)));

    opacidadOut = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1.0, curve: Curves.easeOut)));

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reset();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget? childRectangulo) {
        // SE PUEDE CONTROLAR EL ESTADO DE LAS TRANSFERENCIAS Y MOVIMIENTOS
        // print('Opacidad: ${opacidad.status}');
        // print('Rotacion: ${rotacion.value}');
        return Transform.translate(
          offset: Offset(moverDerecha.value, 0),
          child: Transform.rotate(
            angle: rotacion.value,
            child: Opacity(
              opacity:
                  (opacidad.value != 1) ? opacidad.value : opacidadOut.value,
              child: Transform.scale(
                scale: agrandar.value,
                child: childRectangulo,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.blue),
    );
  }
}

import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff615AAB),
    );
  }
}

class HeaderBordersRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
          color: Color(0xff615AAB),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70))),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    // Propiedades
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // fill pinta el interior, el .stroke no
    lapiz.strokeWidth = 20;

    final path = Path();

    //Dibujar con el path y el lapiz
    path.moveTo(0, size.height * 0.40);
    path.lineTo(size.width, size.height * 0.35);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    //path.lineTo(0, size.height * 0.5);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class HeaderTriangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderTrianguloPainter(),
      ),
    );
  }
}

class _HeaderTrianguloPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    // Propiedades
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // fill pinta el interior, el .stroke no
    lapiz.strokeWidth = 20;

    final path = Path();

    //Dibujar con el path y el lapiz
    //path.moveTo(size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderPico(),
      ),
    );
  }
}

class _HeaderPico extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    // Propiedades
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // fill pinta el interior, el .stroke no
    lapiz.strokeWidth = 20;

    final path = Path();

    //Dibujar con el path y el lapiz
    //path.moveTo(0, size.height * 0.4);
    path.lineTo(0, size.height * 0.40);
    path.lineTo(size.width / 2, size.height * 0.45);
    path.lineTo(size.width, size.height * 0.40);
    path.lineTo(size.width, 0);

    // path.lineTo(0, size.height);
    // path.lineTo(0, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class HeaderCurvas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderCurvas(),
      ),
    );
  }
}

class _HeaderCurvas extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    // Propiedades
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // fill pinta el interior, el .stroke no
    lapiz.strokeWidth = 20;

    final path = Path();
    path.lineTo(0, size.height * 0.30);
    // LAS 2 PRIMERAS ES EL PUNTO DE LA CURVA
    // LAS 2 ULTIMAS REFERENCIAS X2 Y2 APUNTAN A DONDE APUNTA LA LINEA

    path.quadraticBezierTo(
        size.width * 0.50, size.height * 0.45, size.width, size.height * 0.30);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class HeaderMultiCurvas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderMultiCurvas(),
      ),
    );
  }
}

class _HeaderMultiCurvas extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    // Propiedades
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // fill pinta el interior, el .stroke no
    lapiz.strokeWidth = 20;

    final path = Path();

    path.lineTo(0, size.height * 0.30);
    // LAS 2 PRIMERAS ES EL PUNTO DE LA CURVA
    // LAS 2 ULTIMAS REFERENCIAS X2 Y2 APUNTAN A DONDE APUNTA LA LINEA
    path.quadraticBezierTo(size.width * 0.12, size.height * 0.35,
        size.width * 0.50, size.height * 0.30);
    path.quadraticBezierTo(
        size.width * 0.87, size.height * 0.25, size.width, size.height * 0.30);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class HeaderMultiCurvasReves extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderMultiCurvasReves(),
      ),
    );
  }
}

class _HeaderMultiCurvasReves extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    // Propiedades
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // fill pinta el interior, el .stroke no
    lapiz.strokeWidth = 20;

    final path = Path();

    path.moveTo(0, size.height * 0.30);
    // LAS 2 PRIMERAS ES EL PUNTO DE LA CURVA
    // LAS 2 ULTIMAS REFERENCIAS X2 Y2 APUNTAN A DONDE APUNTA LA LINEA
    path.quadraticBezierTo(size.width * 0.12, size.height * 0.35,
        size.width * 0.50, size.height * 0.30);
    path.quadraticBezierTo(
        size.width * 0.87, size.height * 0.25, size.width, size.height * 0.30);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class HeaderMultiCurvasGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderMultiCurvasGradient(),
      ),
    );
  }
}

class _HeaderMultiCurvasGradient extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const Gradient gradiente = LinearGradient(
      // creamos el gradient
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff36d1dc),
        Color(0xff5b86e5),
      ],
    );

    final Rect rect = Rect.fromCircle(
      center: const Offset(0.0, 100.0),
      radius: 100,
    );

    final lapiz = Paint()
      ..shader = gradiente.createShader(rect); // definimos gradient

    // Propiedades
    lapiz.color = const Color(0xff615AAB);
    lapiz.style = PaintingStyle.fill; // fill pinta el interior, el .stroke no
    lapiz.strokeWidth = 20;

    final path = Path();

    path.lineTo(0, size.height * 0.30);
    // LAS 2 PRIMERAS ES EL PUNTO DE LA CURVA
    // LAS 2 ULTIMAS REFERENCIAS X2 Y2 APUNTAN A DONDE APUNTA LA LINEA
    path.quadraticBezierTo(size.width * 0.12, size.height * 0.35,
        size.width * 0.50, size.height * 0.30);
    path.quadraticBezierTo(
        size.width * 0.87, size.height * 0.25, size.width, size.height * 0.30);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

import 'package:flutter/material.dart';
import 'package:cap1/src/routes/routes.dart';

class CilindroBotonesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.symmetric(vertical: 65, horizontal: 15),
          child: ListWheelScrollView(
              physics: const BouncingScrollPhysics(),
              itemExtent: 80,
              diameterRatio: 3,
              children: listaBotones)),
    );
  }
}

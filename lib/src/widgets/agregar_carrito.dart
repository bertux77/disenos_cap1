import 'package:cap1/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AgregarCarritoBoton extends StatelessWidget {
  final double monto;
  const AgregarCarritoBoton({Key? key, required this.monto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.10),
          borderRadius: BorderRadius.circular(100)),
      child: Row(children: [
        const SizedBox(width: 20),
        Text(
          '$monto €',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const BotonNaranja(texto: 'Add to cart'),
        SizedBox(
          width: 20,
        )
      ]),
    );
  }
}

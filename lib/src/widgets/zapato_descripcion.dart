import 'package:flutter/material.dart';

class ZapatoDescripcion extends StatelessWidget {
  final String titulo;
  final String descripcion;
  const ZapatoDescripcion(
      {Key? key, required this.titulo, required this.descripcion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            titulo,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
          ),
          Text(
            descripcion,
            style: const TextStyle(
                fontSize: 14, color: Colors.black54, height: 1.8),
          ),
        ],
      ),
    );
  }
}

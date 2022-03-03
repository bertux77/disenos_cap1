import 'package:cap1/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ZapatoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: CustomZapatoAppBar(),
      //body: ZapatoSizePreview(),
      body: Column(
        children: [
          CustomZapatoAppBar(),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: const [
                    ZapatoSizePreview(),
                    ZapatoDescripcion(
                        titulo: 'Nike Air Max 720',
                        descripcion:
                            "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.")
                  ],
                )),
          ),
          AgregarCarritoBoton(monto: 180.0)
        ],
      ),
    );
  }
}

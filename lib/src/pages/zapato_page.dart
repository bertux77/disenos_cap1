import 'package:cap1/src/helpers/helpers.dart';
import 'package:cap1/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer_menu.dart';

class ZapatoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    cambiarStatusDark();
    return Scaffold(
      drawer: CustomDrawerMenu(),
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
                    Hero(
                      tag: 'zapato-1',
                      child: Material(child: ZapatoSizePreview()),
                    ),
                    ZapatoDescripcion(
                        titulo: 'Nike Air Max 720',
                        descripcion:
                            "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.")
                  ],
                )),
          ),
          const AgregarCarritoBoton(monto: 180.0)
        ],
      ),
    );
  }
}

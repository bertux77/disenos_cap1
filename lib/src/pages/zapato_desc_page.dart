
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class ZapatoDescPage extends StatelessWidget {
   
  const ZapatoDescPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         Stack(
           children: [
              const Hero(tag: 'zapato-1',
              child: Material(
                child: ZapatoSizePreview(
                  fullscreen: true)
                  )
                ),

              Positioned(
                left: 60,
                top: 20,
                child: FloatingActionButton(
                onPressed: () { 
                  Navigator.pop(context);
                 },
                elevation: 0,
                highlightElevation: 0,
                backgroundColor: Colors.transparent,
                child: const Icon(Icons.chevron_left, color: Colors.white, size: 60,),
              ))
           ],
         ),
          Expanded(child: SingleChildScrollView(
            child: Column(
              children:  [
                const ZapatoDescripcion(
                  titulo: 'Nike Air Max 720',
                  descripcion:
                      "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so."),
                _MontoBuyNow(),

                _ColoresYmas(),

                _BotonesSettings()


              ],
            ) ,
          ),)
        ],
      )
    );
  }
}

class _BotonesSettings extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30, ),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _BotonSombreado(icon: Icon(Icons.star, color: Colors.red, size: 25)),
          _BotonSombreado(icon: Icon(Icons.add_shopping_cart, color: Colors.grey.withOpacity(0.6), size: 25)),
          _BotonSombreado(icon: Icon(Icons.settings, color: Colors.grey.withOpacity(0.6), size: 25)),
        ]
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icon;
  const _BotonSombreado({
    Key? key, required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: icon,
      width: 55,
      height: 55,
      decoration:const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow:[ 
          BoxShadow(color: Colors.black26, spreadRadius: -5, blurRadius: 20, offset: Offset(0,5)),
          ]
      ),
    );
  }
}

class _ColoresYmas extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(child: Stack(
            children: const [
              Positioned(left: 90,child: _BotonColor(color: Colors.red,)),
              Positioned(left: 60, child: _BotonColor(color: Colors.yellow,)),
              Positioned(left: 30, child: _BotonColor(color: Colors.blue,)),
              _BotonColor(color: Colors.green,),
            ],
          )),

          //Spacer(),
          BotonNaranja(texto: 'More related items', alto: 30, ancho: 170, color: Color(0xffffc675),)
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  const _BotonColor({
    Key? key, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: const EdgeInsets.only(top: 15, bottom: 20),
        child: Row(
          children: [
            const Text('180.0€', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const Spacer(),
            Bounce(
              from: 20,
              delay: const Duration(seconds: 1),
              child: const BotonNaranja(texto: 'Buy Now', alto: 30, ancho: 100,)),

          ],
        ),
      ),
    );
  }
}
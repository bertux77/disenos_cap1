import 'package:animate_do/animate_do.dart';
import 'package:cap1/src/models/zapato_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ZapatoSizePreview extends StatelessWidget {
  final bool? fullscreen;
  const ZapatoSizePreview({Key? key, this.fullscreen = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullscreen!) {
          Navigator.of(context).pushNamed('zapatodesc');
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (fullscreen!) ? 10 : 80,
          vertical: (fullscreen!) ? 0 : 10,
        ),
      
        child: Container(
          width: double.infinity,
          //height: (fullscreen!) ? 300 : 350,
          height: (fullscreen!) ? 450 : 320,
          decoration: BoxDecoration(
            color: const Color(0xffffcf53),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            children: [
              // Zapato con sombra
              _ZapatoConSombra(fullscreen: fullscreen,),
              
             
               
              

              if (!fullscreen!)
                BounceInUp(child: _TallasZapato()),
               
            ],
          ),
        ),
      ),
    );
  }
}

class _TallasZapato extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _TallaIndividual(
            numero: 7,
          ),
          _TallaIndividual(
            numero: 7.5,
          ),
          _TallaIndividual(
            numero: 8,
          ),
          _TallaIndividual(
            numero: 8.5,
          ),
          _TallaIndividual(
            numero: 9,
          ),
        ],
      ),
    );
  }
}

class _TallaIndividual extends StatelessWidget {
  final double numero;
  const _TallaIndividual({
    Key? key,
    required this.numero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final seleccionado = Provider.of<ZapatoModel>(context).talla;
    return GestureDetector(
      onTap: () {
        Provider.of<ZapatoModel>(context, listen: false).talla = numero;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(
          numero.toString().replaceAll('.0', ''),
          style: TextStyle(
              color: (numero == seleccionado) ? Colors.white : Color(0xfff1a23a),
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: (numero == seleccionado) ? Color(0xfff1a23a) : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              if (numero == seleccionado)
                const BoxShadow(
                    color: Color(0xffF1a23a),
                    blurRadius: 10,
                    offset: Offset(0, 5))
            ]),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  final bool? fullscreen;
  const _ZapatoConSombra({Key? key, this.fullscreen = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final zapato = Provider.of<ZapatoModel>(context).assetImage;
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            right: 0,
            child: _SombraZapato(),
          ),
          Image(
            width: (fullscreen!) ? 400 : 250,
            image: AssetImage(zapato),
          )
        ],
      ),
    );
  }
}

class _SombraZapato extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 100,
        height: 100,
        margin: const EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(color: Color(0xffeaa14e), blurRadius: 40),
          ],
        ),
      ),
    );
  }
}

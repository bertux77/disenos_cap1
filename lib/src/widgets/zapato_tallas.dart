import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

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
          horizontal: (fullscreen!) ? 10 : 20,
          vertical: (fullscreen!) ? 0 : 0,
        ),
        child: Container(
          width: double.infinity,
          height: (fullscreen!) ? 300 : 350,
          decoration: BoxDecoration(
            color: const Color(0xffffcf53),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            children: [
              // Zapato con sombra
              _ZapatoConSombra(),

              if (!fullscreen!)
                // BounceInUp(child: _TallasZapato()),
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
    return Container(
      alignment: Alignment.center,
      child: Text(
        numero.toString().replaceAll('.0', ''),
        style: TextStyle(
            color: (numero == 8.5) ? Colors.white : Color(0xfff1a23a),
            fontSize: 16,
            fontWeight: FontWeight.bold),
      ),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: (numero == 8.5) ? Color(0xfff1a23a) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if (numero == 8.5)
              const BoxShadow(
                  color: Color(0xffF1a23a),
                  blurRadius: 10,
                  offset: Offset(0, 5))
          ]),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  const _ZapatoConSombra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(60),
      child: Stack(
        children: [
          Positioned(
            bottom: 20,
            right: 0,
            child: _SombraZapato(),
          ),
          const Image(
            image: AssetImage('assets/azul.png'),
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

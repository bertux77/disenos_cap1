import 'package:animate_do/animate_do.dart';
import 'package:cap1/src/pages/home_hero_page.dart';
import 'package:cap1/src/widgets/boton_gordo.dart';
import 'package:cap1/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final String url;

  ItemBoton(this.icon, this.texto, this.color1, this.color2, this.url);
}

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      ItemBoton(FontAwesomeIcons.twitter, 'Twitter Animation',
          const Color(0xff56CCF2), const Color(0xff2F80ED), '1'),
      ItemBoton(FontAwesomeIcons.angleDoubleUp, 'Sliver Header Pegado',
          const Color(0xff556270), const Color(0xffFF6B6B), '2'),
      ItemBoton(FontAwesomeIcons.images, 'Sliders DOTS',
          const Color(0xffF2D572), const Color(0xffE06AA3), '3'),
      ItemBoton(FontAwesomeIcons.pinterest, 'Pinterest Grid',
          const Color(0xff3c1053), const Color(0xffad5389), '4'),
      ItemBoton(FontAwesomeIcons.dog, 'DOG Animations', const Color(0xff33001b),
          const Color(0xffff0084), '5'),
      ItemBoton(FontAwesomeIcons.angleUp, 'Headers diferentes',
          const Color(0xff66A9F2), const Color(0xff536CF6), '6'),
      ItemBoton(FontAwesomeIcons.circleNotch, 'Graficas Circulares',
          const Color(0xffF2D572), const Color(0xffE06AA3), '7'),
      ItemBoton(FontAwesomeIcons.penFancy, 'Animaciones Animate_Do',
          const Color(0xff317183), const Color(0xff46997D), '8'),
      ItemBoton(FontAwesomeIcons.square, 'Cuadrado en Movimiento',
          const Color(0xff6989F5), const Color(0xff906EF5), '9'),
    ];

    List<Widget> itemMap = items
        .map(
          (item) => FadeInRight(
            duration: const Duration(milliseconds: 400),
            child: BotonGordo(
              icon: item.icon,
              texto: item.texto,
              color1: item.color1,
              color2: item.color2,
              url: HomeHeroPage(),
              id: item.url,

              // onPressed: () {
              //   Navigator.pushNamed(context, item.url);
              // },
            ),
          ),
        )
        .toList();

    return Scaffold(
      body: Stack(children: [
        Container(
          margin: const EdgeInsets.only(top: 160),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(
                height: 80,
              ),
              ...itemMap
            ],
          ),
        ),
        _Encabezado(),
      ]),
    );
  }
}

class _Encabezado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const IconHeader(
          icon: FontAwesomeIcons.theaterMasks,
          titulo: 'Diseños en Flutter',
          subtitulo: 'By Alberto Carrión',
          color1: Color(0xff536cf6),
          color2: Color(0xff66a9f2),
        ),
        Positioned(
          right: -10,
          top: 30,
          child: RawMaterialButton(
            onPressed: () {},
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(15.0),
            child: const FaIcon(
              FontAwesomeIcons.ellipsisV,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

// class BotonGordoTemp extends StatelessWidget {
//   const BotonGordoTemp({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BotonGordo(
//       color1: const Color(0xff6989f5),
//       color2: const Color(0xff906ef5),
//       icon: FontAwesomeIcons.earlybirds,
//       onPressed: () {
//         print('click');
//       },
//       texto: 'Motor accidentx',
//     );
//   }
// }

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const IconHeader(
      icon: FontAwesomeIcons.plus,
      subtitulo: 'Haz Solicitado',
      titulo: 'Asistencia Medica',
      color1: Color(0xff526bf6),
      color2: Color(0xff67acf2),
    );
  }
}

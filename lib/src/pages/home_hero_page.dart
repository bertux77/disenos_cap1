import 'package:cap1/src/pages/pages.dart';
import 'package:cap1/src/widgets/boton_gordo.dart';
import 'package:cap1/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeHeroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = [
      BotonGordo(
          icon: FontAwesomeIcons.twitter,
          texto: 'Twitter Animation',
          color1: Color(0xff56CCF2),
          color2: Color(0xff2F80ED),
          url: TwitterPage(),
          id: '1'),
      BotonGordo(
          icon: FontAwesomeIcons.angleDoubleDown,
          texto: 'Sliver Header Pegado',
          color1: Color(0xff556270),
          color2: Color(0xffFF6B6B),
          url: SliverListPage(),
          id: '2'),
      BotonGordo(
          icon: FontAwesomeIcons.images,
          texto: 'Sliders DOTS',
          color1: Color(0xffF2D572),
          color2: Color(0xffE06AA3),
          url: Slides2ShowPage(),
          id: '3'),
      BotonGordo(
          icon: FontAwesomeIcons.pinterest,
          texto: 'Pinterest Grid',
          color1: Color(0xff3c1053),
          color2: Color(0xffad5389),
          url: PinterestPage(),
          id: '4'),
      BotonGordo(
          icon: FontAwesomeIcons.dog,
          texto: 'Animaciones DOG',
          color1: Color(0xff33001b),
          color2: Color(0xffff0084),
          url: NavegacionPage(),
          id: '5'),
      const BotonGordo(
          icon: FontAwesomeIcons.angleUp,
          texto: 'Headers diferentes',
          color1: Color(0xff66A9F2),
          color2: Color(0xff536CF6),
          url: HeadersPage2(),
          id: '6'),
      const BotonGordo(
          icon: FontAwesomeIcons.circleNotch,
          texto: 'Graficas Circulares',
          color1: Color(0xffc012ff),
          color2: Color(0xff6d05e8),
          url: GraficasCircularesPage(),
          id: '7'),
      BotonGordo(
          icon: FontAwesomeIcons.penFancy,
          texto: 'Animaciones Animate_Do',
          color1: Color(0xff317183),
          color2: Color(0xff46997D),
          url: AnimateDoPage(),
          id: '8'),
      const BotonGordo(
          icon: FontAwesomeIcons.square,
          texto: 'Cuadrado en Movimiento',
          color1: Color(0xff6989F5),
          color2: Color(0xff906EF5),
          url: AnimacionesPage(),
          id: '9'),
      BotonGordo(
          icon: FontAwesomeIcons.solidArrowAltCircleLeft,
          texto: 'Botones Gordos con deslizamientos',
          color1: Color(0xffF37335),
          color2: Color(0xffFDC830),
          url: EmergencyPage(),
          id: '10'),
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
              url: item.url,
              id: item.id,
              // onPressed: () {
              //   Print('cucu');
              // },
            ),
          ),
        )
        .toList();

    // return Scaffold(
    //   body: Stack(children: [
    //     Container(
    //       margin: const EdgeInsets.only(top: 160),
    //       child: ListView(
    //         physics: const BouncingScrollPhysics(),
    //         children: [
    //           const SizedBox(
    //             height: 80,
    //           ),
    //           ...itemMap
    //         ],
    //       ),
    //     ),
    //     _Encabezado(),
    //   ]),
    // );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white,
                child: _Encabezado(),
              ),
              maxheight: 200,
              minheight: 180,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ...items,
              //...items,
              const SizedBox(
                height: 70,
              )
            ]),
          ),
        ],
      ),
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minheight;
  final double maxheight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    required this.minheight,
    required this.maxheight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxheight;

  @override
  double get minExtent => minheight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxheight != oldDelegate.maxheight ||
        minheight != oldDelegate.minheight ||
        child != oldDelegate.child;
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

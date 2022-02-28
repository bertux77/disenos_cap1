import 'package:cap1/src/widgets/boton_gordo.dart';
import 'package:cap1/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import '../widgets/boton_gordo.dart';
// import '../widgets/headers.dart';

// class _BotonGordo{
//   final IconData icon;
//   final String texto;
//   final Color color1;
//   final Color color2;
//   final String url;


//   ItemBoton(this.icon, this.texto, this.color1, this.color2, this.url);
// }

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = [
      _BotonGordo(icon: FontAwesomeIcons.twitter, texto: 'Twitter Animation',
    color1:Color(0xff56CCF2), color2: Color(0xff2F80ED), url: 'twitter'),

      _BotonGordo(icon: FontAwesomeIcons.angleDoubleDown, texto:'Sliver Header Pegado', color1: Color(0xff556270), color2: Color(0xffFF6B6B), url: 'sliver'),


      _BotonGordo(icon: FontAwesomeIcons.images, texto: 'texto: Sliders DOTS',
          color1: Color(0xffF2D572), color2:  Color(0xffE06AA3), url: 'sliders'),

      _BotonGordo(icon: FontAwesomeIcons.pinterest, texto: 'Pinterest Grid', color1: Color(0xff3c1053),
           color2 : Color(0xffad5389), url: 'pinterest'),

      _BotonGordo(icon: FontAwesomeIcons.dog, texto:  'Animaciones DOG',
          color1:Color(0xff33001b),  color2: Color(0xffff0084), url: 'dog'),

      _BotonGordo(icon: FontAwesomeIcons.angleUp, texto: 'Headers diferentes',
   color1: Color(0xff66A9F2), color2: Color(0xff536CF6),url: 'headers'),

      _BotonGordo(icon: FontAwesomeIcons.circleNotch, texto:'Graficas Circulares', color1:
           Color(0xffF2D572),  color2: Color(0xffE06AA3), url: 'graficas'),
      _BotonGordo(icon: FontAwesomeIcons.penFancy, texto:'Animaciones Animate_Do', color1: Color(0xff317183),
          color2: Color(0xff46997D), url: 'animate_do'),
      _BotonGordo(icon: FontAwesomeIcons.square, texto: 'Cuadrado en Movimiento', color1: Color(0xff6989F5), color2: Color(0xff906EF5), url: 'cuadrado'),
      
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
             
              onPressed: () {
                Navigator.pushNamed(context, item.url);
              },
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
              minheight: 160,
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

class BotonGordoTemp extends StatelessWidget {
  const BotonGordoTemp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotonGordo(
      color1: const Color(0xff6989f5),
      color2: const Color(0xff906ef5),
      icon: FontAwesomeIcons.earlybirds,
      onPressed: () {
        print('click');
      },
      texto: 'Motor accidentx',
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


class _BotonGordo extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  //final Function()? onPressed;
  final String url;

  const _BotonGordo(
      {Key? key,
      required this.icon,
      required this.texto,
      required this.color1,
      required this.color2,
      //this.onPressed,
      required this.url,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the second screen using a named route.
        Navigator.pushNamed(context, url);
      },
      child: Stack(
        children: [
          _BotonGordoBackground(
            color1: color1,
            color2: color2,
            icon: icon,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 110,
                width: 35,
              ),
              FaIcon(
                icon,
                color: Colors.white,
                size: 40,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  texto,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.white,
              ),
              const SizedBox(
                width: 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  final IconData icon;
  final Color color1;
  final Color color2;

  const _BotonGordoBackground({
    Key? key,
    required this.icon,
    required this.color1,
    required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                icon,
                size: 150,
                color: Colors.white.withOpacity(0.2),
              ),
            )
          ],
        ),
      ),
      width: double.infinity,
      height: 80,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(4, 6),
                blurRadius: 10)
          ],
          borderRadius: BorderRadius.circular(15),
          //color: Colors.red,
          gradient: LinearGradient(
            colors: [color1, color2],
          )),
    );
  }
}
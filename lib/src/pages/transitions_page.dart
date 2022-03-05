import 'package:cap1/src/pages/transitions2_page.dart';
import 'package:cap1/src/widgets/cabecera_pagina_hero.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/drawer_menu.dart';

class TransitionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawerMenu(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, _crearRuta());
          },
          child: const Icon(
            Icons.arrow_right_alt,
            size: 38,
            color: Colors.white,
          ),
        ),
        body: Column(children: const [
          CabeceraPaginaHero(
            color: Color(0xff1D976C),
            icon: FontAwesomeIcons.arrowAltCircleRight,
            id: '14',
            texto: 'Transiciones Page',
          ),
          Text(
            'Pagina 1',
            style: TextStyle(fontSize: 44),
          )
        ]));
  }

  Route _crearRuta() {
    return PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            Transitions2Page(),
        transitionDuration: Duration(milliseconds: 1000),
        transitionsBuilder: (context, animation, secondartAnimation, child) {
          final curvedAnimation =
              CurvedAnimation(parent: animation, curve: Curves.easeInOut);

          // DE UN PUNTO DEFINIDO (OFFSET) A OTRO
          // return SlideTransition(
          //   position: Tween<Offset>(begin: Offset(0.5, 1.0), end: Offset.zero)
          //       .animate(curvedAnimation),
          //   child: child,
          // );

          // DE PEQUEÑO A GRANDE
          // return ScaleTransition(
          //   child: child,
          //   scale: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
          // );

          // GIROS
          // return RotationTransition(
          //     child: child,
          //     turns:
          //         Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation));

          //FADES
          // return FadeTransition(
          //     child: child,
          //     opacity:
          //         Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation));

          // MEZCLA DE 2 ANIMACIONES FADE Y SCALE
          return FadeTransition(
            opacity:
                Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
            child: ScaleTransition(
                child: child,
                scale: Tween<double>(begin: 0.0, end: 1.0)
                    .animate(curvedAnimation)),
          );
        });
  }
}

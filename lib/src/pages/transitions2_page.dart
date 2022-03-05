import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/cabecera_pagina_hero.dart';
import '../widgets/drawer_menu.dart';

class Transitions2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawerMenu(),
        backgroundColor: Color(0xff1D976C),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
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
            'Pagina 2',
            style: TextStyle(fontSize: 44),
          )
        ]));
  }
}

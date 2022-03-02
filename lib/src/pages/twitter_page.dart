import 'package:animate_do/animate_do.dart';
import 'package:cap1/src/widgets/cabecera_pagina_hero.dart';
import 'package:cap1/src/widgets/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatefulWidget {
  @override
  State<TwitterPage> createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  bool activar = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawerMenu(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: const FaIcon(FontAwesomeIcons.play),
        onPressed: () {
          setState(() {
            activar = true;
          });
        },
      ),
      backgroundColor: const Color(0xff1da1f2),
      body: Stack(children: [
        const CabeceraPaginaHero(
          color: Color(0xff1da1f2),
          icon: FontAwesomeIcons.twitter,
          id: '1',
          texto: 'Twitter Animation',
        ),

        // Pajaro animado y pajado fijo
        const Center(
            child: FaIcon(
          FontAwesomeIcons.twitter,
          color: Colors.white,
          size: 40,
        )),
        Center(
          child: ZoomOut(
            animate: activar,
            from: 30,
            duration: const Duration(seconds: 1),
            child: const FaIcon(
              FontAwesomeIcons.twitter,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
      ]),
    );
  }
}

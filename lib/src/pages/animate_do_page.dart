import 'package:animate_do/animate_do.dart';
import 'package:cap1/src/pages/twitter_page.dart';
import 'package:cap1/src/widgets/drawer_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/cabecera_pagina_hero.dart';

class AnimateDoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   elevation: 0,
      //   title: const Text('Animate Do'),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         Navigator.push(
      //             context, MaterialPageRoute(builder: (_) => TwitterPage()));
      //       },
      //       icon: const FaIcon(FontAwesomeIcons.twitter),
      //     ),
      //     IconButton(
      //       onPressed: () {
      //         Navigator.push(
      //             context, CupertinoPageRoute(builder: (_) => AnimateDoPage()));
      //       },
      //       icon: const FaIcon(FontAwesomeIcons.arrowRight),
      //     ),
      //   ],
      // ),
      drawer: CustomDrawerMenu(),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          backgroundColor: Color(0xff46997D),
          elevation: 0,
          onPressed: () {},
          child: const FaIcon(FontAwesomeIcons.play),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

             
            const CabeceraPaginaHero(
                color: Color(0xff46997D),
                icon: FontAwesomeIcons.penFancy,
                id: '8',
                texto: 'Animaciones Animate_Do',
              ),
            const SizedBox(height: 40,),
            SpinPerfect(
              child: const Icon(
                Icons.new_releases,
                color: Color(0xff46997D),
                size: 40,
              ),
            ),
            FadeInDown(
              child: const Text(
                'Titulo',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
              ),
            ),
            FadeInDownBig(
              child: const Text(
                'Soy un subtitulo',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
              ),
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 1300),
              child: Container(
                width: 220,
                height: 2,
                color: Color(0xff46997D),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cap1/src/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:cap1/src/widgets/drawer_menu.dart';
import 'package:cap1/src/widgets/slideshow.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/cabecera_pagina_hero.dart';

class Slides2ShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawerMenu(),
      body: Column(
        children: const [
          CabeceraPaginaHero(
            color: Color(0xffE06AA3),
            icon: FontAwesomeIcons.images,
            id: '3',
            texto: 'Sliders DOTS',
          ),
          Expanded(child: MiSlideShow()),
          Expanded(child: MiSlideShow())
        ],
      ),
    );
  }
}

class MiSlideShow extends StatelessWidget {
  const MiSlideShow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final secondary = appTheme.currentTheme.colorScheme.secondary;
    return SlideShow(
      puntosArriba: true,
      colorPrimario: (appTheme.darkTheme) ? secondary : Color(0xffE06AA3),
      colorSecundario: Colors.grey,
      slides: [
        SvgPicture.asset('assets/slide-1.svg'),
        SvgPicture.asset('assets/slide-2.svg'),
        SvgPicture.asset('assets/slide-3.svg'),
        SvgPicture.asset('assets/slide-4.svg'),
        SvgPicture.asset('assets/slide-5.svg'),
      ],
    );
  }
}

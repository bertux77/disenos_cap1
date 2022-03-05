import 'package:cap1/src/pages/cilindo_botones.page.dart';
import 'package:cap1/src/pages/pages.dart';
import 'package:cap1/src/pages/reproductor_page.dart';
import 'package:cap1/src/pages/zapato_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/boton_gordo.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.twitter, 'Twitter Animation', TwitterPage()),
  _Route(FontAwesomeIcons.angleDoubleDown, 'Sliver Header Pegado',
      SliverListPage()),
  _Route(FontAwesomeIcons.images, 'Sliders DOTS', Slides2ShowPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest Grid', PinterestPage()),
  _Route(FontAwesomeIcons.dog, 'Animaciones DOG', NavegacionPage()),
  _Route(FontAwesomeIcons.angleUp, 'Headers diferentes', HeadersPage2()),
  _Route(FontAwesomeIcons.circleNotch, 'Graficas Circulares',
      GraficasCircularesPage()),
  _Route(FontAwesomeIcons.penFancy, 'Animaciones Animate_Do', AnimateDoPage()),
  _Route(FontAwesomeIcons.square, 'Cuadrado en Movimiento', AnimacionesPage()),
  _Route(FontAwesomeIcons.solidArrowAltCircleLeft,
      'Botones Gordos con deslizamientos', EmergencyPage()),
  _Route(FontAwesomeIcons.shoePrints, 'Shop Shoes Love', ZapatoPage()),
  _Route(FontAwesomeIcons.music, 'Reproductor Musica', ReproductorPage()),
  _Route(Icons.ads_click_outlined, 'Botones Cilindo', CilindroBotonesPage()),
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);
}

final listaBotones = [
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
      texto: 'Botones con deslizamientos',
      color1: Color(0xffF37335),
      color2: Color(0xffFDC830),
      url: EmergencyPage(),
      id: '10'),
  BotonGordo(
      icon: FontAwesomeIcons.shoePrints,
      texto: 'Shop Shoes Love',
      color1: Color(0xffcb2d3e),
      color2: Color(0xffef473a),
      url: ZapatoPage(),
      id: '11'),
  BotonGordo(
      icon: FontAwesomeIcons.music,
      texto: 'Reproductor Musica',
      color1: Color(0xffec9f05),
      color2: Color(0xffff4e00),
      url: ReproductorPage(),
      id: '12'),
  BotonGordo(
      icon: FontAwesomeIcons.arrowAltCircleRight,
      texto: 'Transiciones Page',
      color1: Color(0xff1D976C),
      color2: Color(0xff93F9B9),
      url: TransitionsPage(),
      id: '13'),
  BotonGordo(
      icon: Icons.ads_click_outlined,
      texto: 'Botones Cilindro',
      color1: Color(0xffffe000),
      color2: Color(0xff799f0c),
      url: CilindroBotonesPage(),
      id: '14'),
];

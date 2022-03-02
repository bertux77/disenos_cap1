import 'package:cap1/src/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);
}

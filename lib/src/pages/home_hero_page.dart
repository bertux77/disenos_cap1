import 'package:cap1/src/pages/pages.dart';
import 'package:cap1/src/pages/reproductor_page.dart';
import 'package:cap1/src/pages/transitions_page.dart';
import 'package:cap1/src/pages/zapato_page.dart';
import 'package:cap1/src/routes/routes.dart';
import 'package:cap1/src/theme/theme.dart';
import 'package:cap1/src/widgets/boton_gordo.dart';
import 'package:cap1/src/widgets/drawer_menu.dart';
import 'package:cap1/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HomeHeroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    // CREA UNA LISTA DE BOTONES AÑADIENDO FADEINRIGHT
    List<Widget> itemMap = listaBotones // Lista con fadein
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
            ),
          ),
        )
        .toList();

    return Scaffold(
      drawer: CustomDrawerMenu(),
      //(appTheme.customTheme) ? Color(0xff16202b) : Colors.white
      body: Container(
        color: appTheme.currentTheme.colorScheme.background,
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              floating: true,
              delegate: _SliverCustomHeaderDelegate(
                child: Container(
                  alignment: Alignment.center,
                  color: appTheme.currentTheme.colorScheme.background,
                  child: _Encabezado(),
                ),
                maxheight: 200,
                minheight: 180,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(
                  height: 20,
                ),
                ...itemMap,
              ]),
            ),
          ],
        ),
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
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
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

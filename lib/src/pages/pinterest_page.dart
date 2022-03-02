import 'package:cap1/src/widgets/drawer_menu.dart';
import 'package:cap1/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../widgets/cabecera_pagina_hero.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        drawer: CustomDrawerMenu(),
        body: Stack(
          alignment: Alignment.center,
          children: [
             
            PinterestGrid(),
            const _PinterestMenuLocation(),

            const CabeceraPaginaHero(
              color: Color(0xff3c1053),
              icon: FontAwesomeIcons.pinterest,
              id: '4',
              texto: 'Pinterest Grid',
            ),
          ],
        ),
        //body: PinterestMenu(),
        //child: PinterestGrid(),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  const _PinterestMenuLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    return Positioned(
        bottom: 30,
        child: PinterestMenu(
          mostrar: mostrar,
          items: [
            PinterestButton(
                onPresed: () {
                  print('Icon Pie Chart');
                },
                icon: Icons.pie_chart),
            PinterestButton(
              onPresed: () {
                print('Icon Search');
              },
              icon: Icons.search,
            ),
            PinterestButton(
              onPresed: () {
                print('Icon Notifications');
              },
              icon: Icons.notifications,
            ),
            PinterestButton(
              onPresed: () {
                print('User');
              },
              icon: Icons.supervised_user_circle,
            )
          ],
          // backgroundColor: Colors.white,
          // activeColor: Colors.deepOrange,
          // inactiveColor: Colors.blueGrey,
        ));
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = ScrollController();

  double scrollAnterior = 0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > scrollAnterior && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }

      scrollAnterior = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 130),
      gridDelegate: SliverWovenGridDelegate.count(
        crossAxisCount: 2,
        pattern: [
          const WovenGridTile(1),
          const WovenGridTile(
            5 / 7,
            crossAxisRatio: 0.9,
            alignment: AlignmentDirectional.centerEnd,
          ),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => _PinterestItem(index: index),
          childCount: items.length),
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;
  const _PinterestItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xffad5389) ,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => _mostrar;
  set mostrar(bool valor) {
    _mostrar = valor;
    notifyListeners();
  }
}

import 'package:cap1/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function() onPresed;
  final IconData icon;

  PinterestButton({required this.onPresed, required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final bool mostrar;

  final Color? backgroundColor;
  final Color? activeColor;
  final Color? inactiveColor;
  final List<PinterestButton> items;

  PinterestMenu({
    this.mostrar = true,
    this.backgroundColor = Colors.white,
    this.activeColor = const Color(0xff3c1053),
    this.inactiveColor = Colors.blueGrey,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: AnimatedOpacity(
          duration: const Duration(milliseconds: 250),
          opacity: (mostrar) ? 1 : 0,
          child: Builder(builder: (BuildContext context) {
            Provider.of<_MenuModel>(context).backgroundColor = appTheme.currentTheme.scaffoldBackgroundColor;
            Provider.of<_MenuModel>(context).activeColor = (appTheme.darkTheme) ? appTheme.currentTheme.colorScheme.secondary : activeColor;
            Provider.of<_MenuModel>(context).inactiveColor = inactiveColor;

            return _PinterestMenuBackground(
              child: _MenuItems(menuItems: items),
            );
          })),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  _PinterestMenuBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor!;
    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black38,
              blurRadius: 10,
              spreadRadius: -5,
            )
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;
  const _MenuItems({Key? key, required this.menuItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
            menuItems.length,
            (index) =>
                _PinterestMenuButton(index: index, item: menuItems[index])));
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;
  const _PinterestMenuButton(
      {Key? key, required this.index, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<_MenuModel>(context).itemSeleccionado;
    final menuModel = Provider.of<_MenuModel>(context);
    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSeleccionado =
            index;
        item.onPresed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: (itemSeleccionado == index) ? 35 : 25,
          color: (itemSeleccionado == index)
              ? menuModel.activeColor
              : menuModel.inactiveColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;

  Color? backgroundColor = Colors.white;
  Color? activeColor = Colors.deepOrange;
  Color? inactiveColor = Colors.blueGrey;

  int get itemSeleccionado => _itemSeleccionado;
  set itemSeleccionado(int index) {
    _itemSeleccionado = index;
    notifyListeners();
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Center(child: Text('DOG Notifications ')),
        ),
        body: const Center(
          child: FaIcon(
            FontAwesomeIcons.dog,
            color: Colors.pink,
            size: 180,
          ),
        ),
        floatingActionButton: const BotonFlotante(),
        bottomNavigationBar: const BottomNavigation(),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int numero = Provider.of<_NotificationModel>(context).numero;
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      elevation: 0,
      items: [
        const BottomNavigationBarItem(
          label: 'Bones',
          icon: FaIcon(FontAwesomeIcons.bone),
        ),
        //FaIcon(FontAwesomeIcons.bell)
        BottomNavigationBarItem(
          label: 'Notifications',
          icon: Stack(
            children: [
              const FaIcon(FontAwesomeIcons.bell),
              Positioned(
                top: 0,
                right: 0.0,
                // child: Icon(
                //   Icons.brightness_1,
                //   size: 8,
                //   color: Colors.redAccent,
                child: BounceInDown(
                  from: 20,
                  animate: (numero > 0) ? true : false,
                  child: Bounce(
                    from: 20,
                    controller: (controller) =>
                        Provider.of<_NotificationModel>(context)
                            .bounceController = controller,
                    child: Container(
                      child: Text(
                        '$numero',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 8),
                      ),
                      alignment: Alignment.center,
                      width: 14,
                      height: 14,
                      decoration: const BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const BottomNavigationBarItem(
          label: 'My Dog',
          icon: FaIcon(FontAwesomeIcons.dog),
        )
      ],
    );
  }
}

class BotonFlotante extends StatelessWidget {
  const BotonFlotante({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: const FaIcon(FontAwesomeIcons.play),
        backgroundColor: Colors.pink,
        onPressed: () {
          final notiModel =
              Provider.of<_NotificationModel>(context, listen: false);
          int numero = notiModel.numero;
          numero++;
          notiModel.numero = numero;

          if (numero >= 2) {
            final controller = notiModel.bounceController;
            controller.forward(from: 0.0);
          }
        });
  }
}

class _NotificationModel extends ChangeNotifier {
  int _numero = 0;
  late AnimationController _bounceController;
  int get numero => _numero;
  set numero(int valor) {
    _numero = valor;
    notifyListeners();
  }

  AnimationController get bounceController => _bounceController;
  set bounceController(AnimationController controller) {
    _bounceController = controller;
  }
}

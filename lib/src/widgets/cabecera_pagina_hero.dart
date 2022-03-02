import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CabeceraPaginaHero extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Color color;
  final String id;
  const CabeceraPaginaHero(
      {Key? key,
      required this.icon,
      required this.texto,
      required this.color,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        Hero(
          tag: id,
          child: Stack(
            children: [
              _BotonGordoBackground(
                color: color,
                icon: icon,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 110,
                    width: 40,
                  ),
                  FaIcon(
                    icon,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(
                    width: 9,
                  ),
                  Text(
                    texto,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        decoration: TextDecoration.none),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
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
                    ),
                  ),
                  
                  // const SizedBox(
                  //   width: 40,
                  // ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  final IconData icon;
  final Color color;
  //final Color color2;

  const _BotonGordoBackground({
    Key? key,
    required this.icon,
    required this.color,
    // required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              Positioned(
                right: -20,
                top: -20,
                child: FaIcon(
                  icon,
                  size: 150,
                  color: Colors.white.withOpacity(0.2),
                ),
              )
            ],
          ),
        ),
        width: double.infinity,
        height: 80,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(4, 6),
                blurRadius: 10)
          ],
          borderRadius: BorderRadius.circular(15),
          color: color,
          // gradient: LinearGradient(
          //   colors: [color1, color2],
          // )),
        ));
  }
}

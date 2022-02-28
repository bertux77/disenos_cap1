import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final Function()? onPressed;
  final String url;

  const BotonGordo(
      {Key? key,
      required this.icon,
      required this.texto,
      required this.color1,
      required this.color2,
      this.onPressed,
      required this.url,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the second screen using a named route.
        Navigator.pushNamed(context, url);
      },
      child: Hero(
        tag: url,
        child: Stack(
          children: [
            _BotonGordoBackground(
              color1: color1,
              color2: color2,
              icon: icon,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 110,
                  width: 35,
                ),
                FaIcon(
                  icon,
                  color: Colors.white,
                  size: 40,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    texto,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                const FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 40,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  final IconData icon;
  final Color color1;
  final Color color2;

  const _BotonGordoBackground({
    Key? key,
    required this.icon,
    required this.color1,
    required this.color2,
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
          //color: Colors.red,
          gradient: LinearGradient(
            colors: [color1, color2],
          )),
    );
  }
}

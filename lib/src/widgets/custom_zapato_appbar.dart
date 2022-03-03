import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomZapatoAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          width: double.infinity,
          child: Row(children: [
            const Text('For you',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
            const Spacer(),
            RawMaterialButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              //shape: const CircleBorder(),
              //padding: const EdgeInsets.all(0),
              child: const FaIcon(
                FontAwesomeIcons.ellipsisV,
                color: Colors.black,
                size: 28,
              ),
            )
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReproductorAppBar extends StatelessWidget {
  const ReproductorAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(children: [
          Icon(
            FontAwesomeIcons.chevronLeft,
            color: Colors.white.withOpacity(0.6),
          ),
          const Spacer(),
          Icon(
            FontAwesomeIcons.commentAlt,
            color: Colors.white.withOpacity(0.6),
          ),
          const SizedBox(
            width: 20,
          ),
          Icon(
            FontAwesomeIcons.headphonesAlt,
            color: Colors.white.withOpacity(0.6),
          ),
          const SizedBox(
            width: 20,
          ),
          Icon(
            FontAwesomeIcons.externalLinkAlt,
            color: Colors.white.withOpacity(0.6),
          )
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomZapatoAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          width: double.infinity,
          child: Row(children: const [
            Text('For you',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
            Spacer(),
            Icon(
              Icons.search,
              size: 30,
            ),
          ]),
        ),
      ),
    );
  }
}

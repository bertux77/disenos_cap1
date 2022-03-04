import 'package:cap1/src/widgets/reproductor_appbar.dart';
import 'package:flutter/material.dart';

class ReproductorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: const [
        ReproductorAppBar(),
      ],
    ));
  }
}

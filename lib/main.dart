import 'package:cap1/src/pages/navegacion_page.dart';
import 'package:cap1/src/pages/twitter_page.dart';
import 'package:flutter/material.dart';
import 'package:cap1/src/pages/animate_do_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños APP',
      home: NavegacionPage(),
    );
  }
}

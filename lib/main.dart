//import 'package:disenos_cap1/src/pages/animaciones_page.dart';

// import 'package:cap1/src/labs/circular_progress_page.dart';
// import 'package:cap1/src/pages/graficas_circulas_page.dart';
import 'package:cap1/src/pages/headers_page.dart';
import 'package:cap1/src/pages/headers_page2.dart';
import 'package:cap1/src/pages/slideshow_page.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños APP',
      //home: SlideShowPage(),
      home: HeadersPage2(),
    );
  }
}

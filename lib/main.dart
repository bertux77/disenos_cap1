import 'package:cap1/src/labs/slideshow_page.dart';
import 'package:cap1/src/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:cap1/src/pages/pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños APP',
      //home: EmergencyPage(),
      initialRoute: 'home',
      routes: {
        'home': (_) => HomePage(),
        'twitter': (_) => TwitterPage(),
        'sliver': (_) => SliverListPage(),
        'sliders': (_) => SlideShowPage(),
        'pinterest': (_) => PinterestPage(),
        'dog': (_) => NavegacionPage(),
        'headers': (_) => const HeadersPage2(),
        'graficas': (_) => const GraficasCircularesPage(),
        'animate_do': (_) => AnimateDoPage(),
        'cuadrado': (_) => const AnimacionesPage(),

      },
    );
  }
}

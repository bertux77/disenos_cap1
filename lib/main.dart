import 'package:cap1/src/labs/slideshow_page.dart';
import 'package:cap1/src/pages/home_hero_page.dart';
import 'package:cap1/src/pages/home_page.dart';
import 'package:cap1/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:cap1/src/pages/pages.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  
  ChangeNotifierProvider(
    create: (_) => ThemeChanger(2),
    child: const MyApp(),
    
    ));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Diseños APP',
      //home: EmergencyPage(),
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeHeroPage(),
        'twitter': (_) => TwitterPage(),
        'sliver': (_) => SliverListPage(),
        'sliders': (_) => Slides2ShowPage(),
        'pinterest': (_) => PinterestPage(),
        'dog': (_) => NavegacionPage(),
        'headers': (_) => const HeadersPage2(),
        'graficas': (_) => const GraficasCircularesPage(),
        'animate_do': (_) => AnimateDoPage(),
        'cuadrado': (_) => const AnimacionesPage(),
        'emergency': (_) => EmergencyPage(),
      },
    );
  }
}

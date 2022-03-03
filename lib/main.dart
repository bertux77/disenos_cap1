import 'package:cap1/src/models/zapato_model.dart';
import 'package:cap1/src/pages/home_hero_page.dart';
import 'package:cap1/src/pages/zapato_desc_page.dart';
import 'package:cap1/src/pages/zapato_page.dart';
import 'package:cap1/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:cap1/src/pages/pages.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_) => ThemeChanger(1),),
        ChangeNotifierProvider(create:(_) => ZapatoModel(),)
      ],
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
      initialRoute: 'zapato',
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
        'zapato': (_) => ZapatoPage(),
        'zapatodesc': (_) => ZapatoDescPage(),
      },
    );
  }
}

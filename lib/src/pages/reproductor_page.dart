import 'package:cap1/src/helpers/helpers.dart';
import 'package:cap1/src/widgets/reproductor_appbar.dart';
import 'package:flutter/material.dart';

class ReproductorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ReproductorAppBar(),

        ImagenDiscoDuracion(),

        TituloPlay(),

        Expanded(child: Lyrics())
      ],
    ));
  }
}

class Lyrics extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final lyrics = getLyrics();
    return Container(
      child: ListWheelScrollView(
        physics: BouncingScrollPhysics(),
        itemExtent: 30,
        diameterRatio: 1.5,
        children: lyrics.map(
          (linea) => Text(linea, style: TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.4))),
        ).toList()),
    );
  }
}

class TituloPlay extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 70),
      margin: EdgeInsets.only(top: 40),
      child: Row(
        children: [
          Column(children: [
            Text('Far Away', style: TextStyle(fontSize: 30, color: Colors.white.withOpacity(0.8)),),
            Text('-Breaking Benjamin-', style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.6)),)
            ],
          ),
          Spacer(),
          FloatingActionButton(
            elevation: 0,
            highlightElevation: 0,
            backgroundColor: Color(0xfff8cb51),
            onPressed: (){},
            child: Icon(Icons.play_arrow),
            )
        ],
      ),
    );
  }
}

class ImagenDiscoDuracion extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      margin: EdgeInsets.only(top: 60),
      child: Row(

        children: [
          // Disco girando
          ImagenDisco(),

          //SizedBox(width: 120,),
          Spacer(),
          BarraProgreso(),
          SizedBox(width: 40,),

          // Barra Progreso
        ],
      ),
    );
  }
}

class BarraProgreso extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('03:44', style: TextStyle(color: Colors.white.withOpacity(0.4)),),
          const SizedBox(height: 10,),
          Stack(
            children: [
              Container(
                width: 3,
                height: 230,
                color: Colors.white.withOpacity(0.2),
              ),
               Positioned(
                 bottom: 0,
                 child: Container(
                  width: 3,
                  height: 100,
                  color: Colors.white.withOpacity(0.8),
                             ),
               ),
            ],
          ),
          const SizedBox(height: 10,),
          Text('00:00', style: TextStyle(color: Colors.white.withOpacity(0.4)),)
        ],
      ),
    );
  }
}

class ImagenDisco extends StatelessWidget {
  const ImagenDisco({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: 250,
      height: 250,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Image(image: AssetImage('assets/aurora.jpg')),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(100)
              ),
            ),
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: const Color(0xff1c1c25),
                borderRadius: BorderRadius.circular(100)
              ),
            )
          ],
        ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              Color(0xff484750),
              Color(0xff1E1c24),
            ]
          )
        ),
    );
  }
}

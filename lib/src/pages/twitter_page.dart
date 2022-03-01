import 'package:animate_do/animate_do.dart';
import 'package:cap1/src/widgets/cabecera_pagina_hero.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatefulWidget {
  @override
  State<TwitterPage> createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  bool activar = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: const FaIcon(FontAwesomeIcons.play),
        onPressed: () {
          setState(() {
            activar = true;
          });
        },
      ),
      backgroundColor: const Color(0xff1da1f2),
      body: Stack(children: [
        const CabeceraPaginaHero(
          color: Color(0xff1da1f2),
          icon: FontAwesomeIcons.twitter,
          id: '1',
          texto: 'Twitter Animation',
        ),

        // Pajaro animado y pajado fijo
        const Center(
            child: FaIcon(
          FontAwesomeIcons.twitter,
          color: Colors.white,
          size: 40,
        )),
        Center(
          child: ZoomOut(
            animate: activar,
            from: 30,
            duration: const Duration(seconds: 1),
            child: const FaIcon(
              FontAwesomeIcons.twitter,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
      ]),
    );
  }
}

// class _CabeceraTwitter extends StatelessWidget {
//   const _CabeceraTwitter({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Hero(
//       tag: 'twitter',
//       child: Stack(
//         children: [
//           Container(
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(15),
//               child: Stack(
//                   children: [
//                     Positioned(
//                       right: -20,
//                       top: -20,
//                       child: FaIcon(
//                         FontAwesomeIcons.twitter,
//                         size: 150,
//                         color: Colors.white.withOpacity(0.2),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             width: double.infinity,
//             height: 80,
//             margin: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                       color: Colors.black.withOpacity(0.2),
//                       offset: const Offset(4, 6),
//                       blurRadius: 10)
//                 ],
//                 borderRadius: BorderRadius.circular(15),
//                 color: Colors.blue,
//                 // gradient: LinearGradient(
//                 //   colors: [color1, color2],
//                 // ),
                
//                 ),
//           ),
      
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: const [
//            SizedBox(
//             height: 110,
//             width: 35,
//           ),
//           FaIcon(
//             FontAwesomeIcons.twitter,
//             color: Colors.white,
//             size: 40,
//           ),
//            SizedBox(
//             width: 20,
//           ),
//           Expanded(
//             child: Text(
//               'Twitter',
//               style:  TextStyle(color: Colors.white, fontSize: 18),
//             ),
//           ),
//            FaIcon(
//             FontAwesomeIcons.chevronRight,
//             color: Colors.white,
//           ),
//            SizedBox(
//             width: 40,
//           ),
//         ],
//       ),
//               ]),
//     );
//   }
// }


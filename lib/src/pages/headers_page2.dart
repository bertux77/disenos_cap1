import 'package:cap1/src/widgets/headers.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer_menu.dart';

class HeadersPage2 extends StatefulWidget {
  const HeadersPage2({Key? key}) : super(key: key);

  
  @override
  State<HeadersPage2> createState() => _HeadersPage2State();
}

class _HeadersPage2State extends State<HeadersPage2> {
  @override
  int index = 1;
   Map<int, dynamic> headers = {
      1: HeaderCuadrado(),
      2: HeaderBordersRedondeados(),
      3: HeaderDiagonal(),
      4: HeaderTriangulo(),
      5: HeaderPico(),
      6: HeaderCurvas(),
      7: HeaderMultiCurvas(),
      8: HeaderMultiCurvasReves(),
      9: HeaderMultiCurvasGradient(),

    };
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawerMenu(),
      
        floatingActionButton: FloatingActionButton(
        elevation: 0,
        child: const Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            if(index == 9) {
              index = 0;
            }
            index +=1;
          });
        },
      ),
      // body: AnimatedContainer(
      //   duration: const Duration(milliseconds: 4000),
      //   child: headers[index],
      //   ),

       body: AnimatedSwitcher(
               switchInCurve: Curves.linear,
               switchOutCurve: Curves.linear,
               duration: const Duration(milliseconds: 800),
                // transitionBuilder: (Widget child, Animation<double> animation) {
                //   return ScaleTransition(scale: animation, child: child);
                // },
               child: headers[index]
                //   This key causes the AnimatedSwitcher to interpret this as a "new"
                //   child each time the count changes, so that it will begin its animation
                //   when the count changes.
                //  key: ValueKey<int>(_count),
               
               ),

    );
      
  
  }
}
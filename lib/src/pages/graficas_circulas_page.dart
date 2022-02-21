import 'package:flutter/material.dart';

import '../widgets/radial_progress.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({ Key? key }) : super(key: key);

  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {

  late double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            porcentaje += 10.0;
            if(porcentaje>100) {
              porcentaje = 0;
            }
          });
        },
        
      ),
      //Text('$porcentaje %', style: const TextStyle(fontSize: 50),)
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          //color: Colors.red,
          child: RadialProgress(porcentaje: porcentaje),
        )
       ),
    );
  }
}
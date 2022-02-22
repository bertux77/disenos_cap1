import 'package:flutter/material.dart';

import '../widgets/radial_progress.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({Key? key}) : super(key: key);

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
            if (porcentaje > 100) {
              porcentaje = 0;
            }
          });
        },
      ),
      //Text('$porcentaje %', style: const TextStyle(fontSize: 50),)
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                porcentaje: porcentaje,
                color: Colors.red,
              ),
              CustomRadialProgress(
                porcentaje: porcentaje,
                color: Colors.green,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                porcentaje: porcentaje,
                color: Colors.yellow,
              ),
              CustomRadialProgress(
                porcentaje: porcentaje,
                color: Colors.blue,
              )
            ],
          )
        ],
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;
  const CustomRadialProgress({
    Key? key,
    required this.porcentaje,
    required this.color,
  }) : super(key: key);

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      //color: Colors.red,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: color,
        colorSecundario: Colors.grey,
        grosorfondo: 6,
        grosorCirculo: 8,
      ),
    );
  }
}

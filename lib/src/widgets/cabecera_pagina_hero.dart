import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CabeceraPaginaHero extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Color color;
  final String id;
  const CabeceraPaginaHero({Key? key, required this.icon, required this.texto, required this.color, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: id,
      child: Stack(
        children: [
         
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Stack(
                children: [
                  Positioned(
                    right: -20,
                    top: -20,
                    child: FaIcon(
                      icon,
                      size: 150,
                      color: Colors.white.withOpacity(0.2),
                    ),
                  )
                ],
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, 'home');
                },
                child: const FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  color: Colors.white,
                  size: 16,
                ),
              ),
              const SizedBox(
                height: 110,
                width: 80,
              ),
              FaIcon(
                icon,
                color: Colors.white,
                size: 50,
              ),
              const SizedBox(
                width: 40,
              ),
              Expanded(
                child: Text(
                  texto,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const FaIcon(
                FontAwesomeIcons.hamburger,
                color: Colors.white,
              ),
              const SizedBox(
                width: 40,
              ),
              
            ],
        
          ),
          
        ],
        
      ),
    );
  
  }
}
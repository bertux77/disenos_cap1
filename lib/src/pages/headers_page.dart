
import 'package:flutter/material.dart';

import '../widgets/headers.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    Map<int, dynamic> headers = {
      1: HeaderCuadrado(),
      2: HeaderBordersRedondeados()
      };
    int index = 1;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          print('index: $index');
          index +=1;
          
        },
        
      ),
      body: 
        Container(
          child: headers[index],
        
       ),
    );
  }
}

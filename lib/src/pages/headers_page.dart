import 'package:flutter/material.dart';

import '../widgets/headers.dart';

class HeadersPage extends StatefulWidget {
  const HeadersPage({Key? key}) : super(key: key);

  @override
  State<HeadersPage> createState() => _HeadersPageState();
}

class _HeadersPageState extends State<HeadersPage> {
  @override
  Widget build(BuildContext context) {
    int index = 1;
    Map<int, dynamic> headers = {
      1: HeaderCuadrado(),
      2: HeaderBordersRedondeados()
    };

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            index++;
            print('index: $index');
          });
        },
      ),
      body: Container(
        child: headers[index],
      ),
    );
  }
}

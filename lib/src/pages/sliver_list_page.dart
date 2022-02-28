import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(
            bottom: -1,
            right: 0,
            child: _BotonNewList(),
          ),
        ],
      ),
    );
  }
}

class _BotonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ButtonTheme(
      child: MaterialButton(
        height: 55,
        minWidth: size.width * 0.9,
        color: const Color(0xffED6762),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(25))),
        onPressed: () {},
        child: const Text(
          'CREATE NEW LIST',
          style: TextStyle(
              color: Colors.white,
              fontSize: 21,
              fontWeight: FontWeight.bold,
              letterSpacing: 2),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = const [
    _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
    _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
    _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
    _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            child: Container(
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: const _Titulo(),
            ),
            maxheight: 200,
            minheight: 160,
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            const SizedBox(
              height: 70,
            )
          ]),
        ),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minheight;
  final double maxheight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    required this.minheight,
    required this.maxheight,
    required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxheight;

  @override
  double get minExtent => minheight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxheight != oldDelegate.maxheight ||
        minheight != oldDelegate.minheight ||
        child != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
  const _Titulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: const Text(
            'NEW',
            style: TextStyle(color: Color(0xff532128), fontSize: 50),
          ),
        ),
        Stack(
          children: [
            const SizedBox(
              width: 100,
            ),
            Positioned(
              bottom: 8,
              child: Container(
                width: 120,
                height: 8,
                decoration: const BoxDecoration(color: Color(0xfff7cdd5)),
              ),
            ),
            Container(
              child: const Text(
                'List',
                style: TextStyle(
                    color: Color(0xffd9a3a30),
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _ListaTareas extends StatelessWidget {
  final items = const [
    _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
    _ListItem(titulo: 'Orange', color: Color(0xffF08F66)),
    _ListItem(titulo: 'Family', color: Color(0xffF2A38A)),
    _ListItem(titulo: 'Subscriptions', color: Color(0xffF7CDD5)),
    _ListItem(titulo: 'Books', color: Color(0xffFCEBAF)),
  ];
 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (_, i) => items[i]);
  }
}

class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;

  const _ListItem({Key? key, required this.titulo, required this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        titulo,
        style: const TextStyle(
            fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      height: 120,
      margin: const EdgeInsets.all(10),
      //color: Colors.red,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
    );
  }
}

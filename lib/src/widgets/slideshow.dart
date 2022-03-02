import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color? colorPrimario;
  final Color? colorSecundario;
  final double? bulletPrimario;
  final double? bulletSecundario;

  const SlideShow({
    Key? key,
    required this.slides,
    this.puntosArriba = false,
    this.colorPrimario,
    this.colorSecundario,
    this.bulletPrimario = 15.0,
    this.bulletSecundario = 12.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SlideshowModel>(context).colorPrimario =
                  colorPrimario!;
              Provider.of<_SlideshowModel>(context).colorSecundario =
                  colorSecundario!;
              Provider.of<_SlideshowModel>(context).bulletPrimario =
                  bulletPrimario!;
              Provider.of<_SlideshowModel>(context).bulletSecundario =
                  bulletSecundario!;
              return _CrearEstructuraSlideShow(
                  puntosArriba: puntosArriba, slides: slides);
            },
          ),
        ),
      ),
    );
  }
}

class _CrearEstructuraSlideShow extends StatelessWidget {
  const _CrearEstructuraSlideShow({
    Key? key,
    required this.puntosArriba,
    required this.slides,
  }) : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (puntosArriba) _Dots(totalSlides: slides.length),
        Expanded(
          child: _Slides(slides: slides),
        ),
        if (!puntosArriba) _Dots(totalSlides: slides.length)
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  const _Dots({Key? key, required this.totalSlides}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 10,
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            totalSlides,
            (index) => _Dot(
                  index: index,
                )),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final slideshowModel = Provider.of<_SlideshowModel>(context);
    double tamano = 0;
    Color color;
    if ((slideshowModel.currentPage >= index - 0.5 &&
        slideshowModel.currentPage < index + 0.5)) {
      tamano = slideshowModel.bulletPrimario;
      color = slideshowModel.colorPrimario;
    } else {
      tamano = slideshowModel.bulletSecundario;
      color = slideshowModel.colorSecundario;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: tamano,
      height: tamano,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides({Key? key, required this.slides}) : super(key: key);
  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides
            .map((slide) => _Slide(
                  slide: slide,
                ))
            .toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide({required this.slide});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(50),
      child: slide,
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  double _bulletPrimario = 12.0;
  double _bulletSecundario = 12.0;

  double get currentPage => _currentPage;

  set currentPage(double pagina) {
    _currentPage = pagina;
    notifyListeners();
  }

  Color get colorPrimario => _colorPrimario;
  set colorPrimario(Color color) {
    _colorPrimario = color;
    //notifyListeners();
  }

  Color get colorSecundario => _colorSecundario;
  set colorSecundario(Color color) {
    _colorSecundario = color;
    //notifyListeners();
  }

  double get bulletPrimario => _bulletPrimario;
  set bulletPrimario(double tamano) {
    _bulletPrimario = tamano;
    //notifyListeners();
  }

  double get bulletSecundario => _bulletSecundario;
  set bulletSecundario(double tamano) {
    _bulletSecundario = tamano;
    //notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SlideShow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;

  const SlideShow({Key? key, required this.slides, this.puntosArriba = false, this.colorPrimario = Colors.blue, this.colorSecundario = Colors.grey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: SafeArea(
        child: Center(
            child: Column(
              children: [
                if(puntosArriba)  _Dots(totalSlides: slides.length),
                Expanded(
                  child: _Slides(slides: slides),
                  ),
               if(!puntosArriba) _Dots(totalSlides: slides.length)
              ],
            )),
      ),
      
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
      height: 70,
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSlides, (index) => _Dot(index:index,)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;
  
  const _Dot({
    Key? key, required this.index, 
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final slideshowModel = Provider.of<_SlideshowModel>(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: (slideshowModel.currentPage >= index - 0.5 && slideshowModel.currentPage < index + 0.5) ? slideshowModel.colorPrimario : slideshowModel.colorSecundario,
        shape: BoxShape.circle
      ), 
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
      Provider.of<_SlideshowModel>(context, listen: false).currentPage = pageViewController.page! ;
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
        children: widget.slides.map( (slide) => _Slide(slide: slide,) ).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide({required this.slide}) ;

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

class _SlideshowModel with ChangeNotifier{
  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;

  double get currentPage => _currentPage;

  set currentPage(double pagina) {
    _currentPage = pagina;
    notifyListeners();
  }

  Color get colorPrimario => _colorPrimario;
  set colorPrimario(Color color) {
    _colorPrimario = color;
    notifyListeners();
  }

  Color get colorSecundario => _colorSecundario;
  set colorSecundario(Color color) {
    _colorSecundario = color;
    notifyListeners();
  }
}
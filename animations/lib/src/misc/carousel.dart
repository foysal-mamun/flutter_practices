import 'package:flutter/material.dart';

class CarouselDemo extends StatelessWidget {
  static const String routeName = '/misc/carousel';
  static const String demoName = 'Carousel';

  static const List<String> fileNames = [
    'eat_cape_town_sm.jpg',
    'eat_new_orleans_sm.jpg',
    'eat_sydney_sm.jpg',
  ];

  final List<Widget> images = 
    fileNames.map( (file) => Image.asset(file, fit: BoxFit.cover) ).toList();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(CarouselDemo.demoName),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: AspectRatio(
            aspectRatio: 1,
            child: Carousel(itemBuilder: widgetBuilder),
          ),
        ),
      ),
    );
  }

  Widget widgetBuilder(BuildContext context, int index) {
    return images[index % images.length];
  }
}

class Carousel extends StatefulWidget {
  final IndexedWidgetBuilder itemBuilder;

  const Carousel({Key key, @required this.itemBuilder});

  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  PageController _controller;
  int _currentpage;
  bool _pageHasChanged = false;

  @override
  void initState() {
    super.initState();
    _currentpage = 0;
    _controller = PageController(
      viewportFraction: .85,
      initialPage: _currentpage
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget builder(BuildContext context, Widget child, int index) {
    var size = MediaQuery.of(context).size;
    var result = _pageHasChanged ? _controller.page : _currentpage * 1.0;
    var value = result - index;
    value = ( 1 - (value.abs() * .5) ).clamp(0.0, 1.0) as double;

    return Center(
      child: SizedBox(
        height: Curves.easeOut.transform(value) * size.height,
        width: Curves.easeOut.transform(value) * size.width,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return PageView.builder(
      controller: _controller,
      itemBuilder: (context, index) => AnimatedBuilder(
        animation: _controller, 
        builder: (context, child) => builder(context, child, index),
        child: widget.itemBuilder(context, index),
      ),
      onPageChanged: (value) {
        setState(() {
          _pageHasChanged = true;
          _currentpage = value;
        });
      },
    );
  }
}
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'arrow_button.dart';

class ShirtCarouselSlider extends StatefulWidget {
  const ShirtCarouselSlider({@required this.height, @required this.items});
  final double height;
  final List<Widget> items;

  @override
  _ShirtCarouselSliderState createState() => _ShirtCarouselSliderState();
}

class _ShirtCarouselSliderState extends State<ShirtCarouselSlider> {
  final _ctrl = CarouselController();
  var _currentSlideIndex = 0;

  @override
  Widget build(BuildContext context) {
    const arrowMargin = 18.0;
    const aSec = Duration(seconds: 1);
    const curve = Curves.easeInOutQuart;

    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider(
          carouselController: _ctrl,
          options: CarouselOptions(
            height: widget.height,
            viewportFraction: 1.0,
            onPageChanged: (idx, _) => setState(() => _currentSlideIndex = idx),
            enableInfiniteScroll: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 15),
            disableCenter: true,
          ),
          items: widget.items,
        ),
        if (_currentSlideIndex > 0)
          Positioned(
            left: arrowMargin,
            child: ArrowButton(
              onPressed: () => _ctrl.previousPage(duration: aSec, curve: curve),
              direction: AxisDirection.left,
              brightness: Brightness.dark,
            ),
          ),
        if (_currentSlideIndex < widget.items.length - 1)
          Positioned(
            right: arrowMargin,
            child: ArrowButton(
              onPressed: () => _ctrl.nextPage(duration: aSec, curve: curve),
              direction: AxisDirection.right,
              brightness: Brightness.dark,
            ),
          ),
      ],
    );
  }
}

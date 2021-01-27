import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../widgets/other/arrow_button.dart';
import 'logo_page.dart';
import 'shirts_overview_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//   var _isInitialized = false;
  final _controller = CarouselController();

//   @override
//   void didChangeDependencies() {
//     if (!_isInitialized) {
//       const shirtsOverviewBackgroundAspectRatio = 6328.0 / 6148.0;
//       final pageHeight = MediaQuery.of(context).size.height;
//       final shirtsOverviewBackgroundHeight = pageHeight - 90.0 - 2 * 80.0;
//       final shirtsOverviewBackgroundWidth =
//           shirtsOverviewBackgroundHeight * shirtsOverviewBackgroundAspectRatio;

//       precacheImage(
//         const AssetImage('web/images/brand/logo.png'),
//         context,
//         size: const Size(350.0, 88.2),
//       );
//       precacheImage(
//         const AssetImage('web/images/brand/shirts_overview_background.png'),
//         context,
//         size: Size(
//           shirtsOverviewBackgroundWidth,
//           shirtsOverviewBackgroundHeight,
//         ),
//       );
//       _isInitialized = true;
//     }
//     super.didChangeDependencies();
//   }

  @override
  Widget build(BuildContext context) {
    const arrowMargin = 12.5;
    const arrowHeight = 15.0;
    const aSecond = Duration(seconds: 1);

    return Scaffold(
      body: CarouselSlider(
        carouselController: _controller,
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height,
          viewportFraction: 1.0,
          scrollDirection: Axis.vertical,
          enableInfiniteScroll: false,
          pageSnapping: false,
        ),
        items: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              LogoPage(),
              Positioned(
                bottom: arrowMargin,
                height: arrowHeight,
                child: ArrowButton(
                  onPressed: () {
                    _controller.animateToPage(
                      1,
                      duration: aSecond,
                      curve: Curves.easeInOut,
                    );
                  },
                  direction: AxisDirection.down,
                  brightness: Brightness.dark,
                ),
              ),
            ],
          ),
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              ShirtsOverviewPage(),
              Positioned(
                top: arrowMargin,
                height: arrowHeight,
                child: ArrowButton(
                  onPressed: () {
                    _controller.animateToPage(
                      0,
                      duration: aSecond,
                      curve: Curves.easeInOut,
                    );
                  },
                  direction: AxisDirection.up,
                  brightness: Brightness.light,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

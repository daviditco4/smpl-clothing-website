import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

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
    final height = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final subtitle1 = textTheme.subtitle1;
    const aSecond = Duration(seconds: 1);

    return Scaffold(
      body: CarouselSlider(
        carouselController: _controller,
        options: CarouselOptions(
          height: height,
          viewportFraction: 1.0,
          scrollDirection: Axis.vertical,
          enableInfiniteScroll: false,
          pageSnapping: false,
        ),
        items: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                height: height,
                color: theme.shadowColor,
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'web/images/brand/logo.png',
                      width: 350.0,
                      height: 88.2,
                    ),
                    const SizedBox(height: 30.0),
                    Text('1ST DROP', style: textTheme.subtitle2),
                  ],
                ),
              ),
              Positioned(
                bottom: 30.0,
                height: 15.0,
                child: FlatButton(
                  onPressed: () {
                    _controller.animateToPage(
                      1,
                      duration: aSecond,
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Image.asset(
                    'web/images/arrows/down_arrow_yellow.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ],
          ),
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Container(
                height: height,
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(80.0),
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Image.asset(
                              'web/images/brand/shirts_overview_background.png',
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 90.0,
                      color: theme.shadowColor,
                      padding: const EdgeInsets.only(
                        top: 15.0,
                        left: 15.0,
                        bottom: 10.0,
                      ),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('CONTACTANOS', style: subtitle1),
                                  const SizedBox(height: 7.5),
                                  Text(
                                    'contacto.sample.ar@gmail.com',
                                    style: textTheme.caption,
                                  ),
                                ],
                              ),
                              const SizedBox(width: 25.0),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('REDES SOCIALES', style: subtitle1),
                                  const SizedBox(height: 4.0),
                                  const Icon(LineAwesomeIcons.instagram),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            'copyright SAMPLE - 2021 - todos los derechos reservados',
                            style: textTheme.overline,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 30.0,
                height: 15.0,
                child: FlatButton(
                  onPressed: () {
                    _controller.animateToPage(
                      0,
                      duration: aSecond,
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Image.asset(
                    'web/images/arrows/up_arrow_black.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

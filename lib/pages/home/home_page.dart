import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final subtitle1 = textTheme.subtitle1;

    return Scaffold(
      body: CarouselSlider(
        options: CarouselOptions(
          height: height,
          viewportFraction: 1.0,
          scrollDirection: Axis.vertical,
          enableInfiniteScroll: false,
        ),
        items: [
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
        ],
      ),
    );
  }
}

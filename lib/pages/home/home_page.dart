import 'package:flutter/material.dart';

import '../../widgets/other/arrow_button.dart';
import '../../widgets/other/footer.dart';
import 'logo_page.dart';
import 'shirts_overview_page.dart';

class HomePage extends StatelessWidget {
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    const arrowMargin = 10.0;
    const aSecond = Duration(seconds: 1);

    return Scaffold(
      body: ListView(
        controller: _controller,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              LogoPage(),
              Positioned(
                bottom: arrowMargin,
                child: ArrowButton(
                  onPressed: () {
                    _controller.animateTo(
                      MediaQuery.of(context).size.height,
                      duration: aSecond,
                      curve: Curves.easeOutBack,
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
                child: ArrowButton(
                  onPressed: () {
                    _controller.animateTo(
                      0.0,
                      duration: aSecond,
                      curve: Curves.easeInOutQuart,
                    );
                  },
                  direction: AxisDirection.up,
                  brightness: Brightness.light,
                ),
              ),
            ],
          ),
          Footer(),
        ],
      ),
    );
  }
}

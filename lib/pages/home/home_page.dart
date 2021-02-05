import 'package:flutter/material.dart';

import '../../widgets/other/arrow_button.dart';
import '../../widgets/other/footer.dart';
import '../../widgets/other/nav_bar.dart';
import 'logo_page.dart';
import 'shirts_overview_page.dart';

class HomePage extends StatelessWidget {
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    const navBar = NavBar(Brightness.dark);
    const arrowMargin = 18.0;
    const aSecond = Duration(seconds: 1);
    final pageHeight = MediaQuery.of(context).size.height;
    final bodyHeight = pageHeight - navBar.preferredSize.height;

    return Scaffold(
      appBar: navBar,
      body: ListView(
        controller: _controller,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              LogoPage(height: bodyHeight),
              Positioned(
                bottom: arrowMargin,
                child: ArrowButton(
                  onPressed: () {
                    _controller.animateTo(
                      bodyHeight,
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
              ShirtsOverviewPage(height: bodyHeight),
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

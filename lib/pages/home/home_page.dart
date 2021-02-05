import 'package:flutter/material.dart';

import '../../widgets/other/arrow_button.dart';
import '../../widgets/other/footer.dart';
import '../../widgets/other/nav_bar.dart';
import 'logo_page.dart';
import 'shirts_overview_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Building home page...');
    var navBar = const NavBar(Brightness.dark);
    final pageHeight = MediaQuery.of(context).size.height;
    final bodyHeight = pageHeight - navBar.preferredSize.height;
    final isScrolled = ModalRoute.of(context).settings.arguments == true;
    final ctrl = ScrollController(
      initialScrollOffset: isScrolled ? bodyHeight : 0.0,
    );
    const aSec = Duration(seconds: 1);
    final scrollToShirtsOverview = () {
      return ctrl.animateTo(
        bodyHeight,
        duration: aSec,
        curve: Curves.easeOutBack,
      );
    };
    navBar = NavBar(
      Brightness.dark,
      scrollToShirtsOverview: scrollToShirtsOverview,
    );
    const arrowMargin = 18.0;

    return Scaffold(
      appBar: navBar,
      body: ListView(
        controller: ctrl,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              LogoPage(height: bodyHeight),
              Positioned(
                bottom: arrowMargin,
                child: ArrowButton(
                  onPressed: scrollToShirtsOverview,
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
                    ctrl.animateTo(
                      0.0,
                      duration: aSec,
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

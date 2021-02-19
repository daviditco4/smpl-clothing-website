import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/shirts/shirts.dart';
import '../../widgets/items/shirt_slide_item.dart';
import '../../widgets/other/arrow_button.dart';
import '../../widgets/other/footer.dart';
import '../../widgets/other/nav_bar.dart';
import '../../widgets/other/shirts_carousel_slider.dart';
import 'logo_page.dart';
import 'shirts_overview_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _isInitialized = false;
  ScrollController _ctrl;

  @override
  void didChangeDependencies() {
    if (!_isInitialized) {
      final isScrolled = ModalRoute.of(context).settings.arguments == true;
      if (isScrolled) {
        final pageHeight = MediaQuery.of(context).size.height;
        const navBar = NavBar(brightness: Brightness.dark, isCollapsed: true);
        final bodyHeight = pageHeight - navBar.preferredSize.height;
        _ctrl = ScrollController(initialScrollOffset: bodyHeight);
      } else {
        _ctrl = ScrollController();
      }
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final pageHeight = MediaQuery.of(context).size.height;
    var navBar = const NavBar(brightness: Brightness.dark, isCollapsed: true);
    final bodyHeight = pageHeight - navBar.preferredSize.height;
    const aSec = Duration(seconds: 1);

    final scrollToShirtsOverview = () {
      return _ctrl.animateTo(
        bodyHeight,
        duration: aSec,
        curve: Curves.easeOutBack,
      );
    };

    navBar = NavBar(
      brightness: Brightness.dark,
      isCollapsed: true,
      scrollToShirtsOverview: scrollToShirtsOverview,
    );

    const arrowMargin = 18.0;

    return Scaffold(
      appBar: navBar,
      body: ListView(
        controller: _ctrl,
        children: [
          ShirtCarouselSlider(
            height: bodyHeight,
            items: [
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
              ...Provider.of<Shirts>(context).values.map(
                (shirt) {
                  return ShirtSlideItem(shirt, height: bodyHeight);
                },
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
                    _ctrl.animateTo(
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
          Footer(Brightness.dark),
        ],
      ),
    );
  }
}

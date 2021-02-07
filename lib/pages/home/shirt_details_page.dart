import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/shirts/shirts.dart';
import '../../widgets/other/arrow_button.dart';
import '../../widgets/other/footer.dart';
import '../../widgets/other/nav_bar.dart';
import '../../widgets/other/other_shirts_row.dart';
import '../../widgets/other/shirt_details.dart';

class ShirtDetailsPage extends StatelessWidget {
  static const routeName = '/shirt-details';
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    const navBar = NavBar(brightness: Brightness.dark, isCollapsed: true);
    final pageSize = MediaQuery.of(context).size;
    final id = ModalRoute.of(context).settings.arguments as String;
    final shirt = Provider.of<Shirts>(context, listen: false).findById(id);

    return Scaffold(
      appBar: navBar,
      body: ListView(
        controller: _controller,
        children: [
          Container(
            width: pageSize.width,
            height: pageSize.height - navBar.preferredSize.height,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 332.0,
                      vertical: 104.0,
                    ),
                    child: ShirtDetails(shirt),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: ArrowButton(
                    onPressed: () {
                      _controller.animateTo(
                        _controller.position.maxScrollExtent,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOutQuart,
                      );
                    },
                    direction: AxisDirection.down,
                    arrowLength: 12.0,
                    brightness: Brightness.light,
                    label: 'más del drop #1',
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 244.0,
            padding: const EdgeInsets.symmetric(horizontal: 230.0),
            alignment: Alignment.center,
            child: OtherShirtsRow(shirt.id),
          ),
          Footer(),
        ],
      ),
    );
  }
}

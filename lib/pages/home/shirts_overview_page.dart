import 'package:flutter/material.dart';

import '../../widgets/other/footer.dart';
import '../../widgets/other/shirts_grid.dart';

class ShirtsOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              // padding: const EdgeInsets.symmetric(
              //   horizontal: 240.0,
              //   vertical: 80.0,
              // ),
              padding: const EdgeInsets.all(80.0),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset(
                    'web/images/brand/shirts_overview_background.png',
                    fit: BoxFit.contain,
                  ),
                  ShirtsGrid(),
                ],
              ),
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}

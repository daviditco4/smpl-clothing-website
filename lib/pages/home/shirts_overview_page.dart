import 'package:flutter/material.dart';

import '../../widgets/other/shirts_grid.dart';

class ShirtsOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(
        horizontal: 308.0,
        vertical: 56.0,
      ),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage(
              'web/images/brand/shirts_overview_background.png',
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: ShirtsGrid(),
      ),
    );
  }
}

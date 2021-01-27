import 'package:flutter/material.dart';

import '../../widgets/other/footer.dart';
import '../../widgets/other/shirt_details.dart';

class ShirtDetailsPage extends StatelessWidget {
  static const routeName = '/shirt-details';

  @override
  Widget build(BuildContext context) {
    final pageSize = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: pageSize.width,
            height: pageSize.height,
            padding: const EdgeInsets.symmetric(
              horizontal: 332.0,
              vertical: 104.0,
            ),
            child: ShirtDetails(),
          ),
          Footer(),
        ],
      ),
    );
  }
}

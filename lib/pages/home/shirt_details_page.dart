import 'package:flutter/material.dart';

import '../../widgets/other/arrow_button.dart';
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
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 332.0,
                      vertical: 104.0,
                    ),
                    child: ShirtDetails(),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: ArrowButton(
                    onPressed: null,
                    direction: AxisDirection.down,
                    arrowLength: 12.0,
                    label: 'más del drop #1',
                  ),
                ),
              ],
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}

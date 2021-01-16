import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/shirts/shirts.dart';
import '../items/shirt_item.dart';

class ShirtsGrid extends StatelessWidget {
  // List<Widget> _buildRowItems(Shirts shirts, int rowIndex) {
  //   final startIndex = rowIndex * 3;

  //   return shirts.values.sublist(startIndex, startIndex + 3).map(
  //     (shirt) {
  //       return ChangeNotifierProvider.value(value: shirt, child: ShirtItem());
  //     },
  //   ).toList();
  // }

  @override
  Widget build(BuildContext context) {
    final shirts = Provider.of<Shirts>(context, listen: false);

    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: _buildRowItems(shirts, 0),
    //     ),
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: _buildRowItems(shirts, 1),
    //     ),
    //   ],
    // );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: shirts.values.map(
        (shirt) {
          return ChangeNotifierProvider.value(value: shirt, child: ShirtItem());
        },
      ).toList(),
    );
  }
}

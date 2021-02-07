import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/shirts/shirts.dart';
import 'shirt_image_link.dart';

class OtherShirtsRow extends StatelessWidget {
  const OtherShirtsRow(this.shirtId);
  final String shirtId;

  @override
  Widget build(BuildContext context) {
    final shirts = Provider.of<Shirts>(context, listen: false);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: shirts.allValuesButOne(shirtId).map(
        (shirt) {
          return ShirtImageLink(shirt, shouldPush: false, width: 88.0);
        },
      ).toList(),
    );
  }
}

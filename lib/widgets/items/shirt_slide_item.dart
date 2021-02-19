import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/shirts/shirt.dart';
import '../../models/shirts/shirts.dart';
import '../other/shirt_slide_info.dart';

class ShirtSlideItem extends StatelessWidget {
  const ShirtSlideItem(this.shirt, {@required this.height});
  final Shirt shirt;
  final double height;

  @override
  Widget build(BuildContext context) {
    final index = Provider.of<Shirts>(context, listen: false).indexOf(shirt);
    final isEven = index.isEven;

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        image: DecorationImage(
          alignment: isEven ? Alignment.bottomRight : Alignment.bottomLeft,
          fit: BoxFit.contain,
          image: AssetImage('web/images/slides/slide$index.png'),
        ),
      ),
      padding: const EdgeInsets.only(
        right: 216.0,
        bottom: 104.0,
        left: 180.0,
        top: 180.0,
      ),
      alignment: isEven ? Alignment.topLeft : Alignment.bottomRight,
      child: ShirtSlideInfo(shirt),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../converter.dart';
import '../../models/shirts/shirt.dart';
import '../other/shirt_image_link.dart';

class ShirtItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shirt = Provider.of<Shirt>(context, listen: false);
    final textTheme = Theme.of(context).primaryTextTheme;

    return Container(
      width: 160.0,
      height: 220.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: ShirtImageLink(shirt, shouldPush: true)),
          const SizedBox(height: 14.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('"${shirt.name}"', style: textTheme.subtitle1),
                const SizedBox(height: 4.0),
                Text(shirt.id, style: textTheme.caption),
                const SizedBox(height: 8.0),
                Text(priceToString(shirt.price), style: textTheme.subtitle2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/shirts/shirt.dart';

class ShirtItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shirt = Provider.of<Shirt>(context, listen: false);
    final textTheme = Theme.of(context).primaryTextTheme;

    return Container(
      width: 180.0,
      height: 249.0,
      child: Column(
        children: [
          Expanded(child: Image.asset(shirt.imageUrls[0], fit: BoxFit.contain)),
          const SizedBox(height: 18.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('"${shirt.name}"', style: textTheme.subtitle1),
                const SizedBox(height: 7.5),
                Text(shirt.brandId, style: textTheme.caption),
                const SizedBox(height: 13.5),
                Text('${shirt.price}', style: textTheme.subtitle2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

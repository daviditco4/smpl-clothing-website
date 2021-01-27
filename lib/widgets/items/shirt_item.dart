import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/shirts/shirt.dart';
import '../../pages/home/shirt_details_page.dart';

class ShirtItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shirt = Provider.of<Shirt>(context, listen: false);
    final textTheme = Theme.of(context).primaryTextTheme;

    // return Container(
    //   width: 247.5,
    //   height: 342.375,
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.stretch,
    //     children: [
    //       Expanded(child: Image.asset(shirt.imageUrls[0], fit: BoxFit.contain)),
    //       const SizedBox(height: 18.0),
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 49.5),
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text('"${shirt.name}"', style: textTheme.subtitle1),
    //             const SizedBox(height: 7.5),
    //             Text(shirt.brandId, style: textTheme.caption),
    //             const SizedBox(height: 13.5),
    //             Text('${shirt.price}', style: textTheme.subtitle2),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
    return Container(
      width: 365.5,
      height: 252.0,
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  ShirtDetailsPage.routeName,
                  arguments: shirt.serverId,
                );
              },
              child: Image.asset(shirt.imageUrls[0], fit: BoxFit.contain),
            ),
          ),
          const SizedBox(width: 18.0),
          Container(
            width: 100.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '"${shirt.name}"',
                  style: textTheme.subtitle1,
                  softWrap: false,
                  overflow: TextOverflow.visible,
                ),
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thumbnails_view/thumbnails_view.dart';

import '../../models/shirts/shirts.dart';
import 'shirt_details_info.dart';

class ShirtDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final shirt = Provider.of<Shirts>(context, listen: false).findById(id);

    return Row(
      children: [
        Expanded(
          child: ThumbnailsView(
            images: shirt.imageUrls.map((url) => AssetImage(url)).toList(),
            thumbnailBuilder: (ctx, image, isCurrent) {
              return Container(
                margin: const EdgeInsets.all(6.0),
                width: 32.8,
                height: 32.8,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isCurrent ? Theme.of(ctx).shadowColor : Colors.grey,
                    width: 2.4,
                  ),
                ),
                child: Image(fit: BoxFit.fill, image: image),
              );
            },
            options: const ThumbnailsViewOptions(
              thumbnailsPosition: AxisDirection.left,
              middleGap: 62.0,
            ),
          ),
        ),
        const SizedBox(width: 104.0),
        ShirtDetailsInfo(shirt),
      ],
    );
  }
}

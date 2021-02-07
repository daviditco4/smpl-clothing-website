import 'package:flutter/material.dart';

import '../../models/shirts/shirt.dart';
import '../../pages/home/shirt_details_page.dart';

class ShirtImageLink extends StatelessWidget {
  const ShirtImageLink(this.shirt, {@required this.shouldPush, this.width});
  final Shirt shirt;
  final bool shouldPush;
  final double width;

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    return InkWell(
      onTap: () {
        if (shouldPush) {
          navigator.pushNamed(ShirtDetailsPage.routeName, arguments: shirt.id);
        } else {
          navigator.pushReplacementNamed(
            ShirtDetailsPage.routeName,
            arguments: shirt.id,
          );
        }
      },
      child: Image.asset(shirt.imageUrls[0], width: width, fit: BoxFit.contain),
    );
  }
}

import 'package:flutter/material.dart';

import '../../models/shirts/shirt.dart';
import 'buy_shirt_form.dart';
import 'shirt_care_info.dart';

class ShirtDetailsInfo extends StatelessWidget {
  const ShirtDetailsInfo(this.shirt);
  final Shirt shirt;

  @override
  Widget build(BuildContext context) {
    const headerSpacing = SizedBox(height: 16.0);
    final primaryTextTheme = Theme.of(context).primaryTextTheme;

    return Container(
      width: 132.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text('"${shirt.name}"', style: primaryTextTheme.headline4),
          ),
          headerSpacing,
          Text(shirt.id, style: primaryTextTheme.button),
          headerSpacing,
          Text(
            '\$ ${shirt.price.toStringAsFixed(2)}',
            style: primaryTextTheme.bodyText1,
          ),
          const SizedBox(height: 28.0),
          BuyShirtForm(shirt),
          const SizedBox(height: 8.0),
          OutlinedButton(
            onPressed: () {},
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(0.0, 24.0)),
            ),
            child: Text('guía de talles', style: primaryTextTheme.overline),
          ),
          headerSpacing,
          ShirtCareInfo(),
          Text(shirt.description, style: primaryTextTheme.overline),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../models/shirts/shirt.dart';
import '../../pages/home/shirt_details_page.dart';

class ShirtSlideInfo extends StatelessWidget {
  const ShirtSlideInfo(this.shirt);
  final Shirt shirt;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 228.0,
      height: 96.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: shirt.name.characters.map(
              (char) {
                return Text(
                  char,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.05,
                    color: theme.colorScheme.primary,
                  ),
                );
              },
            ).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: shirt.id.characters.map(
              (char) {
                return Text(
                  char,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 9.95,
                    color: theme.colorScheme.primary,
                  ),
                );
              },
            ).toList(),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                ShirtDetailsPage.routeName,
                arguments: shirt.id,
              );
            },
            style: theme.elevatedButtonTheme.style.copyWith(
              backgroundColor: MaterialStateProperty.all(Colors.white),
            ),
            child: Text(
              'MORE INFO',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 11.8,
                letterSpacing: 1.8,
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

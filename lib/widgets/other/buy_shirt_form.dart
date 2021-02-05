import 'package:flutter/material.dart';

import '../../models/shirts/shirt.dart';
import '../../models/utils/clothing_size.dart';
import 'clothing_size_dropdown_button.dart';

class BuyShirtForm extends StatefulWidget {
  const BuyShirtForm(this.shirt);
  final Shirt shirt;
  @override
  _BuyShirtFormState createState() => _BuyShirtFormState();
}

class _BuyShirtFormState extends State<BuyShirtForm> {
  ClothingSize _selectedSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryTextTheme = theme.primaryTextTheme;
    final bigOverline = primaryTextTheme.overline.copyWith(fontSize: 15.375);
    final button = primaryTextTheme.button;
    final yellowButton = button.copyWith(color: theme.colorScheme.primary);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('talle', style: bigOverline),
            ClothingSizeDropdownButton(
              onChanged: (size) => _selectedSize = size,
              getter: () => _selectedSize,
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        ElevatedButton(
          onPressed: () {},
          child: Text('COMPRAR', style: yellowButton),
        ),
      ],
    );
  }
}

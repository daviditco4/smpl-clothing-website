import 'package:flutter/foundation.dart';

import '../utils/clothing_size.dart';
import '../utils/price.dart';
import 'shirt.dart';

class Shirts with ChangeNotifier {
  var _values = const [
    Shirt(
      serverId: 's1',
      brandId: '#C001',
      name: 'CASINO',
      imageUrls: ['web/images/shirts/shirt_0.png'],
      price: Price(1799.0),
      description: 'remera 100% algodón\nfit regular',
      stock: {
        ClothingSize.small: 2,
        ClothingSize.medium: 2,
        ClothingSize.large: 2,
      },
    ),
    Shirt(
      serverId: 's2',
      brandId: '#C002',
      name: 'LA LUNA',
      imageUrls: ['web/images/shirts/shirt_1.png'],
      price: Price(1799.0),
      description: 'remera 100% algodón\nfit regular',
      stock: {
        ClothingSize.small: 2,
        ClothingSize.medium: 2,
        ClothingSize.large: 2,
      },
    ),
    Shirt(
      serverId: 's3',
      brandId: '#C003',
      name: 'RUNNER',
      imageUrls: ['web/images/shirts/shirt_2.png'],
      price: Price(1799.0),
      description: 'remera 100% algodón\nfit regular',
      stock: {
        ClothingSize.small: 2,
        ClothingSize.medium: 2,
        ClothingSize.large: 2,
      },
    ),
    Shirt(
      serverId: 's4',
      brandId: '#C004',
      name: 'THUNDER',
      imageUrls: ['web/images/shirts/shirt_3.png'],
      price: Price(1799.0),
      description: 'remera 100% algodón\nfit regular',
      stock: {
        ClothingSize.small: 2,
        ClothingSize.medium: 2,
        ClothingSize.large: 2,
      },
    ),
    Shirt(
      serverId: 's5',
      brandId: '#C005',
      name: 'WINDOW',
      imageUrls: ['web/images/shirts/shirt_4.png'],
      price: Price(1799.0),
      description: 'remera 100% algodón\nfit regular',
      stock: {
        ClothingSize.small: 2,
        ClothingSize.medium: 2,
        ClothingSize.large: 2,
      },
    ),
    Shirt(
      serverId: 's6',
      brandId: '#C006',
      name: 'BASIC TEE',
      imageUrls: ['web/images/shirts/shirt_5.png'],
      price: Price(1799.0),
      description: 'remera 100% algodón\nfit regular',
      stock: {
        ClothingSize.small: 2,
        ClothingSize.medium: 2,
        ClothingSize.large: 2,
      },
    ),
  ];

  List<Shirt> get values => [..._values];
}

import 'package:flutter/foundation.dart';

import '../utils/clothing_size.dart';
import 'shirt.dart';

class Shirts with ChangeNotifier {
  var _values = [
    Shirt(
      id: '#C001',
      name: 'CASINO',
      imageUrls: ['web/images/shirts/shirt_0.png'],
      price: 1799.0,
      description: 'remera 100% algodón\nfit regular',
      stock: {
        ClothingSize.small: 2,
        ClothingSize.medium: 2,
        ClothingSize.large: 2,
      },
    ),
    Shirt(
      id: '#C002',
      name: 'LA LUNA',
      imageUrls: ['web/images/shirts/shirt_1.png'],
      price: 1799.0,
      description: 'remera 100% algodón\nfit regular',
      stock: {
        ClothingSize.small: 2,
        ClothingSize.medium: 2,
        ClothingSize.large: 2,
      },
    ),
    Shirt(
      id: '#C003',
      name: 'RUNNER',
      imageUrls: ['web/images/shirts/shirt_2.png'],
      price: 1799.0,
      description: 'remera 100% algodón\nfit regular',
      stock: {
        ClothingSize.small: 2,
        ClothingSize.medium: 2,
        ClothingSize.large: 2,
      },
    ),
    Shirt(
      id: '#C004',
      name: 'THUNDER',
      imageUrls: ['web/images/shirts/shirt_3.png'],
      price: 1799.0,
      description: 'remera 100% algodón\nfit regular',
      stock: {
        ClothingSize.small: 2,
        ClothingSize.medium: 2,
        ClothingSize.large: 2,
      },
    ),
    Shirt(
      id: '#C005',
      name: 'WINDOW',
      imageUrls: ['web/images/shirts/shirt_4.png'],
      price: 1799.0,
      description: 'remera 100% algodón\nfit regular',
      stock: {
        ClothingSize.small: 2,
        ClothingSize.medium: 2,
        ClothingSize.large: 2,
      },
    ),
    Shirt(
      id: '#C006',
      name: 'BASIC TEE',
      imageUrls: ['web/images/shirts/shirt_5.png'],
      price: 1799.0,
      description: 'remera 100% algodón\nfit regular',
      stock: {
        ClothingSize.small: 2,
        ClothingSize.medium: 2,
        ClothingSize.large: 2,
      },
    ),
  ];

  List<Shirt> get values => [..._values];

  Shirt findById(String id) {
    return _values.firstWhere((value) => value.id == id);
  }

  Iterable<Shirt> allValuesButOne(String id) {
    return _values.where((value) => value.id != id);
  }
}

import 'package:flutter/foundation.dart';

import '../utils/clothing_size.dart';
import '../utils/price.dart';

class Shirt with ChangeNotifier {
  Shirt({
    @required this.id,
    @required this.name,
    @required this.imageUrls,
    @required this.price,
    @required this.description,
    @required this.stock,
  });

  final String id;
  final String name;
  final List<String> imageUrls;
  final Price price;
  final String description;
  final Map<ClothingSize, int> stock;
}

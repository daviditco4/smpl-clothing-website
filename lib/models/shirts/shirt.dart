import 'package:flutter/foundation.dart';

import '../utils/clothing_size.dart';
import '../utils/price.dart';

class Shirt with ChangeNotifier {
  Shirt({
    @required this.serverId,
    @required this.brandId,
    @required this.name,
    @required this.imageUrls,
    @required this.price,
    @required this.description,
    @required this.stock,
  });

  final String serverId;
  final String brandId;
  final String name;
  final List<String> imageUrls;
  final Price price;
  final String description;
  final Map<ClothingSize, int> stock;
}

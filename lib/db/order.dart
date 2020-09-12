import 'package:fashion_shop/db/cloth.dart';
import 'package:fashion_shop/db/shop.dart';

//import 'package:flutter_food_delivery_ui/models/restaurant.dart';

class Order {
  final Shop shop;
  final Cloth cloth;
  final String date;
  var quantity;

  Order({
    this.shop,
    this.cloth,
    this.date,
    this.quantity,
  });
}
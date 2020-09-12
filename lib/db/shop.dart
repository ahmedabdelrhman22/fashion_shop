//import 'package:flutter_food_delivery_ui/models/food.dart';


import 'package:fashion_shop/db/cloth.dart';

class Shop {
  final String imageUrl;
  final String name;
  final String address;
  final int rating;
  final List<Cloth> menu;

  Shop({
    this.imageUrl,
    this.name,
    this.address,
    this.rating,
    this.menu,
  });
}
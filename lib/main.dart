import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
//My_own_imports
import 'package:fashion_shop/components/horizontal_listview.dart';
import 'package:fashion_shop/components/Products.dart';
import 'package:fashion_shop/pages/cart.dart';
import 'package:fashion_shop/pages/login.dart';
import 'package:fashion_shop/pages/home.dart';

void main() => runApp(MyApp());
const PrimaryColor = const Color(0xFF151026);

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
//      title: 'Flutter NestedTabs Demo',
      theme: ThemeData(
        primaryColor: Color(0xffffffff),
        ),
      home: Login(),
      );
  }
}
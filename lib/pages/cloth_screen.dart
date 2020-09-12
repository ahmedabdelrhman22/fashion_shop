import 'package:fashion_shop/Widgets/rounded_button.dart';
import 'package:fashion_shop/Widgets/square_icon.dart';
import 'package:fashion_shop/Widgets/startRating.dart';
import 'package:fashion_shop/data/data.dart';
import 'package:fashion_shop/db/cloth.dart';
import 'package:fashion_shop/db/order.dart';
import 'package:fashion_shop/db/shop.dart';
import 'package:fashion_shop/pages/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
//import 'package:flutter_app/data/data.dart';
//import 'package:flutter_app/models/food.dart';
//import 'package:flutter_app/models/order.dart';
//import 'package:flutter_app/models/restaurant.dart';
//import 'package:flutter_app/widgets/rounded_button.dart';
//import 'package:flutter_app/widgets/square_icon_button.dart';
//import 'package:flutter_app/widgets/startRating.dart';
//import 'package:flutter_food_delivery_ui/data/data.dart';
//import 'package:flutter_food_delivery_ui/models/food.dart';
//import 'package:flutter_food_delivery_ui/models/order.dart';
//import 'package:flutter_food_delivery_ui/models/restaurant.dart';
//import 'package:flutter_food_delivery_ui/widgets/rounded_button.dart';
//import 'package:flutter_food_delivery_ui/widgets/square_icon_button.dart';
//import 'package:flutter_food_delivery_ui/widgets/startRating.dart';

class ClothScreen extends StatefulWidget {

  final Cloth cloth;

  ClothScreen({this.cloth});

  @override
  _ClothScreenState createState() => _ClothScreenState();
}

class _ClothScreenState extends State<ClothScreen> {
  Color favIcon = Colors.white;
  Color checkColor = Colors.amber;
  IconData checkedIcon = Icons.add;

//  displaySnackBar(BuildContext context, String food) {
//    final SnackBar sb = SnackBar(
//      content: Text("$food added successfully"),
//            backgroundColor: Colors.pink.withOpacity(0.7),
//      //      duration: Duration(seconds: 5),
//      );
//    Scaffold.of(context).showSnackBar(sb);
//  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      body: Builder(
          builder: (BuildContext context) {
            return Container(


              child: ListView(

                children: <Widget>[

                  Column(
                    children: <Widget>[
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                          color: Colors.pink,
                          ),
                        onPressed: () =>
                            Navigator.pop(
                                context
                                ),
                        ),

                    ],
                    ),
                      Hero(
                        tag: widget.cloth.imageUrl,
                        child: Image.asset(
                          widget.cloth.imageUrl,

                          fit: BoxFit.fill,
                          ),
                        ),
//                      Padding(
//                        padding: EdgeInsets.symmetric(
//                          vertical: 30,
//                          horizontal: 10,
//                          ),
//
//
//                IconButton(
//                  icon: Icon(
//                    Icons.favorite,
//                    size: 30,
//                    color: currentUser.favshop
//                        .contains(widget.cloth.name)
//                        ? Colors.red
//                        : favIcon,
//
//                    ),
//                  onPressed: () {
//                    setState(() {
//                      if (!currentUser.favshop.contains(
//                        widget.cloth.name,
//                        )) {
//                        currentUser.favshop
//                            .add(widget.cloth.name);
//                      }
//                    });
//                  },
//                  )
//
//                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        widget.cloth.name,
                        style: TextStyle(
                          color:Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          ),
                        ),
//                      Text(
//                        ,
//                        style: TextStyle(
//                          color: Theme.of(context).primaryColor,
//                          fontSize: 20,
//                          fontWeight: FontWeight.bold,
//                          letterSpacing: 1,
//                          ),
//                        ),
                    ],
                    ),
                    ],
                    ),
//        Padding(
//        padding: EdgeInsets.symmetric(
//        vertical: 5,
//        horizontal: 10,
//        ),
//        child: Column(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//        Padding(
//        padding: EdgeInsets.symmetric(
//        vertical: 8,
//        horizontal: 0,
//        ),
//        child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//        Text(
//        widget.cloth.name,
//        style: TextStyle(
//        color: Theme.of(context).primaryColor,
//        fontSize: 20,
//        fontWeight: FontWeight.bold,
//        letterSpacing: 1,
//        ),
//        ),
//        Text(
//        "about 200m away",
//        style: TextStyle(
//        color: Colors.black,
//        fontSize: 16,
//        ),
//        ),
//        ],
//        ),
//        ),
//        StartRating(
//        widget.restaurant.rating,
//        size: 18,
//        ),
//        SizedBox(
//        height: 8,
//        ),
//        Text(
//        widget.restaurant.address,
//        style: TextStyle(
//        fontSize: 18,
//        ),
//        ),
//
//        ],
//        ),
//        ),
//        Container(
//        margin: EdgeInsets.only(
//        bottom: 3,
//        ),
//        decoration: BoxDecoration(
//        border: Border(
//        bottom: BorderSide(
//        color: Theme.of(context).primaryColor,
//        width: 3,
//        ),
//        ),
//        ),
//        child: Text(
//        "Menu",
//        style: TextStyle(
//        fontSize: 20,
//        color: Colors.pink,
//        fontWeight: FontWeight.bold,
//        letterSpacing: 1,
//        ),
//        ),
//        ),
//        ...clothes.map( (restaurant) {
//
//        GestureDetector(
//        onTap: () {
//        Navigator.push(
//        context,
//        MaterialPageRoute(
//        builder: (_) => ShopScreen(
//        restaurant: restaurant,
//        ),
//        ),
//        );
//        },
//        child: Expanded(
//        child: GridView.count(
//        crossAxisCount: 2,
//        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//        scrollDirection: Axis.vertical,
//        physics: BouncingScrollPhysics(),
//        children:
//        List.generate(widget.restaurant.menu.length, (index) {
//        Cloth cloth = widget.restaurant.menu[index];
//        return Center(
//        child: Stack(
//        alignment: Alignment.center,
//        children: <Widget>[
//        Container(
//        height: 180,
//        width: 180,
//        decoration: BoxDecoration(
//        image: DecorationImage(
//        image: AssetImage(
//        cloth.imageUrl,
//        ),
//        fit: BoxFit.cover,
//        ),
//        borderRadius: BorderRadius.circular(15),
//        ),
//        ),
//        Container(
//        height: 180,
//        width: 180,
//        decoration: BoxDecoration(
//        borderRadius: BorderRadius.circular(15),
//        gradient: LinearGradient(
//        begin: Alignment.topRight,
//        end: Alignment.bottomLeft,
//        colors: [
//        Colors.black87.withOpacity(0.3),
//        Colors.black54.withOpacity(0.3),
//        Colors.black38.withOpacity(0.3),
//        Colors.black26.withOpacity(0.3),
//        ],
//        stops: [
//        0.1,
//        0.4,
//        0.6,
//        0.9,
//        ],
//        ),
//        ),
//        ),
//        Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//        Text(
//        cloth.name,
//        style: TextStyle(
//        fontSize: 25,
//        color: Colors.white,
//        fontWeight: FontWeight.bold,
//        ),
//        ),
//        Text(
//        '\$${cloth.price}',
//        style: TextStyle(
//        fontSize: 20,
//        color: Colors.white,
//        fontWeight: FontWeight.bold,
//        ),
//        ),
//        ],
//        ),
//        Positioned(
//        bottom: 3,
//        right: -10,
//        child: SquareIconButton(
//        icon: checkedIcon,
//        color: Colors.pink,
//        rounded: 50,
//        onPressed: () {
//        final sb = SnackBar(
//        content: Text(
//        "${cloth.name} added successfully",
//        style: TextStyle(
//        fontSize: 16,
//        fontWeight: FontWeight.bold,
//        color: Colors.pink,
//        ),
//        textAlign: TextAlign.center,
//        ),
//        duration: Duration(milliseconds: 500),
//        backgroundColor: Theme.of(context)
//            .primaryColor
//            .withOpacity(0.9),
//        );
//        Scaffold.of(context).showSnackBar(sb);
//        setState(() {
//        currentUser.cart.add(
//        Order(
//        date: "12-12-2020",
//        quantity: 1,
//        shop: Shop(
//        name: '${widget.restaurant.name}',
//        ),
//        cloth: Cloth(
//        name:
//        '${widget.restaurant.menu[index].name}',
//        price: widget
//            .restaurant.menu[index].price,
//        imageUrl:
//        '${widget.restaurant.menu[index].imageUrl}',
//        ),
//        ),
//        );
//        });
//
////                                print('${widget.restaurant.menu[index].name}');
////                                print('${widget.restaurant.menu[index].price}');
////                                print('${widget.restaurant.menu[index].imageUrl}');
////                                print('${widget.restaurant.name}');
//        },
//        )),
//        ],
//        ),
//        );
//        }),
//        ),
//        ),
//        );
//        },),
//        ],
//        ),
                ],
                ),
              );
          }
          ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.shopping_cart,
          color: Colors.white,
          size: 30,
          ),
        onPressed: () =>
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    Cart(
                    ),
                ),
              ),
        ),
      );
  }
}
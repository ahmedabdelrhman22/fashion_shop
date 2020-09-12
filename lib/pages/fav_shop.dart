import 'package:fashion_shop/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_food_delivery_ui/data/data.dart';

class FavRestaurat extends StatefulWidget {
  @override
  _FavRestauratState createState() => _FavRestauratState();
}

class _FavRestauratState extends State<FavRestaurat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Restaurants"),
        centerTitle: true,
        ),
      body: ListView.builder(
        itemCount: currentUser.favshop.length,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(20),
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            secondaryBackground: Container(
              color: Colors.red,
              child: Center(
                child: Text(
                  "Delete from favourite",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    ),
                  ),
                ),
              ),
            background: Container(),
            child: Card(
              child: Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  currentUser.favshop[index].toString(),
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            onDismissed: (context) {
              setState(() {
                currentUser.favshop.removeAt(index);
              });
            },
            );
        },
        ),
      );
  }
}

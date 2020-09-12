import 'package:fashion_shop/Widgets/square_icon.dart';
import 'package:fashion_shop/data/data.dart';
import 'package:fashion_shop/db/order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

//import 'package:flutter_food_delivery_ui/data/data.dart';
//import 'package:flutter_food_delivery_ui/models/order.dart';
//import 'package:flutter_food_delivery_ui/widgets/square_icon_button.dart';

class RecentOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10, top: 0, bottom: 10),
          child: Text(
            "Recent Orders",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Theme.of(context).primaryColor,
                letterSpacing: 1.2),
            ),
          ),
        Container(
          height: 90,
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: currentUser.orders.length,
              itemBuilder: (BuildContext context, index) {
                Order order = currentUser.orders[index];
                return Container(
                  width: 320,
                  margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          )
                      ],
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            ClipRRect(
                              child: Image(
                                image: AssetImage("${order.cloth.imageUrl}"),
                                width: 90,
                                height: 90,
                                fit: BoxFit.cover,
                                ),
                              borderRadius: BorderRadius.circular(15),
                              ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      order.cloth.name,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold,
                                        ),
                                      overflow: TextOverflow.ellipsis,
                                      ),
                                    Text(
                                      order.shop.name,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    Text(
                                      order.date,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                  ],
                                  ),
                                ),
                              ),
                          ],
                          ),
                        ),
                      SquareIconButton(
                        icon: Icons.add,
                        onPressed: () {},
                        color: Theme.of(context).accentColor,
                        ),
                    ],
                    ),
                  );
              }),
          )
      ],
      );
  }
}

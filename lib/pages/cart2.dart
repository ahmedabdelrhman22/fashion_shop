import 'package:fashion_shop/data/data.dart';
import 'package:fashion_shop/db/cloth.dart';
import 'package:fashion_shop/db/order.dart';
import 'package:fashion_shop/db/shop.dart';
import 'package:fashion_shop/pages/cloth_screen.dart';
import 'package:fashion_shop/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Cart2 extends StatefulWidget {
  @override
  final Shop re;
  Cart2({this.re});



  _Cart2State createState() => _Cart2State();
}

class _Cart2State extends State<Cart2> {




  @override

  Widget build(BuildContext context) {

    double totalPrice = 0;

    currentUser.cart.forEach((Order order) {
      totalPrice += order.quantity * order.cloth.price;
      if (order.quantity <= 0) {
        setState(() {
          order.quantity = 0;
        });
      }
    });

    return Scaffold(

      appBar: AppBar(
title: Row(
  mainAxisAlignment:MainAxisAlignment.end,
  children: <Widget>[
    IconButton(
      icon: Icon(
        Icons.home,
        size: 40,
        color: Colors.pink,
        ),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => HomePage(0xffe91e63),
          ),
        ),
      ),

  ],
),
        ),



      body: currentUser.cart.length != 0
          ? Builder(
        builder: (BuildContext context) {
          return Container(

            padding: EdgeInsets.only(bottom: 120),

            child: ListView.separated(
              itemCount: currentUser.cart.length,
              itemBuilder: (context, index) {
                return Container(


                  height: 150,
                  margin: EdgeInsets.all(12),
                  child: Dismissible(
                    key: UniqueKey(),
                    secondaryBackground: Container(
                      margin: EdgeInsets.all(5),
                      child: Center(
                        child: Text(
                          'Delete This item',
                          style: TextStyle(color: Colors.white),
                          ),
                        ),
                      color: Colors.red,
                      ),
                    onDismissed: (DismissDirection direction) {
                      setState(() {
                        currentUser.cart.removeAt(index);
                      });
                    },
                    background: Container(),
                    direction: DismissDirection.endToStart,

                    child:GestureDetector(


                      onTap: () {
                        Cloth cloth1 = widget.re.menu[index];

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ClothScreen(
                              cloth:cloth1  ,
                              ),
                            ),
                          );
                      },

                      child:Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        currentUser
                                            .cart[index].cloth.imageUrl,
                                        ),
                                      ),
                                    ),
                                  ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      currentUser.cart[index].cloth.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        ),
                                      ),
                                    SizedBox(height: 5),
                                    Text(
                                      currentUser
                                          .cart[index].shop.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        ),
                                      ),
                                    Container(
                                      width: 90,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 0,
                                        vertical: 5,
                                        ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color:Colors.blue,
                                          ),
                                        ),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                currentUser.cart[index]
                                                    .quantity -= 1;
                                              });
                                            },
                                            child: Container(
                                              height: 25,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                color:Colors.blue,

                                                ),
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          Text(
                                            '${currentUser.cart[index].quantity}',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                currentUser.cart[index]
                                                    .quantity += 1;
                                              });
                                            },
                                            child: Container(
                                              height: 25,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                color:Colors.blue,

                                                ),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                ),
                                              ),
                                            ),
                                        ],
                                        ),
                                      ),
                                    currentUser.cart[index].quantity <= 0
                                        ? GestureDetector(
                                      child: Text(
                                        "Remove this item?",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.red,
                                          ),
                                        ),
                                      onTap: () {
                                        setState(() {
                                          currentUser.cart
                                              .removeAt(index);
                                        });
                                      },
                                      )
                                        : Container(),
                                  ],
                                  ),
                              ],
                              ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.close,
                                      color: Colors.red,
                                      ),
                                    onPressed: () {
                                      setState(() {
                                        currentUser.cart.removeAt(index);
                                      });
                                    },
                                    ),
                                  ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    '\$${(currentUser.cart[index].cloth.price * currentUser.cart[index].quantity).toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      ),
                                    ),
                                  ),
                                Container(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.close,
                                      color: Colors.white.withOpacity(1),
                                      ),
                                    onPressed: null,
                                    ),
                                  ),
                              ],
                              ),
                          ],
                          ),
                        ),
                      ),
                    ),
                  );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Theme.of(context).primaryColor,
                  height: 0.5,
                  thickness: 2,
                  indent: 40,
                  endIndent: 40,
                  );
              },
              physics: BouncingScrollPhysics(),
              ),
            );
        },
        )
          : Center(
        child: Image.network(
          "https://www.westtorrens.sa.gov.au/WTORWebFile/cwtWebsite/img/loading.gif",
          height: 350,
          ),
        ),
      bottomSheet: currentUser.cart.length != 0
          ? Container(
        height: 120,
        padding: EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20,
          bottom: 0,
          ),
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                  color: Colors.pink,
                  width: 1,
                  ))),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Delivery Time: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    ),
                  ),
                Text(
                  "25 min",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    ),
                  )
              ],
              ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Total Price",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    ),
                  ),
                Text(
                  '\$${totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.green,
                    ),
                  )
              ],
              ),
            SizedBox(height: 5),
            GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                  ),
                decoration: BoxDecoration(
                  color: Colors.pink,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Colors.grey,
                      ),
                  ],
                  ),
                child: Text(
                  "Check Out",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
          ),
        )
          : GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          height: 50,
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 10,
            ),
          decoration: BoxDecoration(
            color: Colors.pink,
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Colors.grey,
                ),
            ],
            ),
          child: Text(
            "Empty Cart",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              ),
            ),
          ),
        ),
      );
  }
}





































































































// **********************santos imagine*************************************
//import 'package:flutter/material.dart';
////My imports
//import 'package:fashion_shop/components/cart_products.dart';
//class Cart extends StatefulWidget {
//  @override
//  _CartState createState() => _CartState();
//}
//
//class _CartState extends State<Cart> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar:AppBar(
//        elevation: 0.0,
//        backgroundColor: Colors.pink,
//        title:Text('Cart'),
//        centerTitle: true,
//        actions: <Widget>[
//          new IconButton(icon :Icon(Icons.search,color: Colors.white,),onPressed: (){},),
//
//
//        ],
//
//      ),
//      body: new Cart_products(),
//      bottomNavigationBar: new Container(
//        color: Colors.white,
//        child: Row(
//          children: <Widget>[
//           Expanded(child: ListTile(
//             title: new Text("Total:"),
//             subtitle: new Text("\$230"),
//           ),
//           ),
//           Expanded(child: MaterialButton(onPressed: (){},
//           child: new Text("Check out",style: TextStyle(color:Colors.white),),
//           color:Colors.pink ,
//
//           ),
//           ),
//          ],
//        ),
//
//      ) ,
//    );
//  }
//}

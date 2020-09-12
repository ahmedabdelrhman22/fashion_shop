import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_On_The_Cart=[
  {
    "name":'Blazer',
    "picture":'images/products/blazer1.jpeg',
    "price": 85,
    "size":'M',
    "color":'black',
    "quantity": 1,
  },
  {
    "name":'Blazer',
    "picture":'images/products/blazer1.jpeg',
    "price": 85,
    "size":'M',
    "color":'black',
    "quantity": 1,
  },
  {
    "name":'Dress',
    "picture":'images/products/dress1.jpeg',
    "price": 50,
    'size':'M',
    "color":'Red',
    "quantity" : 1,
  },
];
  @override
  Widget build (BuildContext context) {
    return new ListView.builder(

    itemCount: Products_On_The_Cart.length,
      itemBuilder: (context,index){
        return Single_cart_product(
            cart_prod_picture:Products_On_The_Cart[index]["picture"],

            cart_prod_name:Products_On_The_Cart[index]["name"],
            cart_prod_size:Products_On_The_Cart[index]["size"],
            cart_prod_color:Products_On_The_Cart[index]["color"],

            cart_prod_price:Products_On_The_Cart[index]["price"],
         cart_prod_qty:Products_On_The_Cart[index]["quantity"]
        );
      }
    );


  }
}
class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  const Single_cart_product({ this.cart_prod_name, this.cart_prod_picture, this.cart_prod_price, this.cart_prod_size, this.cart_prod_color, this.cart_prod_qty}) ;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(

    //    Leading section for picture
        leading: Image.asset(cart_prod_picture,height: 80.0,width: 80.0,),
        //title section
        title: new Text(cart_prod_name),
        // subtitle section
        subtitle: Column(
          children: <Widget>[
            //row inside the column
            Row(
              children: <Widget>[
//  This section for product size

                Padding(
              padding: const EdgeInsets.all(0.0),
              child: new Text('Size:'),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: new Text(cart_prod_size,style: TextStyle(color: Colors.pink),),
            ),
//  This section for product color
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0,8.0,8.0,8.0),
              child: new Text('Color:'),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: new Text(cart_prod_color,style: TextStyle(color: Colors.pink),
            ),
            ),


              ],
            ),
//  This section for product price
          new Container(
            alignment: Alignment.topLeft,
            child: new Text("\$${cart_prod_price}",style: TextStyle(color: Colors.pink,fontSize: 17.0,fontWeight: FontWeight.bold),),

          ),

          ],
        ),

        trailing: new Column(

              mainAxisAlignment: MainAxisAlignment.start,
//            mainAxisSize: MainAxisSize.max,

            children: <Widget>[

              new IconButton(icon: Icon(Icons.arrow_drop_up,),onPressed: (){}),
//             new Text("$cart_prod_qty",style: TextStyle(fontSize: 10.0),),
//             new IconButton(icon: Icon(Icons.arrow_drop_down,size: 10.0, ),onPressed: (){}),



            ],
          ),

      ),
    );
  }

}













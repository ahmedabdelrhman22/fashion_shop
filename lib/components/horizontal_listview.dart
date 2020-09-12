import 'package:flutter/material.dart';
class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
     height: 100.0,
      child: ListView(
       scrollDirection: Axis.horizontal,
        children: <Widget>[
         Category(
           image_loction: 'images/cats/tshirt.png',
           image_caption: 'T-shirt',
         ),
         Category(
           image_loction: 'images/cats/dress.png',
           image_caption: 'Dress',
         ),
         Category(
           image_loction: 'images/cats/formal.png',
           image_caption: 'Formal',
         ),
         Category(
           image_loction: 'images/cats/informal.png',
           image_caption: 'Informal',
         ),
         Category(
           image_loction: 'images/cats/shoe.png',
           image_caption: 'Shoe',
         ),
         Category(
           image_loction: 'images/cats/jeans.png',
           image_caption: 'Jeans',
         ),
         Category(
           image_loction: 'images/cats/accessories.png',
           image_caption: 'Accessory',
         ),

        ],
      ),
    );
  }
}
class Category extends StatelessWidget {
  final String image_loction;
  final String image_caption;

   Category({ this.image_loction, this.image_caption}) ;

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: (){},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(image_loction,
              width: 100.0,
              height: 60.0,
            ),

            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(image_caption,style:new TextStyle(fontSize: 12.0),),
            ),
          ),
        ),

      ),

    );
  }
}


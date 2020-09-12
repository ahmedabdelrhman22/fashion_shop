import 'package:flutter/material.dart';
import 'package:fashion_shop/pages/product_details.dart';
class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var Product_List =[
    {
      'name':'Blazer',
     'picture':'images/products/blazer1.jpeg',
     'old_price':'120',
     'price':'85',

},
    {
      'name':'Red dress',
      'picture':'images/products/dress1.jpeg',
      'old_price':'100',
      'price':'50',

    },

    {
      'name':'Red dress',
      'picture':'images/products/hills1.jpeg',
      'old_price':'100',
      'price':'50',

    },

    {
      'name':'Red dress',
      'picture':'images/products/skt1.jpeg',
      'old_price':'100',
      'price':'50',

    },
    {
      'name':'Red dress',
      'picture':'images/products/skt2.jpeg',
      'old_price':'100',
      'price':'50',

    },
    {
      'name':'Red dress',
      'picture':'images/products/dress2.jpeg',
      'old_price':'100',
      'price':'50',

    },

  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount:Product_List.length ,

        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context,int index){
        return Single_prod(
            prod_name:Product_List[index]['name'],
          prod_picture:Product_List[index]['picture'],
          prod_old_price:Product_List[index]['old_price'],
          prod_price:Product_List[index]['price'],

        );

    }

    );
  }
}



class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

   Single_prod({ this.prod_name, this.prod_picture, this.prod_old_price, this.prod_price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero( 
        tag:Text('Hero 1'),
        child:Material(
      child:InkWell(onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new ProductDetails(
        //here we are passing the value of the product to product details page
          prod_details_name:prod_name,
          prod_detail_picture:prod_picture,
          prod_detail_old_price:prod_old_price,
          prod_detail_price:prod_price,

      ))),
      child: GridTile(

          footer:Container(
            color: Colors.white70,
            child:  new Row(
              children: <Widget>[
                Expanded(child:
                Text(prod_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),

                ),
                new Text("\$${prod_price}",style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold),),


              ],

            ),






          ) ,
         child:Image.asset(prod_picture,
         fit: BoxFit.cover,) ,

      ),
      ),
      ) ,
      ),
      
    );
  }
}

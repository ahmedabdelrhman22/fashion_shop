import 'package:flutter/material.dart';
import 'package:fashion_shop/main.dart';
import 'package:fashion_shop/pages/home.dart';
class ProductDetails extends StatefulWidget {
  final prod_details_name;
  final prod_detail_picture;
  final prod_detail_old_price;
  final prod_detail_price;

  const ProductDetails({ this.prod_details_name, this.prod_detail_picture, this.prod_detail_old_price, this.prod_detail_price}) ;



  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
      elevation: 0.0,
      backgroundColor: Colors.pink,
      title:InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage(0xffe91e63)));
          },
          child: Text('Fashapp')),
      centerTitle: true,
      actions: <Widget>[
        new IconButton(icon :Icon(Icons.search,color: Colors.white,),onPressed: (){},),



      ],

    ),
      body: ListView(
        children: <Widget>[

          new Container(
           height: 300.0,
            child: GridTile(child: Container(
              color: Colors.white70,
              child: Image.asset(widget.prod_detail_picture),
            ),

              footer: new Container(

                child: ListTile(
                  leading:new Text(widget.prod_details_name,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0)) ,
                    title:new Row(

                      children: <Widget>[
                        Expanded(
                          child: new Text("\$${widget.prod_detail_old_price}",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w800,decoration:TextDecoration.lineThrough),) ,
                        ),
                        Expanded(
                          child: new Text("\$${widget.prod_detail_price}",style: TextStyle(color: Colors.pink,fontWeight: FontWeight.w800)) ,
                        ),

                      ],

                    ),

                  ),

                ),
              ),

            ),
          // First Buttons
             Row(

               children: <Widget>[

                 // the size button
                 Expanded(child: MaterialButton(
                   onPressed: (){
                   showDialog(context: context,
                   builder: (context){
                   return new AlertDialog(
                     title: new Text('Size'),
                     content: new Text('Choose the size'),
                     actions: <Widget>[
                       new MaterialButton(onPressed: (){
                         Navigator.of(context).pop(context);
                       },
                         child: new Text('Close'),
                       )

                     ],
                   );
                   }
                   );
                 },
                 color: Colors.white,
                   textColor: Colors.grey,
                   elevation: 0.2,

                   child: Row(
                     children: <Widget>[
                       Expanded(
                          child: new Text('Size'),
                       ),
                       Expanded(
                         child: new Icon(Icons.arrow_drop_down ),
                       ),
                     ],
                   ),
                 ),
                 ),
                 Expanded(child: MaterialButton(onPressed: (){
                   showDialog(context: context,
                       builder: (context){
                         return new AlertDialog(
                           title: new Text('Color'),
                           content: new Text('Choose the color'),
                           actions: <Widget>[
                             new MaterialButton(onPressed: (){
                               Navigator.of(context).pop(context);
                             },
                               child: new Text('Close'),
                             )

                           ],
                         );
                       }
                   );
                 },
                   color: Colors.white,
                   textColor: Colors.grey,
                   elevation: 0.2,

                   child: Row(
                     children: <Widget>[
                       Expanded(
                         child: new Text('Color'),
                       ),
                       Expanded(
                         child: new Icon(Icons.arrow_drop_down ),
                       ),
                     ],
                   ),
                 ),
                 ),
                 Expanded(child: MaterialButton(onPressed: (){
                   showDialog(context: context,
                       builder: (context){
                         return new AlertDialog(
                           title: new Text('Quantity'),
                           content: new Text('Choose the quantity'),
                           actions: <Widget>[
                             new MaterialButton(onPressed: (){
                               Navigator.of(context).pop(context);
                             },
                               child: new Text('Close'),
                             )

                           ],
                         );
                       }
                   );
                 },
                   color: Colors.white,
                   textColor: Colors.grey,
                   elevation: 0.2,

                   child: Row(
                     children: <Widget>[
                       Expanded(
                         child: new Text('Qty'),
                       ),
                       Expanded(
                         child: new Icon(Icons.arrow_drop_down ),
                       ),
                     ],
                   ),
                 ),
                 ),
               ],
             ),
          Row(

            children: <Widget>[

              // the second buttons
              Expanded(child: MaterialButton(onPressed: (){},
                color: Colors.pink,
                textColor: Colors.white,
                elevation: 0.2,

                child:new Text('Buy Now'),
              ),
              ),
               new IconButton(icon:Icon(Icons.add_shopping_cart,color: Colors.pink,),onPressed: (){},),
              new IconButton(icon:Icon(Icons.favorite_border,color: Colors.pink),onPressed: (){},),

            ],
          ),
          Divider(),
          new ListTile(
            title:new Text('Product Details'),
            subtitle: new Text('The traffic problem is closely related to human life'),


          ),
         Divider(),
          Row(
            children: <Widget>[
             Padding(padding: const EdgeInsets.fromLTRB(12.0,5.0,5.0,5.0),
            child: Text('Product name',style: TextStyle(color: Colors.grey),),
             ),
             Padding(padding: const EdgeInsets.all(5.0),
               child: Text(widget.prod_details_name,),
             ),

            ],
          ),
          Row(
            children: <Widget>[
              // to create the product brand
              Padding(padding: const EdgeInsets.fromLTRB(12.0,5.0,5.0,5.0),
                child: Text('Product brand',style: TextStyle(color: Colors.grey),),
              ),
              Padding(padding: const EdgeInsets.all(5.0),
                child: Text('Brand X',),
              ),

            ],
          ),
         Divider(),
          Row(
            children: <Widget>[
              //the product condition
              Padding(padding: const EdgeInsets.fromLTRB(12.0,5.0,5.0,5.0),
                child: Text('Product condition',style: TextStyle(color: Colors.grey),),
              ),
              Padding(padding: const EdgeInsets.all(5.0),
                child: Text('New',),
              ),
              Padding(padding: const EdgeInsets.all(5.0),
                child:Text('Similar Products'),
              ),


            ],
          ),
          // Simial products section
          new Container(
            height: 320.0,
            child: Similar_products(),
          ),
        ],
      ),
    );
  }
}
 class Similar_products extends StatefulWidget {
   @override
   _Similar_productsState createState() => _Similar_productsState();
 }
 
 class _Similar_productsState extends State<Similar_products> {
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
           return Similar_Single_prod(
             prod_name:Product_List[index]['name'],
             prod_picture:Product_List[index]['picture'],
             prod_old_price:Product_List[index]['old_price'],
             prod_price:Product_List[index]['price'],

           );

         }

     );
   }
 }
class Similar_Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Similar_Single_prod({ this.prod_name, this.prod_picture, this.prod_old_price, this.prod_price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag:Text("Hero 2"),
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
                    Expanded( child:
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

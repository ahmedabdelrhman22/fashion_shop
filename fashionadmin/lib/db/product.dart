import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:convert/convert.dart';

class ProductService {
  Firestore _firestore = Firestore.instance;
  String ref = 'products';

  Future uploadProduct ({String ProductName,String brand, String category,int quantity ,List sizes,List images,double price}) {
    var id = new Uuid();
    String productId = id.v1();
    _firestore.collection('products').document(productId).setData(
{

  'name':ProductName,
  'brand':brand,
  'category':category,
  'id':productId,
  'quantity':quantity,
  'sizes':sizes,
  'images':images,



}



    );
  }



}
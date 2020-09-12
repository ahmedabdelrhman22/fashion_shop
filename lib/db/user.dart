import 'package:fashion_shop/db/cloth.dart';
import 'package:fashion_shop/db/order.dart';

class User {

  final String uid;
  User({this.uid});

}
class UserData{
  final String uid;
  final String name;
  final String email;
  final String password;
  final String gender;
  final List<Order> orders;
  final List<Order> cart;
  String phone;
  String img;
  List favshop;


  UserData({    this.orders,
    this.cart,
    this.phone,
    this.img,
    this.favshop,this.uid, this.name, this.email,this.password, this.gender});




}

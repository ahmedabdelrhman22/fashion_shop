import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
class UserServices{
  Firestore _database = Firestore.instance;
  String collection = "users";

  createUser(Map data){
    _database.collection(collection).document(data["userID"]).setData(data);

  }
}
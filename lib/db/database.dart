import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_shop/db//user.dart';
import 'package:firebase_auth/firebase_auth.dart';
class DatabaseServices{
  final String uid;
  DatabaseServices({this.uid});
  //collection reference
  final CollectionReference brewCollection=Firestore.instance.collection('Users');
  Future updateUserDate(String id,String name,String email,String password,String gender ) async
  {
    return await brewCollection.document(uid).setData({
      'uid':id,
      'name': name,
      'email':email,
      'password': password,
      'gender':gender,

    });
  }
//brew list from a snapshot


//useData from snapshot

//get brews stream

// get user doc stream


  //***************Sign In *********************************

  Future SignInWithEmailAndPassword (String email,String password) async
  {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    try{
      AuthResult result =await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user =result.user;
      return userFromFirebaseUser(user);

    }
    catch(e){
      print(e.toString());
      return null;
    }

  }
  User userFromFirebaseUser (FirebaseUser user){
    return user != null ?User (uid:user.uid) : null;
  }

}
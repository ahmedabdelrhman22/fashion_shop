import 'package:fashion_shop/db/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseAuth{
  Future <FirebaseUser>googleSignIn();



}
class Auth implements BaseAuth{
  FirebaseAuth _firebaseAuth=FirebaseAuth.instance;

  @override
  Future<FirebaseUser> googleSignIn() async {
    final GoogleSignIn _googleSignIn=GoogleSignIn();
    final GoogleSignInAccount _googleSignInAcount=await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth=await _googleSignInAcount.authentication;
    final AuthCredential credential =GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    try{
      FirebaseUser user=(await _firebaseAuth.signInWithCredential(credential)) as FirebaseUser;
      return user;

    }catch(e){
      print(e.toString());
      return null;

    }
  }



}
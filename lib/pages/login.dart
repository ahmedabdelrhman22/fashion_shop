import 'package:fashion_shop/db/database.dart';
import 'package:fashion_shop/db/users.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_shop/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fashion_shop/pages/signup.dart';
import 'package:fashion_shop/db/auth.dart';
import 'package:fashion_shop/commons/common.dart';


class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formkey=GlobalKey<FormState>();
  TextEditingController _emailTextController=TextEditingController();
  TextEditingController _passwordemailTextController=TextEditingController();

  SharedPreferences preferences;
  bool loading = false;
  bool islogedin = false;
  bool hidePassword=true;
  Auth auth= Auth();
  DatabaseServices  _userServices=DatabaseServices();
  String Error='';
  int color=0xffe91e63;



  @override
  void initState () {
    super.initState();
    isSignedIn();
  }

  void isSignedIn () async {
    setState(() {
      loading = true;
    });
    await firebaseAuth.currentUser().then((user)  {
      if(user!=null)
        {
           setState(() {
             islogedin=true;
           });

        }

    });

    preferences = await SharedPreferences.getInstance();
    islogedin = await googleSignIn.isSignedIn();
    if (islogedin == true) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage(0xffe91e63)));
    }
    setState(() {
      loading = false;
    });
  }
  /*
  Future handleSignIn () async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });

    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleUser
        .authentication;
    FirebaseUser firebaseUser = await firebaseAuth.signInWithGoogle(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    if (firebaseUser != null) {
      final QuerySnapshot result = await Firestore.instance.collection("users")
          .where("id", isEqualTo: firebaseUser.uid)
          .getDocuments();
      final List<DocumentSnapshot> documents = result.documents;
      if (documents.length == 0) {
        //     insert the user to our collection
        Firestore.instance.collection("users")
            .document(firebaseUser.uid)
            .setData({
          "id": firebaseUser.uid,
          "usename": firebaseUser.displayName,
          "profilePicture": firebaseUser.photoUrl,

        });
        await preferences.setString("id", firebaseUser.uid);
        await preferences.setString("usename", firebaseUser.displayName);
        await preferences.setString("profilePicture", firebaseUser.photoUrl);
      }
      else {
        await preferences.setString("id", documents[0]['id']);
        await preferences.setString("usename", documents[0]['usename']);
        await preferences.setString(
            "profilePicture", documents[0]['profilePicture']);
      }
//      Fluttertoast.showToast(msg: "Login was successeflly");
      setState(() {
        loading = false;
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
//    else {
//    Fluttertoast.showToast(msg:"Login failed");
//    }
  }


*/
  Future<FirebaseUser> signInWithGoogle() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult =
    await firebaseAuth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    final FirebaseUser currentUser = await firebaseAuth.currentUser();
    if (currentUser != null) {
      final QuerySnapshot result = await Firestore.instance
          .collection('users')
          .where("id", isEqualTo: currentUser.uid)
          .getDocuments();
      final List<DocumentSnapshot> document = result.documents;
      if (document.length == 0) {
        Firestore.instance
            .collection('users')
            .document(currentUser.uid)
            .setData({
          'id': currentUser.uid,
          'username': currentUser.displayName,
          'profilePicture': currentUser.photoUrl
        });
        await preferences.setString("id", currentUser.uid);
        await preferences.setString("usename", currentUser.displayName);
        await preferences.setString("profilePicture", currentUser.photoUrl);
      } else {
        await preferences.setString("id", document[0]['id']);
        await preferences.setString("usename", document[0]['usename']);
        await preferences.setString(
            "profilePicture", document[0]['profilePicture']);

      }
      setState(() {
        loading = false;
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage(0xffe91e63)));
    }
    else{
      print("Login failde");
      setState(() {
        loading = false;
      });
    }
    return user;
  }






























@override
    Widget build (BuildContext context) {
      return Scaffold(

        body:Stack(
          children: <Widget>[
            Image.asset('images/tthh.jpg',fit: BoxFit.cover,width: double.infinity,height: double.maxFinite,),
              //insert logo here
//            Container(
//              alignment: Alignment.topCenter,
//              child:Center(
//                child: Image.asset('lolo.jpg',width: 280.0,height: 240.0,),
//
//
//              ),
//            ),
            Container(
              color: Colors.black.withOpacity(0.4),
              width: double.infinity,
              height: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.only(top:150.0),
              child: Container(
                alignment: Alignment.center,
                child: Center(
                  child:Form(
                    key: _formkey ,
                    child:
                  ListView(
                    children:<Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14.0,8.0,14.0,8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.8),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left:12.0),
                            child: ListTile(
                              title: TextFormField(
                                controller: _emailTextController,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  icon: Icon(Icons.mail),
                                  border: InputBorder.none,




                                ),
                                validator: (value){
                                  if(value.isEmpty)
                                  {

                                    Pattern pattern= r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'; ;
                                    RegExp regex=RegExp(pattern);
                                    if(regex.hasMatch(value))
                                    {
                                      return 'Please make sure your email address is valid';
                                    }
                                    else
                                    {
                                      return null;
                                    }



                                  }
                                },
//                      keyboardType: TextInputType.emailAddress,
//                      controller: _emailTextController,

                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14.0,8.0,14.0,8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.8),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left:12.0),
                            child: ListTile(
                              title: TextFormField(
                                controller: _passwordemailTextController,
                                obscureText: hidePassword,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  icon: Icon(Icons.lock_outline),
                                  border: InputBorder.none,




                                ),
                               validator: (value){
                                   if(value.isEmpty)
                                    {
                                     return"The password field can not be empty";

                                    }
                                    else if(value.length<6)
                                      {

                                    return"The password has to be at least 6 characters long ";
                                      }
                                      return null;
                               }

//                      keyboardType: TextInputType.emailAddress,
//                      controller: _emailTextController,

                              ),

                               trailing: IconButton( icon: Icon(Icons.remove_red_eye),onPressed: () {
                                 setState(() {
                                   hidePassword = false;
                                 });
                               }
                                 ),



                            ),

                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14.0,8.0,14.0,8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.pink.shade900.withOpacity(0.8),
                          elevation: 0.0,
                          child: MaterialButton( onPressed: () async {
                            if(_formkey.currentState.validate())
                            {
                              setState(() =>loading = true);
                              dynamic result = await _userServices.SignInWithEmailAndPassword(_emailTextController.text,_passwordemailTextController.text);
                              if(result == null)
                              {

                                setState(() => Error = 'could not sign in with those credential' );
                                loading=false;


                              }
                              else {
                                Navigator.pushReplacement(
                                    context, MaterialPageRoute(
                                    builder: (context) => HomePage(0xffe91e63)));
                              }
                            }
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(
                                builder: (context) => HomePage(0xffe91e63)));


                          },minWidth:MediaQuery.of(context).size.width ,
                          child: Text("Login",textAlign: TextAlign.center,style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold
                          ,fontSize: 20.0) ,
                          ),
                          ),


                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14.0,8.0,14.0,8.0),
                        child: Text("Forget password",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
// ********************* Lgin using google account by botton*********************
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14.0,8.0,14.0,8.0),
                      child:InkWell(onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
                      },
                        child: Text("Sign up",style:TextStyle(color: Colors.pink),textAlign: TextAlign.center,
                        ),
                      ),
                      ),
                      Divider(color: Colors.white,),
                      Text("Other login option", textAlign: TextAlign.center,style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold
                          ,fontSize: 20.0)),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14.0,8.0,14.0,8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.pink.withOpacity(0.8),
                          elevation: 0.0,
                          child: MaterialButton(onPressed: (){
                            signInWithGoogle();
                          },minWidth:MediaQuery.of(context).size.width ,
                            child: Text("Login in with google account",textAlign: TextAlign.center,style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold
                                ,fontSize: 20.0) ,
                            ),
                          ),


                        ),
                      ),
//                      Row(children: <Widget>[
//                        Row(
//
//                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                          children: <Widget>[
//                            Padding(
//                              padding:
//                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
//                              child: Material(
//                                  child: MaterialButton(
//                                      onPressed: () {},
//                                      child: Image.asset("images/fb.jpg", width: 60,)
//                                  )),
//                            ),
//
//                            Padding(
//                              padding:
//                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
//                              child: Material(
//                                  child: MaterialButton(
//                                      onPressed: () async{
//                                       FirebaseUser user =await auth.googleSignIn();
//                                       if(user == null)
//                                         {
//                                           _userServices.createUser(
//                                               {
//                                                 'name': user.displayName,
//                                                 'photo':user.photoUrl,
//                                                 'email':user.email,
//                                                 'userId':user.uid,
//
//                                               }
//                                           );
//                                           changescreenReplacement(context, HomePage());
//                                         }
//                                      },
//                                      child: Image.asset("images/ggg.jpg", width: 60,)
//                                  )),
//                            ),
//                          ],
//                        ),
//                      ],
//                      ),

                  ],
                  ),
                  ) ,
                ),
              ),
            ),

            Visibility(
              visible: loading??true,
              child: Center(
                child: Container(
                  alignment: Alignment.center,
                  color:  Colors.white.withOpacity(0.9),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                ),
              ),
            ),
            
          ],
        ),


      );
    }


  }




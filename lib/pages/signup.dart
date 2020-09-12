import 'package:fashion_shop/db/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_shop/pages/home.dart';
import 'package:fashion_shop/db/database.dart';
import 'package:fashion_shop/db/user.dart';
import 'dart:async';



import 'package:fashion_shop/pages/login.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();


}

class _SignupState extends State<Signup> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordemailTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();

  TextEditingController _confirmPasswordController = TextEditingController();
  String gender;
   String err;
  String groupValue = 'male';
  bool hidePassword = true;

  bool loading = false;

  Widget build (BuildContext context) {
    return Scaffold(

      body: Stack(
        children: <Widget>[
          Image.asset('images/tthh.jpg', fit: BoxFit.cover,
            width: double.infinity,
            height: double.maxFinite,),
          //insert logo here

          Container(
            color: Colors.black.withOpacity(0.4),
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Container(
              child: Center(
                child: Form(
                  key: _formkey,
                  child:
                  ListView(
                    children: <Widget>[
// **********************The name field ******************************
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.8),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                  controller: _nameTextController,
                                  decoration: InputDecoration(
                                    hintText: "Full name",
                                    icon: Icon(Icons.person_outline),
                                    border: InputBorder.none,


                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "The name field can not be empty";
                                    }
                                    else {
                                      return null;
                                    }
                                  }

//                      keyboardType: TextInputType.emailAddress,
//                      controller: _emailTextController,

                              ),
                            ),
                          ),
                        ),
                      ),


// **********************The email field ******************************


                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.8),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                controller: _emailTextController,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  icon: Icon(Icons.mail),
                                  border: InputBorder.none,


                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return"the email field can not be empty";
                                    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    ;
                                    RegExp regex = RegExp(pattern);
                                    if (regex.hasMatch(value)) {
                                      return 'Please make sure your email address is valid';
                                    }
                                    else {
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
                      // **********************The gender field ******************************

                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            14.0, 8.0, 14.0, 8.0),
                        child: new Container(
                          color: Colors.white.withOpacity(0.4),
                          child: ListTile(
                            title: Row(
                              children: <Widget>[
                                Expanded(
                                  child: ListTile(
                                    title: Text(
                                      "male", textAlign: TextAlign.end,
                                      style: TextStyle(color: Colors.white),),
                                    trailing: Radio(value: "male",
                                        groupValue: groupValue,
                                        onChanged: (e) =>
                                            valueChanged(e)),

                                  ),

                                ),
                                Expanded(
                                  child: ListTile(
                                    title: Text(
                                      "female", textAlign: TextAlign.end,
                                      style: TextStyle(color: Colors.white),),
                                    trailing: Radio(value: "female",

                                        groupValue: groupValue,
                                        onChanged: (e) =>
                                            valueChanged(e)),


                                  ),

                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // **********************The password field ******************************

                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.8),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                  controller: _passwordemailTextController,
                                  obscureText: hidePassword,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    icon: Icon(Icons.lock_outline),
                                    border: InputBorder.none,


                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "The password field can not be empty";
                                    }
                                    else if (value.length < 6) {
                                      return "The password has to be at least 6 characters long ";
                                    }
                                    return null;
                                  }

//                      keyboardType: TextInputType.emailAddress,
//                      controller: _emailTextController,

                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                onPressed: () {
                                  setState(() {
                                    hidePassword = false;
                                  });
                                },),
                            ),
                          ),
                        ),
                      ),

                      // **********************The confirmation of password field ******************************


                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.8),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                  controller: _confirmPasswordController,
                                  obscureText: hidePassword,

                                  decoration: InputDecoration(
                                    hintText: "Confirm password",
                                    icon: Icon(Icons.lock_outline),
                                    border: InputBorder.none,


                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "The password field can not be empty";
                                    }
                                    else if (value.length < 6) {
                                      return "The password has to be at least 6 characters long ";
                                    }
                                    else if (_confirmPasswordController.text !=
                                        value) {
                                      return "The password does not match";
                                    }
                                    return null;
                                  }

//                      keyboardType: TextInputType.emailAddress,
//                      controller: _emailTextController,

                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                onPressed: () {
                                  setState(() {
                                    hidePassword = false;
                                  });
                                },),

                            ),
                          ),
                        ),
                      ),


                      // **********************The register button field ******************************

                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.pink.shade900.withOpacity(0.8),
                          elevation: 0.0,
                          child: MaterialButton( onPressed:  ()   async {
                            if(_formkey.currentState.validate())
                            {
                              setState(()=> loading =true );
                              dynamic result = await registerWithEmailAndPasswoed(_emailTextController.text,_passwordemailTextController.text);
                              if(result == null)
                              {

                                setState(() => err ='plese supply a valid email' );
                                loading=false;
                              }
                            }
                            Navigator.pushReplacement(
                                context, MaterialPageRoute(builder: (context) => HomePage(0xffe91e63)));


                          }, minWidth: MediaQuery
                              .of(context)
                              .size
                              .width,
                            child: Text("Sign up", textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold
                                  ,
                                  fontSize: 20.0),
                            ),
                          ),


                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            14.0, 8.0, 14.0, 8.0),
                        child: InkWell(onTap: () {
                          Navigator.pop(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                          child: Text("I already have an account", textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.pink)
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),

//          Visibility(
//            visible: loading ?? true,
//            child: Center(
//              child: Container(
//                alignment: Alignment.center,
//                color: Colors.white.withOpacity(0.9),
//                child: CircularProgressIndicator(
//                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
//                ),
//              ),
//            ),
//          ),

        ],
      ),


    );
  }

  valueChanged (e) {
    setState(() {
      if (e == "male") {
        groupValue = e;
        gender = e;
      }
      else if (e == "female") {
        groupValue = e;
        gender = e;
      }
    });
  }
  Future registerWithEmailAndPasswoed (String email,String password) async
  {
    try{
      final FirebaseAuth _auth = FirebaseAuth.instance;

      AuthResult result =await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user =result.user;
//create a new document for the user with an uid
      await DatabaseServices(uid: user.uid).updateUserDate( user.uid.toString(),_nameTextController.text,_emailTextController.text,_passwordemailTextController.text,gender);
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










//
//Container(
//child:Material(
//child:TextFormField(
//controller: _searchController,
//decoration: InputDecoration(
//contentPadding: const EdgeInsets.all(10.0),
//hintText: "Search...",
//border: InputBorder.none),
//validator: (value) {
//if (value.isEmpty) {
//return "The search field cannot be empty";
//}
//return null;
//},
//
//),
//
//),
//)
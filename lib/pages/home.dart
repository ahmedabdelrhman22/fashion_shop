
import 'package:fashion_shop/pages/profile.dart';
import 'package:flutter/material.dart';

//My_own_imports
import 'package:fashion_shop/pages/cart.dart';
import 'package:fashion_shop/pages/hometoptabs.dart';

import 'package:fashion_shop/pages/login.dart';

class HomePage extends StatefulWidget {
  @override

  HomePage(this.colorVal);
  int colorVal;
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 4);
    _tabController.addListener(_handleTabSelection);
  }
  void _handleTabSelection() {
    setState(() {
      widget.colorVal=0xffe91e63;
    });
  }



  TextEditingController _searchController = TextEditingController();

  Color primary=  Color(0xffe91e63);

  @override
  Widget build (BuildContext context) {
    //photos is coming and going

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: new AppBar(


//        iconTheme: IconThemeData(color:Colors.pink),
    backgroundColor: Colors.white,
    title: Material(

   borderRadius: BorderRadius.circular(5.0),
  color: Colors.grey[100],
   elevation: 0.0,
   child:Text('fashion',style: TextStyle(color: Colors.pink,fontSize: 25.0),),



   ),


         actions: <Widget>[

          new IconButton(
             icon: Icon(
               Icons.search,
                  color: Colors.pink,
              ),
               onPressed: () {}),


       ],



          bottom: TabBar(

        isScrollable: true,
        indicatorColor: Colors.pink,
        indicatorWeight: 4.0,
        controller: _tabController,
        onTap: (index){
          setState(() {
            switch (index) {
              case 0:
                primary= Color(0xffff5722);
                break;
              case 1:
                primary= Color(0xff3f51b5);
                break;
              case 2:
                primary= Color(0xffe91e63);

                break;
              case 3:
                primary= Color(0xff9c27b0);

                break;

              default:
            }
          });
        },
        tabs: <Widget>[

          Tab(

            child:Text('HOME',style: TextStyle( color: _tabController.index == 0
                ?  Color( widget.colorVal)
                : Colors.grey,fontSize: 18.0)),
            ),
          Tab(

            child: Text('CART',style: TextStyle( color: _tabController.index == 1
                ?  Color( widget.colorVal)
                : Colors.grey,fontSize: 18.0)),
            ),
          Tab(

            child: Text('ACCOUNT',style: TextStyle( color: _tabController.index == 2
                ?  Color( widget.colorVal)
                : Colors.grey,fontSize: 18.0)),
            ),
          Tab(

            child: Text('ORDER',style: TextStyle( color: _tabController.index == 3
                ?  Color( widget.colorVal)
                : Colors.grey,fontSize: 18.0)),
            ),
//          Tab(
//
//            child: Text('SETTING',style: TextStyle( color: _tabController.index == 4
//                ?  Color( widget.colorVal)
//                : Colors.grey,fontSize: 18.0),),
//            ),
        ],
        ),



      ),
        drawer: new Drawer(

                  child: ListView(
                    children: <Widget>[
                      //header
                      new UserAccountsDrawerHeader(accountName: Text('Ahmed abdelrhman'),
                        accountEmail: Text('ahmedabdelrhman81@stud.fci-cu.edu.eg'),
                        currentAccountPicture: GestureDetector(
                          child: new CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.person, color: Colors.white,),
                          ),
                        ),
                        decoration: new BoxDecoration(
                          color: Colors.pink,
                                                  ),

                      ),
                      //body
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => HomePage(0xffe91e63)));
                        },
                        child: ListTile(
                          title: Text('Home Page'),
                          leading: Icon(Icons.home, color: Colors.pink),

                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Text('My account'),
                          leading: Icon(Icons.person, color: Colors.pink),

                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Text('My orders'),
                          leading: Icon(Icons.shopping_basket, color: Colors.pink),

                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => Cart()));
                        },
                        child: ListTile(
                          title: Text('Shopping cart'),
                          leading: Icon(Icons.shopping_cart, color: Colors.pink,),

                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => Cart()));
                        },
                        child: ListTile(
                          title: Text('Payment option'),
                          leading: Icon(Icons.payment, color: Colors.pink,),

                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Text('Saved'),
                          leading: Icon(Icons.save, color: Colors.pink),

                        ),
                      ),
                      Divider(),
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Text('Settings'),
                          leading: Icon(Icons.settings,),

                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: ListTile(
                          title: Text('About'),
                          leading: Icon(Icons.help),

                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: ListTile(
                          title: Text('Log out'),
                          leading: Icon(Icons.close),

                        ),
                      ),
                    ],
                  ),
                ),

//photos is coming and going
        body:


        TabBarView(
          controller: _tabController,

          children: <Widget>[


          HomeTopTabs(),

              Cart(),
          Myprofile(),
          Cart(),
//            MusicTopTabs(0xff2196f3),






          ],
          ),




      ),
    );
  }



}


















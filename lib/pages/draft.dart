//    TextFormField(
//    controller: _searchController,
//    decoration: InputDecoration(
//    contentPadding: const EdgeInsets.all(10.0),
//    hintText: "Search...",
//    border: InputBorder.none),
//    validator: (value) {
//    if (value.isEmpty) {
//    return "The search field cannot be empty";
//    }
//    return null;
//    },
//    ),






//          title: Padding(
//            padding: EdgeInsets.only(top: 8.0),
////            child: _GooglePlayAppBar(),
//          ),


















//drawer: new Drawer(
//
//          child: ListView(
//            children: <Widget>[
//              //header
//              new UserAccountsDrawerHeader(accountName: Text('Ahmed abdelrhman'),
//                accountEmail: Text('ahmedabdelrhman81@stud.fci-cu.edu.eg'),
//                currentAccountPicture: GestureDetector(
//                  child: new CircleAvatar(
//                    backgroundColor: Colors.grey,
//                    child: Icon(Icons.person, color: Colors.white,),
//                  ),
//                ),
//                decoration: new BoxDecoration(
//                  color: Colors.pink,
//                ),
//
//              ),
//              //body
//              InkWell(
//                onTap: () {
//                  Navigator.pushReplacement(context,
//                      MaterialPageRoute(builder: (context) => HomePage()));
//                },
//                child: ListTile(
//                  title: Text('Home Page'),
//                  leading: Icon(Icons.home, color: Colors.pink),
//
//                ),
//              ),
//              InkWell(
//                onTap: () {},
//                child: ListTile(
//                  title: Text('My account'),
//                  leading: Icon(Icons.person, color: Colors.pink),
//
//                ),
//              ),
//              InkWell(
//                onTap: () {},
//                child: ListTile(
//                  title: Text('My orders'),
//                  leading: Icon(Icons.shopping_basket, color: Colors.pink),
//
//                ),
//              ),
//              InkWell(
//                onTap: () {
//                  Navigator.push(
//                      context, MaterialPageRoute(builder: (context) => Cart()));
//                },
//                child: ListTile(
//                  title: Text('Shopping cart'),
//                  leading: Icon(Icons.shopping_cart, color: Colors.pink,),
//
//                ),
//              ),
//              InkWell(
//                onTap: () {
//                  Navigator.push(
//                      context, MaterialPageRoute(builder: (context) => Cart()));
//                },
//                child: ListTile(
//                  title: Text('Payment option'),
//                  leading: Icon(Icons.payment, color: Colors.pink,),
//
//                ),
//              ),
//              InkWell(
//                onTap: () {},
//                child: ListTile(
//                  title: Text('Saved'),
//                  leading: Icon(Icons.save, color: Colors.pink),
//
//                ),
//              ),
//              Divider(),
//              InkWell(
//                onTap: () {},
//                child: ListTile(
//                  title: Text('Settings'),
//                  leading: Icon(Icons.settings,),
//
//                ),
//              ),
//              InkWell(
//                onTap: () {},
//                child: ListTile(
//                  title: Text('About'),
//                  leading: Icon(Icons.help),
//
//                ),
//              ),
//              InkWell(
//                onTap: () {
//                  Navigator.pushReplacement(
//                      context, MaterialPageRoute(builder: (context) => Login()));
//                },
//                child: ListTile(
//                  title: Text('Log out'),
//                  leading: Icon(Icons.close),
//
//                ),
//              ),
//            ],
//          ),
//        ),






















////              Expanded(
////                child: Padding(
////                  padding: const EdgeInsets.fromLTRB(0.0,0.0,9.0,0.0),
////                  child: Tab(
////                    child: Container(
////                      child: Padding(
////                        padding: const EdgeInsets.fromLTRB(0.0,0.0,0.0,0.0),
////                        child: Icon(
////                          Icons.home,size: 40,color: _tabController.index == 0
////                            ?  Color( widget.colorVal)
////                            : Colors.grey,
////                          ),
////                        ),
////                      ),
////                    ),
////                  ),
////                ),
////              Expanded(
////                child: Padding(
////                  padding: const EdgeInsets.fromLTRB(9.0,0.0,9.0,0.0),
////                  child: Tab(
////                    child: Container(
////                      child: Padding(
////                        padding: const EdgeInsets.fromLTRB(0.0,0.0,0.0,0.0),
////                        child: Icon(
////                          Icons.shopping_cart,size: 40,color: _tabController.index == 1
////                            ?  Color( widget.colorVal)
////                            : Colors.grey,
////                          ),
////                        ),
////                      ),
////                    ),
////                  ),
////                ),
////              Expanded(
////                child: Padding(
////                  padding: const EdgeInsets.fromLTRB(9.0,0.0,9.0,0.0),
////                  child: Tab(
////                    child: Container(
////                      child: Padding(
////                        padding: const EdgeInsets.fromLTRB(0.0,0.0,0.0,0.0),
////                        child: Icon(
////                          Icons.account_circle,size: 40,color: _tabController.index == 2
////                            ?  Color( widget.colorVal)
////                            : Colors.grey,
////                          ),
////                        ),
////                      ),
////                    ),
////                  ),
////                ),
////              Expanded(
////                child: Padding(
////                  padding: const EdgeInsets.fromLTRB(9.0,0.0,9.0,0.0),
////                  child: Tab(
////                    child: Container(
////                      child: Padding(
////                        padding: const EdgeInsets.fromLTRB(0.0,0.0,0.0,0.0),
////                        child: Icon(
////                          Icons.shopping_basket,size: 40,color: _tabController.index == 3
////                            ?  Color( widget.colorVal)
////                            : Colors.grey,
////                          ),
////                        ),
////                      ),
////                    ),
////                  ),
////                ),
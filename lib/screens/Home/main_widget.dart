import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spree/screens/Cart/cart_screen.dart';
import 'package:spree/screens/Search/search_screen.dart';
import 'package:spree/screens/Account/account.dart';

import 'home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 List<Widget> allWidgets = [
   HomeTab(),
   SearchScreen(),
   CartScreen(),
   AccountScreen()
 ];

 int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: allWidgets.elementAt(_tabIndex),
        bottomNavigationBar: Container(
          height: size.height*0.08,
          child: BottomNavigationBar(
         backgroundColor: Colors.white,
            onTap: (index){
              setState(() {
                _tabIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            currentIndex: _tabIndex,
            showUnselectedLabels: true,
            selectedItemColor: Colors.blue,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.black,),title: Text("Home",style: TextStyle(color:  Colors.black),)),
              BottomNavigationBarItem(icon: Icon(Icons.search,color: Colors.black),title: Text("Search",style: TextStyle(color: Colors.black))),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,color:  Colors.black),title: Text("Cart",style: TextStyle(color:  Colors.black))),
              BottomNavigationBarItem(icon: Icon(Icons.person,color:  Colors.black),title: Text("Account",style: TextStyle(color:  Colors.black))),
            ],
          ),
        ),
      ),
    );
  }
}

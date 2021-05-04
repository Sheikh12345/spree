import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spree/screens/Cart/cart_screen.dart';
import 'package:spree/screens/Home/Brands/all_brands.dart';
import 'package:spree/screens/Home/functions/functions.dart';
import 'package:spree/screens/Search/search_screen.dart';
import 'package:spree/screens/account.dart';

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
              BottomNavigationBarItem(icon: Icon(Icons.home,color:_tabIndex==0?Colors.blue: Colors.black,),title: Text("Home",style: TextStyle(color: _tabIndex==0?Colors.blue: Colors.black),)),
              BottomNavigationBarItem(icon: Icon(Icons.search,color:_tabIndex==1?Colors.blue: Colors.black),title: Text("Search",style: TextStyle(color: _tabIndex==1?Colors.blue: Colors.black))),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,color: _tabIndex==2?Colors.blue: Colors.black),title: Text("Cart",style: TextStyle(color: _tabIndex==2?Colors.blue: Colors.black))),
              BottomNavigationBarItem(icon: Icon(Icons.person,color: _tabIndex==3?Colors.blue: Colors.black),title: Text("Account",style: TextStyle(color: _tabIndex==3?Colors.blue: Colors.black))),
            ],
          ),
        ),
      ),
    );
  }
}

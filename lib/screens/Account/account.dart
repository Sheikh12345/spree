import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Home/functions/functions.dart';
import 'Components/account_details.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// Nam & Circular Picture
            Container(
              margin: EdgeInsets.symmetric(vertical: size.height*0.04),
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Container(
                  child: Text("Razi",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,
                  fontSize: size.width*0.08),),
                  margin: EdgeInsets.only(left: size.width*0.05),
                ),

              ],),
            ),


            /// Spree Wallet
            Container(
              margin: EdgeInsets.only(left: size.width*0.05,right: size.width*0.09),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(" Spree Wallet",style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width*0.05,
                    fontWeight: FontWeight.w500,
                  ),),
                  Text("\$0.00",style: GoogleFonts.cabin(
                    color: Colors.black,
                    fontSize: size.width*0.05,
                    fontWeight: FontWeight.w900,
                  ),),
                ],
              ),
            ),

            /// General
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: size.height*0.04,left: size.width*0.05,right: size.width*0.09),
              child: Text("General",style: TextStyle(
                color: Colors.black,
                fontSize: size.width*0.05,
                fontWeight: FontWeight.w500,
              ),),
            ),
            /// My Account Details
            InkWell(
              onTap: (){
                screenPush(context, AccountDetails());
              },
              child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: size.height*0.02,left: size.width*0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("My Account Details",style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: size.width*0.04,
                        fontWeight: FontWeight.w500,
                      ),),
                      IconButton(icon: Icon(Icons.arrow_forward_ios,size: size.width*0.05,), onPressed: (){

                      })
                    ],)
              ),
            ),

            /// Help & Support
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: size.height*0.04,left: size.width*0.05,right: size.width*0.09),
              child: Text("Help & Support",style: TextStyle(
                color: Colors.black,
                fontSize: size.width*0.05,
                fontWeight: FontWeight.w500,
              ),),
            ),
            /// Contact Support
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: size.height*0.02,left: size.width*0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Contact Support",style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: size.width*0.04,
                      fontWeight: FontWeight.w500,
                    ),),
                    IconButton(icon: Icon(Icons.arrow_forward_ios,size: size.width*0.05,), onPressed: (){

                    })
                  ],)
            ),
            /// Legal
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: size.height*0.04,left: size.width*0.05,right: size.width*0.09),
              child: Text("Legal",style: TextStyle(
                color: Colors.black,
                fontSize: size.width*0.05,
                fontWeight: FontWeight.w500,
              ),),
            ),
            /// Terms of Service
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: size.height*0.02,left: size.width*0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Terms of Service",style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: size.width*0.04,
                      fontWeight: FontWeight.w500,
                    ),),
                    IconButton(icon: Icon(Icons.arrow_forward_ios,size: size.width*0.05,), onPressed: (){

                    })
                  ],)
            ),

            /// Privacy Policy
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: size.height*0.02,left: size.width*0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Privacy Policy",style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: size.width*0.04,
                      fontWeight: FontWeight.w500,
                    ),),
                    IconButton(icon: Icon(Icons.arrow_forward_ios,size: size.width*0.05,), onPressed: (){

                    })
                  ],)
            ),

            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: size.height*0.03,left: size.width*0.05),
                child: Text("Sign Out",style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: size.width*0.04,
                  fontWeight: FontWeight.w500,
                ),),
            ),
          ],
        ),
      ),
    ));
  }
}

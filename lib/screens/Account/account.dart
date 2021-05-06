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
              width: size.width,
              height: size.height*0.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Container(
                  child: Text("Razi",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,
                  fontSize: size.width*0.08),),
                  margin: EdgeInsets.only(left: size.width*0.05),
                ),

                Container(
                  margin: EdgeInsets.only(right: size.width*0.04),
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: size.width*0.22,
                        height: size.width*0.22,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: Text("R",style: TextStyle(
                          fontSize: size.width*0.06,
                          color: Colors.white,

                        ),),
                      ),
                      Positioned(
                        top: size.height*0.085,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(size.width*0.007),
                          child:Container(
                              decoration: BoxDecoration(
                                color: Colors.blue[900],
                                shape: BoxShape.circle,
                              ),

                              child: Icon(Icons.camera_alt_sharp,size: size.width*0.04,color: Colors.white,)),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          width: size.width*0.09,
                          height:  size.width*0.09,
                        ),
                      )
                    ],
                  ),
                )
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

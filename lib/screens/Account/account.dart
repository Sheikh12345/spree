import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spree/Common/functions.dart';
import 'package:spree/Services/ApiCalls/auth-calls.dart';
import 'package:spree/providers/profile_provider.dart';
import 'package:spree/screens/Auth/login_screen.dart';
import 'package:toast/toast.dart';

import 'Components/account_details.dart';
import 'Components/credit_card.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPass = TextEditingController();


  String email;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// Name
            Container(
              margin: EdgeInsets.symmetric(vertical: size.height*0.04),
              width: size.width,
              child: FutureBuilder(
                future:CallApi().getProfile(context: context),
                builder: (_,snapshot){
                  if(snapshot.hasData){
                    email = snapshot.data.data.email;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text("${snapshot.data.data.firstName}",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,
                              fontSize: size.width*0.08),),
                          margin: EdgeInsets.only(left: size.width*0.05),
                        ),
                      ],);
                  }else if(snapshot.hasError){
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text("${snapshot.error}",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,
                              fontSize: size.width*0.08),),
                          margin: EdgeInsets.only(left: size.width*0.05),
                        ),

                      ],);
                  }else{
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text("Loading..",style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black,
                              fontSize: size.width*0.08),),
                          margin: EdgeInsets.only(left: size.width*0.05),
                        ),

                      ],);
                  }
                },
              )
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
                screenPush(context, AccountDetails(
                  email: email,
                ));
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

            InkWell(
              onTap: (){
                screenPush(context, AddCard());
              },
              child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: size.height*0.02,left: size.width*0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("payment gateway",style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: size.width*0.04,
                        fontWeight: FontWeight.w500,
                      ),),
                      IconButton(icon: Icon(Icons.arrow_forward_ios,size: size.width*0.05,), onPressed: (){

                      })
                    ],)
              ),
            ),

            InkWell(
              onTap: ()async{
                SharedPreferences prefs = await SharedPreferences.getInstance();
                bool status = await prefs.setString("token",'');
                if(status){
                  Toast.show("Signout successfully", context,duration: 1,backgroundColor: Colors.black,
                  textColor: Colors.white,);
                  screenPushRep(context, LoginScreen());
                }
              },
              child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: size.height*0.03,left: size.width*0.05),
                  child: Text("Sign Out",style: TextStyle(
                    color: Colors.blue[600],
                    fontSize: size.width*0.04,
                    fontWeight: FontWeight.w500,
                  ),),
              ),
            ),


          ],
        ),
      ),
    ));
  }


setEmail(BuildContext context,var snapshot){
  Provider.of<ProfileProvider>(context,listen: false).emailSet(snapshot.data.data.email);

}

}

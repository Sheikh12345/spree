import 'package:flutter/material.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({Key key}) : super(key: key);

  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  bool switchState;
  @override
  void initState() {
    super.initState();
    switchState = false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.black,),),
        elevation: 0,
title: Text("Account Details",style: TextStyle(color: Colors.black,
fontSize: size.width*0.06,
fontWeight: FontWeight.w900),),
        centerTitle: true,
        actions: [
          Container(
              margin: EdgeInsets.only(top: size.height*0.025,right: size.width*0.06),
              child: Text("Save",style: TextStyle(color: Colors.grey[400],fontSize: size.width*0.05),))
        ],
      ),

      body: Container(
        margin: EdgeInsets.only(left: size.width*0.05,right: size.width*0.07),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height*0.03,
            ),
            Text("Personal Information",style: TextStyle(color: Colors.black,
                fontSize: size.width*0.055,
                fontWeight: FontWeight.w600),),
            SizedBox(
              height: size.height*0.04  ,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("Full Name",style: TextStyle(fontWeight: FontWeight.w800,
              fontSize: size.width*0.05),),
              Text("Razi",style: TextStyle(fontWeight: FontWeight.w400,
                  fontSize: size.width*0.06,
              color: Colors.blue[800]),),
            ],),
            SizedBox(
              height: size.height*0.04  ,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Your Email",style: TextStyle(fontWeight: FontWeight.w800,
                    fontSize: size.width*0.05),),
                Text("user@spree.com",style: TextStyle(fontWeight: FontWeight.w400,
                    fontSize: size.width*0.05,
                    color: Colors.grey),),
              ],),
            SizedBox(
              height: size.height*0.08  ,
            ),
            Text("Notifications",style: TextStyle(color: Colors.black,
                fontSize: size.width*0.055,
                fontWeight: FontWeight.w600),),
            SizedBox(
              height: size.height*0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Enable Push Notifications",style: TextStyle(fontWeight: FontWeight.w800,
                    fontSize: size.width*0.04),),
                Container(
                  child:    Switch(
                    activeTrackColor: Colors.blue,
                      inactiveTrackColor: Colors.grey,
                      activeColor: Colors.blue[800],
                      value: switchState, onChanged: (value){
                    setState(() {
                      switchState = value;
                    });
                  }),
                )
              ],),

          ],
        ),
      ),
    ));
  }
}

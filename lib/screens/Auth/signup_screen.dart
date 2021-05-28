import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spree/Common/functions.dart';
import 'package:spree/Services/ApiCalls/auth-calls.dart';
import 'package:spree/screens/Home/main_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _controllerFName = TextEditingController();
  TextEditingController _controllerLName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPass = TextEditingController();
  TextEditingController _controllerCPass = TextEditingController();

  bool passwordVisible;
  bool loading ;
  @override
  void initState() {
    super.initState();
    loading =  false;
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          title: Text(
            "SPREE",
            style: GoogleFonts.ubuntu(
                fontWeight: FontWeight.w600,
                fontSize: size.width * 0.06,
                letterSpacing: 0.5),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                  "Create an account",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: size.height * 0.03, bottom: size.height * 0.02),
                  padding: EdgeInsets.only(
                      left: size.width * 0.04, top: size.height * 0.01),
                  height: size.height * 0.08,
                  decoration: BoxDecoration(
                      color: Colors.grey[300].withOpacity(0.8),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: _controllerFName,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "First name",
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        )),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: size.height * 0.02),
                  padding: EdgeInsets.only(
                      left: size.width * 0.04, top: size.height * 0.01),
                  height: size.height * 0.08,
                  decoration: BoxDecoration(
                      color: Colors.grey[300].withOpacity(0.8),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: _controllerLName,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Last name",
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        )),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: size.height * 0.02),
                  padding: EdgeInsets.only(
                      left: size.width * 0.04, top: size.height * 0.01),
                  height: size.height * 0.08,
                  decoration: BoxDecoration(
                      color: Colors.grey[300].withOpacity(0.8),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: _controllerEmail,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email address",
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: size.width * 0.04, top: size.height * 0.01),
                  height: size.height * 0.08,
                  decoration: BoxDecoration(
                      color: Colors.grey[300].withOpacity(0.8),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    obscureText: passwordVisible,
                    controller: _controllerPass,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        suffixIcon: IconButton(
                            icon: Icon(passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            }),
                        hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: size.width * 0.04)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: size.height * .02,
                  ),
                  padding: EdgeInsets.only(
                      left: size.width * 0.04, top: size.height * 0.01),
                  height: size.height * 0.08,
                  decoration: BoxDecoration(
                      color: Colors.grey[300].withOpacity(0.8),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    obscureText: passwordVisible,
                    controller: _controllerCPass,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            }),
                        border: InputBorder.none,
                        hintText: "Confirm password",
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        )),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                        left: size.width * 0.007, top: size.height * 0.01),
                    child: Text(
                      "Forgot password?",
                      style: GoogleFonts.ubuntu(fontSize: size.width * 0.04),
                    )),
                InkWell(
                  onTap: () {
                    signUpRequest(
                      size: size,
                      context: context
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.only(bottom: size.height * 0.003),
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: size.height * 0.02),
                    height: size.height * 0.07,
                    width: size.width,
                    decoration: BoxDecoration(
                      color:loading?Colors.grey: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "${loading?'Loading...':"Sign Up"}",
                      style: GoogleFonts.ubuntu(
                          color: Colors.white, fontSize: size.width * 0.04),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.006),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Already have an account?",
                        style: GoogleFonts.ubuntu(
                            color: Colors.grey[600],
                            fontSize: size.width * 0.04),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Log In",
                          style: GoogleFonts.ubuntu(
                              color: Colors.black,
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  signUpRequest({
    Size size,
    BuildContext context,
  }) async {
    if (_controllerFName.text.length < 2) {
      snackBar(
          error: "First name is short", context: context, code: 1, size: size);
    } else if (_controllerLName.text.length < 2) {
      snackBar(
          error: "Last name is short", context: context, code: 1, size: size);
    } else if (!EmailValidator.validate(_controllerEmail.text)) {
      snackBar(
          error: "Email is not valid", context: context, code: 1, size: size);
    } else if (_controllerPass.text.length < 5) {
      snackBar(
          error: "Password is short", context: context, code: 1, size: size);
    } else if (_controllerPass.text != _controllerCPass.text) {
      snackBar(
          error: "Password is not matched", context: context, code: 1, size: size);
    } else {
      setState(() {
        loading = true;
      });
       await CallApi().postSignUpData(
          fName: _controllerFName.text,
          lName: _controllerLName.text,
          email: _controllerEmail.text,
          password: _controllerPass.text,
          confirmPass: _controllerCPass.text).then((value)async{
         var data = jsonDecode(value.body);
         print("value.body => "+value.body);
        if (data["message"] == "Registered Successfully") {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          bool status = await prefs.setString("token", data["access_token"]);
          if (status) {
            setState((){
              loading = false;
            });
            print("set");
            snackBar(
                error: "${data["message"]}", context: context, code: 2, size: size);
            screenPushRep(context, HomePage());
          }
        }else{
          setState(() {
            loading = false;
          });
          print('error => '+data['message']);
          snackBar(
              error: "${data["message"]}", context: context, code: 1, size: size);
        }
      });



    }
  }



  snackBar({String error, int code, BuildContext context, Size size}) {
    if (code == 1) {
      final snackBar = SnackBar(
        content: Text(
          "$error",
          style: TextStyle(
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.8),
        ),
        backgroundColor: Colors.red[600],
        duration: Duration(seconds: 1),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (code == 2) {
      final snackBar = SnackBar(
        content: Text(
          "$error",
          style: TextStyle(
              color: Colors.white,
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.8),
        ),
        backgroundColor: Colors.green[600],
        duration: Duration(seconds: 1),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }


}

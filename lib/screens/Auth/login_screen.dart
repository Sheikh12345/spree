import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spree/Common/functions.dart';
import 'package:spree/Services/ApiCalls/auth-calls.dart';
import 'package:spree/providers/profile_provider.dart';
import 'package:spree/screens/Auth/forgot_password.dart';
import 'package:spree/screens/Auth/signup_screen.dart';
import 'package:spree/screens/Home/main_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPass = TextEditingController();
bool _loading;
  @override
  void initState() {
    super.initState();
    _loading = false;
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
                "Login to your account",
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
                    left: size.width * 0.04, top: size.height * 0.004),
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
                    left: size.width * 0.04, top: size.height * 0.004),
                height: size.height * 0.08,
                decoration: BoxDecoration(
                    color: Colors.grey[300].withOpacity(0.8),
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  controller: _controllerPass,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: size.width * 0.04)),
                ),
              ),
              InkWell(
                onTap: () {
                  screenPush(context, ForgotPassword());
                },
                child: Container(
                    margin: EdgeInsets.only(
                        top: size.height * 0.025, left: size.width * 0.007),
                    child: Text(
                      "Forgot password?",
                      style: GoogleFonts.ubuntu(fontSize: size.width * 0.04),
                    )),
              ),
              InkWell(
                onTap: () {

                  if(_loading==false){
                    singInRequest(context: context, size: size);
                    print("called 0");
                  }
                },
                child: Container(
                  padding: EdgeInsets.only(bottom: size.height * 0.003),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: size.height * 0.05),
                  height: size.height * 0.07,
                  width: size.width,
                  decoration: BoxDecoration(
                    color:_loading?Colors.grey:Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "${_loading?"Loading...":"Log In"}",
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
                      "Don't have an account?",
                      style: GoogleFonts.ubuntu(
                          color: Colors.grey[600], fontSize: size.width * 0.04),
                    ),
                    GestureDetector(
                        onTap: () {
                          screenPush(context, SignUpScreen());
                        },
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.ubuntu(
                              color: Colors.black,
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  singInRequest({BuildContext context, Size size}) async {
    if (!EmailValidator.validate(_controllerEmail.text)) {
      snackBar(
          msg: "Email is not valid", context: context, code: 1, size: size);
    } else if (_controllerPass.text.length < 5) {
      snackBar(
          msg: "Password is short", context: context, code: 1, size: size);
    } else {
      setState(() {
        _loading = true;
      });
      await CallApi()
          .postSignInData(
              email: _controllerEmail.text, password: _controllerPass.text)
          .then((value) async {
        var data = jsonDecode(value.body);
        print(data);
        if (data["access_token"].toString().length>5){
         setState(() {
           _loading = false;
         });
     await SharedPreferences.getInstance().then((value)async{
       bool status = await value.setString("token", data["access_token"]);
       print(data['access_token']);
       Provider.of<ProfileProvider>(context,listen: false).tokenSet(data['access_token']);

       if (status) {
         print("set");

         snackBar(
             msg: "Welcom back..",
             context: context,
             code: 2,
             size: size);
         screenPushRep(context, HomePage());
       }
          });
        } else {
          snackBar(
              msg: "User is not found with that email or password",
              context: context,
              code: 1,
              size: size);
          setState(() {
            _loading = false;
          });
        }
      });
    }
  }

  snackBar({String msg, int code, BuildContext context, Size size}) {
    if (code == 1) {
      final snackBar = SnackBar(
        content: Text(
          "$msg",
          style: TextStyle(
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.8),
        ),
        backgroundColor: Colors.red[600],
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (code == 2) {
      final snackBar = SnackBar(
        content: Text(
          "$msg",
          style: TextStyle(
              color: Colors.white,
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.8),
        ),
        backgroundColor: Colors.green[600],
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

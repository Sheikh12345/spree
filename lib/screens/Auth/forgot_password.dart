import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:spree/Common/functions.dart';
import 'package:spree/Services/ApiCalls/auth-calls.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _controllerEmail = TextEditingController();

  bool _loading;

  @override
  void initState() {
    super.initState();
    _loading = false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("SPREE",style: GoogleFonts.ubuntu(fontWeight: FontWeight.w600,fontSize: size.width*0.06,letterSpacing: 0.5),),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width*0.02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height*0.05,
              ),
              Text("Forgot your password?",style: TextStyle(color: Colors.black,fontSize: size.width*0.05,fontWeight: FontWeight.w600,),),
              Container(
                margin: EdgeInsets.only(top: size.height*0.03,bottom: size.height*0.01),
                padding: EdgeInsets.only(left: size.width*0.04,top: size.height*0.004),
                height: size.height*0.08,
                decoration: BoxDecoration(
                    color: Colors.grey[300].withOpacity(0.8),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: TextField(
                  controller: _controllerEmail,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email address",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                      )
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  resetPassRequest(size: size);
                },
                child: Container(
                  padding: EdgeInsets.only(bottom: size.height*0.003),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: size.height*0.05),
                  height: size.height*0.07,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: _loading?Colors.grey:Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text("${_loading?"Loading...":"Send Code"}",style: GoogleFonts.ubuntu(color: Colors.white,fontSize: size.width*0.04),),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
  resetPassRequest({Size size})async{
      setState(() {
        _loading = true;
      });
 await CallApi().postResetPassword(email: _controllerEmail.text).then((value){
   if(value.statusCode==200){
     setState(() {
       _loading = false;
     });
     snackBar(
         msg: "Please check your inbox", context: context, code: 2, size: size);
     Navigator.pop(context);
   }else{
     setState(() {
       _loading = false;
     });
     snackBar(
         msg: "Something is wrong", context: context, code: 1, size: size);
   }
 });


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


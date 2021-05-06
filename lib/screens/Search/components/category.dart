import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Category extends StatefulWidget {
  const Category({Key key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<String> brandImages = [
    "adwoa.png",
    "akila.png",
    "honey.png",
    "guava.png",
    "glasses.png",
    "amass.png",
    "adwoa.png",
    "akila.png",
    "honey.png",
    "guava.png",
    "glasses.png",
    "amass.png"
  ];

  List<String> brandTitle = [
    "Activist",
    "Adwoa",
    "Aesop",
    "Alo",
    "Akila",
    "Amass",
    "Activist",
    "Adwoa",
    "Aesop",
    "Alo",
    "Akila",
    "Amass"
  ];

  List<String> colors = ["a8c7e9", "8590dd", "d8a55a", "c35855", "657dd7","8590dd", "d8a55a", "c35855", "657dd7","d8a55a", "c35855", "657dd7","d8a55a", "c35855", "657dd7"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text("Categories",style: GoogleFonts.zillaSlab(color: Colors.black,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.8,
          fontSize: size.width*0.06),),centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.black,),
        ),
      ),
      body: ListView.builder(
          itemCount: brandTitle.length,
          itemBuilder: (_,index){
        return Container(
          margin: EdgeInsets.only(left:size.width*0.02,right: size.width*0.02,top:size.width*0.02,bottom: size.width*0.02),
          width: size.width*0.4,
          height: size.height*0.25,
          decoration: BoxDecoration(
            color: Color(int.parse("0xff${colors[index]}")),
            image: DecorationImage(
                scale: 1,
                image: AssetImage(
                  "images/${brandImages[index]}",
                ),
                colorFilter:ColorFilter.srgbToLinearGamma()
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text("${brandTitle[index]}",style: GoogleFonts.cabin(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.8,
                fontSize: size.width*0.06
            ),),
            width: size.width*0.26,
            height: size.width*0.26,
            decoration: BoxDecoration(
            ),
          ),
        );
      })
    ));
  }
}

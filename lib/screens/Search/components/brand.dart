import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Brand extends StatefulWidget {
  const Brand({Key key}) : super(key: key);

  @override
  _BrandState createState() => _BrandState();
}

class _BrandState extends State<Brand> {

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


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          title: Text(
            "Brands",
            style: GoogleFonts.zillaSlab(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.8,
                backgroundColor: Colors.white,
                fontSize: size.width * 0.06),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.black,),),
        ),
        body: ListView.builder(
            itemCount: brandTitle.length,
            itemBuilder: (_,index){
          return Container(
            alignment: Alignment.center,
            width: size.width*0.9,
            height: size.height*0.24,
            margin: EdgeInsets.symmetric(horizontal:size.width*0.03,
            vertical: size.height*0.01),
            child: Text("${brandTitle[index]}",style: GoogleFonts.cabin(            color: Colors.white,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.8,
                fontSize: size.width*0.06),),
            decoration: BoxDecoration(
                color: Color(0xffccccce),
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                image: AssetImage("images/${brandImages[index]}"),
                  colorFilter: ColorFilter.srgbToLinearGamma()
              )
            ),
          );
        }
        ),
      ),
    );
  }
}

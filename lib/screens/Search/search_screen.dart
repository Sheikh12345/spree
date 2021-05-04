import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spree/screens/Home/functions/functions.dart';

import 'components/category.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> title = [
    "LA Essentials",
    "Health & wellness",
    "Pentry",
    "Beverage",
    "Personal care",
  ];

  List<String> images = [
    "glasses.png",
    "care.png",
    "honey.png",
    "pentry.png",
    "beverage.png",
    "adwoa.png",
    "akila.png",
    "honey.png",
    "guava.png"
  ];

  List<String> brandImages = [
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
    "Amass"
  ];
  List<String> colors = ["a8c7e9", "8590dd", "d8a55a", "c35855", "657dd7"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: size.height * 0.03, left: size.width * 0.04),
                child: Text(
                  "Search",
                  style: GoogleFonts.zillaSlab(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: size.width * 0.09),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.04,
                    right: size.width * 0.04,
                    top: size.height * 0.01,
                    bottom: size.width * 0.03),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Products and Brands",
                      hintStyle: GoogleFonts.cabin(
                          letterSpacing: 1, color: Colors.grey),
                      prefixIcon: Icon(Icons.search_rounded),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey, style: BorderStyle.solid)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey, style: BorderStyle.solid))),
                ),
              ),

              /// Brose by Category
              Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.04,
                    right: size.width * 0.04,
                    top: size.height * 0.02,
                    bottom: size.height * 0.02),
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Browse by Category",
                      style: TextStyle(
                          fontSize: size.width * 0.044,
                          fontWeight: FontWeight.w900),
                    ),
                    GestureDetector(
                      onTap: () {
                        screenPush(context, Category());
                      },
                      child: Row(
                        children: [
                          Text(
                            "SEE ALL",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: size.width * 0.03,
                            color: Colors.grey[600],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

              /// Slide
              Container(
                margin: EdgeInsets.only(top: size.height * 0.01),
                width: size.width,
                height: size.height * 0.15,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: title.length,
                    itemBuilder: (_, index) {
                      return Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(
                            horizontal: size.width * 0.015),
                        width: size.width * 0.45,
                        height: size.height * 0.12,
                        decoration: BoxDecoration(
                            color: Color(int.parse("0xff${colors[index]}")),
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image: AssetImage("images/${images[index]}"))),
                        child: Text(
                          "${title[index]}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: size.width * 0.045),
                        ),
                      );
                    }),
              ),

              /// Brose by Brand
              Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.04,
                    right: size.width * 0.04,
                    top: size.height * 0.04,
                    bottom: size.height * 0.02),
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Browse by Brand",
                      style: TextStyle(
                          fontSize: size.width * 0.044,
                          fontWeight: FontWeight.w900),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            "SEE ALL",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: size.width * 0.03,
                            color: Colors.grey[600],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

              /// Slide
              Container(
                margin: EdgeInsets.only(top: size.height * 0.01),
                width: size.width,
                height: size.height * 0.15,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: title.length,
                    itemBuilder: (_, index) {
                      return Container(
                        alignment: Alignment.center,
                        margin:
                            EdgeInsets.symmetric(horizontal: size.width * 0.03),
                        width: size.width * 0.45,
                        height: size.height * 0.12,
                        decoration: BoxDecoration(
                            color: Color(0xffccccce),
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image:
                                    AssetImage("images/${brandImages[index]}"),
                                colorFilter: ColorFilter.srgbToLinearGamma())),
                        child: Text(
                          "${title[index]}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: size.width * 0.045),
                        ),
                      );
                    }),
              ),

              Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.04,
                    right: size.width * 0.04,
                    top: size.height * 0.04,
                    bottom: size.height * 0.02),
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Top Searches",
                      style: TextStyle(
                          fontSize: size.width * 0.044,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),

              Container(
                width: size.width,
                height: size.height * 0.8,
                child: ListView.builder(
                    itemCount: title.length,
                    itemBuilder: (_, index) {
                      return Container(
                        width: size.width,
                        height: size.height * 0.15,
                        margin: EdgeInsets.symmetric(
                            horizontal: size.width * 0.04,
                            vertical: size.width * 0.01),
                        child: Row(
                          children: [
                            Container(
                              width: size.width * 0.3,
                              height: size.width * 0.3,
                              child:
                                  Image.asset("images/${brandImages[index]}"),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                                Text(
                                  " BALA",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  " ${title[index]}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: size.width * 0.04),
                                ),
                                Text(
                                  "\$29.05",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900,
                                      fontSize: size.width * 0.04),
                                ),
                                SizedBox(
                                  height: size.height * 0.02,
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

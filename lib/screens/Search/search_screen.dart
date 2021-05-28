import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spree/Common/functions.dart';

import 'components/brand.dart';
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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.04,
                    right: size.width * 0.04,
                    top: size.height * 0.03,
                    bottom: size.width * 0.07),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search Spree",
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

              /// Browse by Category
              Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.04,
                    right: size.width * 0.04,
                    top: size.height * 0.05,
                    bottom: size.height * 0.02),
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Browse Categories",
                      style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w900),
                    ),
                    GestureDetector(
                      onTap: () {
                        screenPush(context, Category());
                      },
                      child: Row(
                        children: [
                          Text(
                            "See All",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,fontSize: size.width*0.03,),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: size.width * 0.03,
                            color: Colors.blue,
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
                height: size.height * 0.2,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: title.length,
                    itemBuilder: (_, index) {
                      return Container(
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.symmetric(horizontal: size.width*0.03),

                          margin:
                          EdgeInsets.symmetric(horizontal: size.width * 0.03),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)
                          ),
                          height: size.height * 0.17,

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Image.asset("images/${images[index]}"),
                                width: size.width*0.25,
                                height: size.height*0.14,
                              ),
                              Text(
                                "${brandTitle[index]}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: size.width * 0.04),
                              ),
                            ],
                          )
                      );
                    }),
              ),

              /// Browse Brand
              Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.04,
                    right: size.width * 0.04,
                    top: size.height * 0.07,
                    bottom: size.height * 0.02),
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Browse Brands",
                      style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w900),
                    ),
                    GestureDetector(
                      onTap: () {
                        screenPush(context, Brand());
                      },
                      child:Row(
                        children: [
                          Text(
                            "See All",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,fontSize: size.width*0.03,),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: size.width * 0.03,
                            color: Colors.blue,
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
                height: size.height * 0.2,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: title.length,
                    itemBuilder: (_, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: size.width*0.03),

                        margin:
                            EdgeInsets.symmetric(horizontal: size.width * 0.03),
                          decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(5)
                          ),
                          alignment: Alignment.topCenter,
                          height: size.height * 0.17,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                child: Image.asset("images/${brandImages[index]}"),
                            width: size.width*0.25,
                              height: size.height*0.14,
                            ),
                            Text(
                              "${brandTitle[index]}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: size.width * 0.04),
                            ),
                          ],
                        )
                      );
                    }),
              ),

              Container(
                margin: EdgeInsets.only(
                    left: size.width * 0.04,
                    right: size.width * 0.04,
                    top: size.height * 0.07,
                    bottom: size.height * 0.02),
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Top Searches",
                      style: TextStyle(
                          fontSize: size.width * 0.04,
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
                        alignment: Alignment.centerLeft,
                        width: size.width,
                        height: size.height * 0.13,
                        margin: EdgeInsets.only(
                          right:  size.width * 0.04,
                            top: size.width * 0.01,
                          bottom:  size.width * 0.01,
                          left: size.width*0.031
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(size.width*0.02),
                              width: size.width * 0.2,
                              height: size.width * 0.22,
                              decoration: BoxDecoration(
                                color: Colors.grey[300]
                              ),
                              margin: EdgeInsets.all( size.width*0.015),
                              child:
                                  Image.asset("images/${brandImages[index]}"),
                            ),
                            SizedBox(
                              width: size.width*0.02,
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
                                      color: Colors.grey[600],
                                    fontSize: size.width*0.025,
                                    letterSpacing: 0.8
                                  ),
                                ),
                                Text(
                                  " ${title[index]}",
                                  style: GoogleFonts.cabin(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: size.width * 0.035),
                                ),
                                SizedBox(
                                  height: size.height*0.005,
                                ),
                                Text(
                                  " \$29.05",
                                  style: GoogleFonts.cabin(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: size.width * 0.035),
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

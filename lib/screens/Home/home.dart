import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Brands/all_brands.dart';
import 'functions/functions.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<String> title = [
    "LA Essentials",
    "Personal care",
    "Health & \nwellness",
    "Pentry",
    "Beverage"
  ];

  List<String> images = [
    "glasses.png",
    "care.png",
    "honey.png",
    "pentry.png",
    "beverage.png"
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
  List<String> colors = [
    "a8c7e9",
    "8590dd",
    "d8a55a",
    "c35855",
    "657dd7",
    "84a6ca",
    "85a05a"
  ];


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
            /// Spree
            Container(
              margin: EdgeInsets.only(top: size.width * 0.03,left: size.width * 0.03,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Spree",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: size.width * 0.08,
                    ),
                  ),
                ],
              ),
            ),

            /// slider
            Container(
              margin: EdgeInsets.only(top: size.height*0.03),
              width: size.width,
              height: size.height*0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: title.length,
                itemBuilder: (_,index){
                  String color = "0xff"+colors[index];
                  return       Container(
                    padding: EdgeInsets.all(size.width*0.01),
                    margin: EdgeInsets.only(right: size.width*0.03,left: size.width*0.01),
                    alignment: Alignment.center,
                    width: size.width*0.26,
                    height: size.width*0.26,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(int.parse(color)),
                      image: DecorationImage(
                          scale: 5,
                          image: AssetImage(
                            "images/${images[index]}",
                          )
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text("${title[index]}",style: GoogleFonts.cabin(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.8,
                          fontSize: size.width*0.03
                      ),),
                      width: size.width*0.26,
                      height: size.width*0.26,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.05),
                        shape: BoxShape.circle,
                      ),
                    ),
                  );
                },
              ),
            ),
            /// The Holiday edit
            Container(
              margin: EdgeInsets.only(left: size.width*0.04,top: size.height*0.03,bottom: size.height*0.02),
              alignment: Alignment.centerLeft,
              child: Text("The Holiday Edit",style: TextStyle(fontSize: size.width*0.04,fontWeight: FontWeight.w900),),
            ),

            /// slider
            Container(
              width: size.width,
              height: size.height*0.4,
              color: Colors.white,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_,index){
                  return    Container(
                    margin: EdgeInsets.all(size.width*0.02),
                    height: size.height*0.35,
                    width: size.width*0.4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),

                    ),
                    child: Column(
                      children: [
                        Container(
                          height: size.height*0.2,
                          width: size.width*0.4,
                          child: Image.asset("images/honey.png"),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: size.width*0.03),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Great Jones",style: GoogleFonts.cabin(color: Colors.grey[700],fontWeight: FontWeight.w500),),
                              SizedBox(
                                height: size.height*0.004,
                              ),
                              Text("Honey",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: size.width*0.04),)
                              ,      SizedBox(
                                height: size.height*0.01,
                              ),
                              Text("\$155.00",style: TextStyle(color: Colors.black.withOpacity(0.9),fontWeight: FontWeight.w700,fontSize: size.width*0.033),)

                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),

            /// Popular on Spree
            Container(
              margin: EdgeInsets.only(left: size.width*0.04,bottom: size.height*0.02),
              alignment: Alignment.centerLeft,
              child: Text("Popular on Spree",style: TextStyle(fontSize: size.width*0.04,fontWeight: FontWeight.w900),),
            ),

            /// slider
            Container(
              width: size.width,
              height: size.height*0.4,
              color: Colors.white,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_,index){
                  return    Container(
                    margin: EdgeInsets.all(size.width*0.02),
                    width: size.width*0.4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: size.height*0.2,
                          width: size.width*0.4,
                          child: Image.asset("images/care.png"),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: size.width*0.03),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Great Jones",style: GoogleFonts.cabin(color: Colors.grey[700],fontWeight: FontWeight.w500),),
                              SizedBox(
                                height: size.height*0.004,
                              ),
                              Text("Lotion",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: size.width*0.04),)
                              ,      SizedBox(
                                height: size.height*0.01,
                              ),
                              Text("\$155.00",style: TextStyle(color: Colors.black.withOpacity(0.9),fontWeight: FontWeight.w700,fontSize: size.width*0.033),)

                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),

            /// Health is Wealth
            Container(
              margin: EdgeInsets.only(left: size.width*0.04,bottom: size.height*0.02),
              alignment: Alignment.centerLeft,
              child: Text("Health is Wealth",style: TextStyle(fontSize: size.width*0.044,fontWeight: FontWeight.w900),),
            ),

            /// Slider
            Container(
              width: size.width,
              height: size.height*0.4,
              color: Colors.white,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_,index){
                  return    Container(
                    margin: EdgeInsets.all(size.width*0.02),
                    width: size.width*0.4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: size.height*0.2,
                          width: size.width*0.4,
                          child: Image.asset("images/weight.png"),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: size.width*0.03),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Great Jones",style: GoogleFonts.cabin(color: Colors.grey[700],fontWeight: FontWeight.w500),),
                              SizedBox(
                                height: size.height*0.004,
                              ),
                              Text("Classing 1lb Wights",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: size.width*0.04),)
                              ,      SizedBox(
                                height: size.height*0.01,
                              ),
                              Text("\$129.00",style: TextStyle(color: Colors.black.withOpacity(0.9),fontWeight: FontWeight.w700,fontSize: size.width*0.033),)

                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),

            /// Cozy at Home
            Container(
              margin: EdgeInsets.only(left: size.width*0.04,bottom: size.height*0.02),
              alignment: Alignment.centerLeft,
              child: Text("Cozy at Home",style: TextStyle(fontSize: size.width*0.044,fontWeight: FontWeight.w900),),
            ),

            /// Slider
            Container(
              width: size.width,
              height: size.height*0.4,
              color: Colors.white,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_,index){
                  return    Container(
                    margin: EdgeInsets.all(size.width*0.02),
                    width: size.width*0.4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: size.height*0.2,
                          width: size.width*0.4,
                          child: Image.asset("images/napper.png"),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: size.width*0.03),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Great Jones",style: GoogleFonts.cabin(color: Colors.grey[700],fontWeight: FontWeight.w500),),
                              SizedBox(
                                height: size.height*0.004,
                              ),
                              Text("Cotton Napper",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: size.width*0.04),)
                              ,      SizedBox(
                                height: size.height*0.01,
                              ),
                              Text("\$129.00",style: TextStyle(color: Colors.black.withOpacity(0.9),fontWeight: FontWeight.w700,fontSize: size.width*0.033),)

                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),

            /// For Her, Him, Them
            Container(
              margin: EdgeInsets.only(left: size.width*0.04,bottom: size.height*0.02),
              alignment: Alignment.centerLeft,
              child: Text("For Her, Him, Them",style: TextStyle(fontSize: size.width*0.044,fontWeight: FontWeight.w900),),
            ),

            /// Slider
            Container(
              width: size.width,
              height: size.height*0.4,
              color: Colors.white,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_,index){
                  return    Container(
                    margin: EdgeInsets.all(size.width*0.02),
                    width: size.width*0.4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: size.height*0.2,
                          width: size.width*0.4,
                          child: Image.asset("images/lagging.png"),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: size.width*0.03),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Great Jones",style: GoogleFonts.cabin(color: Colors.grey[700],fontWeight: FontWeight.w500),),
                              SizedBox(
                                height: size.height*0.004,
                              ),
                              Text("High-waist Airbrush\nLegging",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: size.width*0.04),)
                              ,      SizedBox(
                                height: size.height*0.01,
                              ),
                              Text("\$129.00",style: TextStyle(color: Colors.black.withOpacity(0.9),fontWeight: FontWeight.w700,fontSize: size.width*0.033),)

                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),

            ///Browse by brand
            Container(
              margin: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04),
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Browse by Brand",style: TextStyle(fontSize: size.width*0.044,fontWeight: FontWeight.w900),),
                  GestureDetector(
                    onTap: (){
                      screenPush(context, AllBrands());
                    },
                    child: Row(children: [
                      Text("SEE ALL",style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.w500),),
                      Icon(Icons.arrow_forward_ios,size:  size.width*0.03,color: Colors.grey[600],)
                    ],),
                  )
                ],),
            ),

            /// slider
            Container(
              margin: EdgeInsets.only(top: size.height*0.03),
              width: size.width,
              height: size.height*0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: brandTitle.length,
                itemBuilder: (_,index){
                  String color = "0xffcecccf";
                  return       Container(
                    padding: EdgeInsets.all(size.width*0.01),
                    margin: EdgeInsets.only(right: size.width*0.03,left: size.width*0.01),
                    alignment: Alignment.center,
                    width: size.width*0.26,
                    height: size.width*0.26,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(int.parse(color)).withOpacity(0.1),
                      image: DecorationImage(
                          scale: 5,
                          image: AssetImage(
                            "images/${brandImages[index]}",
                          )
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text("${brandTitle[index]}",style: GoogleFonts.cabin(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.8,
                          fontSize: size.width*0.03
                      ),),
                      width: size.width*0.26,
                      height: size.width*0.26,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                    ),
                  );
                },
              ),
            ),

            ///Fiteness
            Container(
              margin: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.02),
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Fitness",style: TextStyle(fontSize: size.width*0.044,fontWeight: FontWeight.w900),),
                  Row(children: [
                    Text("SEE ALL",style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.w500),),
                    Icon(Icons.arrow_forward_ios,size:  size.width*0.03,color: Colors.grey[600],)
                  ],)
                ],),
            ),

            /// Slider
            Container(
              margin: EdgeInsets.only(top: size.height*0.02),
              width: size.width,
              height: size.height*0.4,
              color: Colors.white,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_,index){
                  return    Container(
                    margin: EdgeInsets.all(size.width*0.02),
                    width: size.width*0.4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: size.height*0.2,
                          width: size.width*0.4,
                          child: Image.asset("images/yoga.png"),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: size.width*0.03),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Great Jones",style: GoogleFonts.cabin(color: Colors.grey[700],fontWeight: FontWeight.w500),),
                              SizedBox(
                                height: size.height*0.004,
                              ),
                              Text("Uplifting Yoga Block",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: size.width*0.04),)
                              ,      SizedBox(
                                height: size.height*0.01,
                              ),
                              Text("\$120.00",style: TextStyle(color: Colors.black.withOpacity(0.9),fontWeight: FontWeight.w700,fontSize: size.width*0.033),)

                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),


            ///Electronics
            Container(
              margin: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04,top: size.height*0.02),
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Electronics",style: TextStyle(fontSize: size.width*0.044,fontWeight: FontWeight.w900),),
                  Row(children: [
                    Text("SEE ALL",style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.w500),),
                    Icon(Icons.arrow_forward_ios,size:  size.width*0.03,color: Colors.grey[600],)
                  ],)
                ],),
            ),

            /// Slider
            Container(
              margin: EdgeInsets.only(top: size.height*0.02),
              width: size.width,
              height: size.height*0.4,
              color: Colors.white,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_,index){
                  return    Container(
                    margin: EdgeInsets.all(size.width*0.02),
                    width: size.width*0.4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(size.width*0.02),
                          height: size.height*0.2,
                          width: size.width*0.4,
                          child: Image.asset("images/headphone.png",),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: size.width*0.03),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Great Jones",style: GoogleFonts.cabin(color: Colors.grey[700],fontWeight: FontWeight.w500),),
                              SizedBox(
                                height: size.height*0.004,
                              ),
                              Text("Uplifting Yoga Block",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: size.width*0.04),)
                              ,      SizedBox(
                                height: size.height*0.01,
                              ),
                              Text("\$120.00",style: TextStyle(color: Colors.black.withOpacity(0.9),fontWeight: FontWeight.w700,fontSize: size.width*0.033),)

                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    ));
  }
}

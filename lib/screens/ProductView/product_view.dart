import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spree/screens/OrderProvider/order_provider.dart';
import 'package:toast/toast.dart';

class ProductView extends StatefulWidget {
  final image;
  final price;
  final title;
  final brand;
  final desc;
  const ProductView(
      {Key key, this.image, this.price, this.title, this.brand, this.desc})
      : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  int _pictureIndex = 0;
  String selectedColor;

  bool colorIsVisible;
  int quantity = 1;
  @override
  void initState() {
    super.initState();
    colorIsVisible = false;
  }

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
              width: size.width,
              height: size.height * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: size.height * 0.45,
                    child: Carousel(
                      autoplay: false,
                      boxFit: BoxFit.scaleDown,
                      images: [
                        Image.asset(
                          "images/${widget.image}",
                          fit: BoxFit.scaleDown,
                          scale: 5,
                        ),
                        Image.asset(
                          "images/${widget.image}",
                          scale: 5,
                        ),
                        Image.asset(
                          "images/${widget.image}",
                          scale: 5,
                        ),
                        Image.asset(
                          "images/${widget.image}",
                          scale: 5,
                        )
                      ],
                      dotColor: Colors.white,
                      dotBgColor: Colors.white,
                      autoplayDuration: Duration(seconds: 10),
                      onImageChange: (pre, curr) {
                        _pictureIndex = curr;
                        setState(() {});
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: size.width * 0.03),
                    height: 4,
                    width: size.width * 0.6,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (_, index) {
                        return Container(
                          width: size.width * 0.07,
                          height: 2,
                          color: _pictureIndex == index
                              ? Colors.black
                              : Colors.grey[400],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                alignment: Alignment.topLeft,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.brand}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: size.width * 0.04,
                          color: Colors.grey[600]),
                    ),
                    SizedBox(
                      height: size.height * 0.005,
                    ),
                    Text(
                      "${widget.title}",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: size.width * 0.08,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(
                      "\$${widget.price}",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: size.width * 0.05,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      "${widget.desc}",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: size.width * 0.045,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.02),
                      height: 1,
                      width: size.width,
                      color: Colors.grey[400],
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.only(top: size.height * 0.016),
                                  child: Text(
                                    "Color",
                                    style: TextStyle(
                                        fontSize: size.width * 0.044,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.black),
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: size.height * 0.016),
                                      child: Text(
                                        "Blush",
                                        style: TextStyle(
                                            fontSize: size.width * 0.04,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      ),
                                      height: size.height * 0.04,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: size.height * 0.02,
                                          left: size.width * 0.01),
                                      width: size.width * 0.04,
                                      height: size.width * 0.04,
                                      decoration: BoxDecoration(
                                          color: selectedColor == null
                                              ? Colors.grey
                                              : Color(int.parse(selectedColor)),
                                          shape: BoxShape.circle),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          colorIsVisible = !colorIsVisible;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: size.height * 0.02),
                                        child: Icon(
                                          colorIsVisible
                                              ? Icons.keyboard_arrow_up
                                              : Icons.keyboard_arrow_down_sharp,
                                          color: Colors.black,
                                          size: size.width * 0.06,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Visibility(
                              visible: colorIsVisible,
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: size.height * 0.024,
                                    left: size.width * 0.02,
                                    bottom: size.height * 0.02),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedColor = "0xFFdbe1e4";
                                        });
                                      },
                                      child: Container(
                                        width: size.width * 0.1,
                                        height: size.width * 0.1,
                                        margin: EdgeInsets.only(
                                            right: size.height * 0.02,
                                            left: size.width * 0.02),
                                        decoration: BoxDecoration(
                                            color: Color(0xFFdbe1e4),
                                            shape: BoxShape.circle,
                                            border:
                                                selectedColor == "0xFFdbe1e4"
                                                    ? Border(
                                                        bottom: BorderSide(
                                                            color: Colors.black,
                                                            width: 3),
                                                        left: BorderSide(
                                                            color: Colors.black,
                                                            width: 3),
                                                        top: BorderSide(
                                                            color: Colors.black,
                                                            width: 3),
                                                        right: BorderSide(
                                                            color: Colors.black,
                                                            width: 3),
                                                      )
                                                    : Border()),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedColor = "0xFF929aa6";
                                        });
                                      },
                                      child: Container(
                                        width: size.width * 0.1,
                                        height: size.width * 0.1,
                                        margin: EdgeInsets.only(
                                            right: size.height * 0.02,
                                            left: size.width * 0.02),
                                        decoration: BoxDecoration(
                                            color: Color(0xFF929aa6),
                                            shape: BoxShape.circle,
                                            border:
                                                selectedColor == "0xFF929aa6"
                                                    ? Border(
                                                        bottom: BorderSide(
                                                            color: Colors.black,
                                                            width: 3),
                                                        left: BorderSide(
                                                            color: Colors.black,
                                                            width: 3),
                                                        top: BorderSide(
                                                            color: Colors.black,
                                                            width: 3),
                                                        right: BorderSide(
                                                            color: Colors.black,
                                                            width: 3),
                                                      )
                                                    : Border()),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedColor = "0xfff5ebdf";
                                        });
                                      },
                                      child: Container(
                                        width: size.width * 0.1,
                                        height: size.width * 0.1,
                                        margin: EdgeInsets.only(
                                            right: size.height * 0.02,
                                            left: size.width * 0.02),
                                        decoration: BoxDecoration(
                                            color: Color(0xfff5ebdf),
                                            shape: BoxShape.circle,
                                            border:
                                                selectedColor == "0xfff5ebdf"
                                                    ? Border(
                                                        bottom: BorderSide(
                                                            color: Colors.black,
                                                            width: 3),
                                                        left: BorderSide(
                                                            color: Colors.black,
                                                            width: 3),
                                                        top: BorderSide(
                                                            color: Colors.black,
                                                            width: 3),
                                                        right: BorderSide(
                                                            color: Colors.black,
                                                            width: 3),
                                                      )
                                                    : Border()),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedColor = "0xff474547";
                                        });
                                      },
                                      child: Container(
                                        width: size.width * 0.1,
                                        height: size.width * 0.1,
                                        margin: EdgeInsets.only(
                                            right: size.height * 0.02,
                                            left: size.width * 0.02),
                                        decoration: BoxDecoration(
                                            color: Color(0xff474547),
                                            shape: BoxShape.circle,
                                            border:
                                                selectedColor == "0xff474547"
                                                    ? Border(
                                                        bottom: BorderSide(
                                                            color: Colors.black,
                                                            width: 3),
                                                        left: BorderSide(
                                                            color: Colors.black,
                                                            width: 3),
                                                        top: BorderSide(
                                                            color: Colors.black,
                                                            width: 3),
                                                        right: BorderSide(
                                                            color: Colors.black,
                                                            width: 3),
                                                      )
                                                    : Border()),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedColor = "0xFFf7d1c5";
                                        });
                                      },
                                      child: Container(
                                        width: size.width * 0.1,
                                        height: size.width * 0.1,
                                        margin: EdgeInsets.only(
                                            right: size.height * 0.02,
                                            left: size.width * 0.02),
                                        decoration: BoxDecoration(
                                            color: Color(0xFFf7d1c5),
                                            shape: BoxShape.circle,
                                            border:
                                                selectedColor == "0xFFf7d1c5"
                                                    ? Border(
                                                        bottom: BorderSide(
                                                            color: Colors.black,
                                                            width: 3),
                                                        left: BorderSide(
                                                            color: Colors.black,
                                                            width: 3),
                                                        top: BorderSide(
                                                            color: Colors.black,
                                                            width: 3),
                                                        right: BorderSide(
                                                            color: Colors.black,
                                                            width: 3),
                                                      )
                                                    : Border()),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.only(
                          top: size.height * 0.02, bottom: size.height * 0.02),
                      height: 1,
                      width: size.width,
                      color: Colors.grey[400],
                    ),
                  ],
                ))
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        height: size.height * 0.14,
        width: size.width,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              height: size.height * 0.09,
              width: size.width * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        if (quantity > 0) {
                          setState(() {
                            quantity = quantity - 1;
                          });
                        }
                      },
                      child: Icon(Icons.remove)),
                  Text(
                    "$quantity",
                    style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          quantity = quantity + 1;
                        });
                      },
                      child: Icon(Icons.add)),
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.width * 0.01),
                  border: Border(
                      right: BorderSide(
                        width: 0.4,
                        color: Colors.black,
                      ),
                      top: BorderSide(
                        width: 0.4,
                        color: Colors.black,
                      ),
                      left: BorderSide(
                        width: 0.4,
                        color: Colors.black,
                      ),
                      bottom: BorderSide(
                        width: 0.4,
                        color: Colors.black,
                      ))),
            ),
            GestureDetector(
              onTap: () {
                Toast.show("Added to Cart", context,
                    duration: Toast.LENGTH_SHORT,
                    gravity: Toast.BOTTOM,
                    backgroundColor: Colors.blue,
                    textColor: Colors.white);
                addToBagList(brand: widget.brand,name: widget.title,buildContext: context,pic: widget.image,price: widget.price,quantity: quantity);
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(left: size.width * 0.03),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                height: size.height * 0.09,
                width: size.width * 0.55,
                child: Text(
                  "Add To Cart",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                decoration: BoxDecoration(
                    color: Color(0xff2a4ff2),
                    borderRadius: BorderRadius.circular(size.width * 0.01)),
              ),
            )
          ],
        ),
      ),
    ));
  }

  addToBagList({double price,String pic,int quantity,String brand, String name,BuildContext buildContext}){
    List localList =     Provider.of<OrderProvider>(context,listen: false).getList();
    Map<String,dynamic> oderMap ={
      "name":"$name",
      "quantity":"$quantity",
      "brand":"$brand",
      "image":"$pic",
      "price":"$price"
    };

   localList.add(oderMap);

    Provider.of<OrderProvider>(context,listen: false).setBagList(bagList: localList);

  }


}

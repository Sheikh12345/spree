import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:spree/providers/order_provider.dart';
import 'package:spree/providers/profile_provider.dart';

import 'componenet/delivery_time_sheet.dart';
import 'componenet/select_your_address.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

bool isScrollControlled = false;

class _CartScreenState extends State<CartScreen> {
  double totalPrice = 0.0;

  @override
  void initState() {
    isScrollControlled = false;
    btnIsVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Consumer<OrderProvider>(
        builder: (_, order, child) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              "Shopping Cart",
              style: GoogleFonts.roboto(
                  fontSize: size.width * 0.08,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            toolbarHeight: size.height * 0.14,
          ),
          body: order.getList().length <= 0
              ? Container(
                  width: size.width,
                  height: size.height * 0.5,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: size.width,
                        margin: EdgeInsets.only(
                          top: size.height * 0.3,
                        ),
                        child: Text(
                          "Your Cart is Empty",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: size.width * 0.06),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: size.width * 0.7,
                        margin: EdgeInsets.only(top: size.height * 0.02),
                        child: Text(
                          "When you add products to your order they'll show up here.",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: size.width * 0.05,
                              height: 1.3),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                )
              : Container(
                  width: size.width,
                  height: size.height * 0.8,
                  child: ListView.builder(
                      itemCount: order.getList().length,
                      itemBuilder: (_, index) {
                        totalPrice =
                            double.parse(order.getList()[index]["price"]) +
                                totalPrice;
                        return Container(
                          width: size.width,
                          margin: EdgeInsets.symmetric(
                              horizontal: size.width * 0.04,
                              vertical: size.width * 0.01),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: size.width * 0.3,
                                    height: size.width * 0.3,
                                    child: Image.asset(
                                        "images/${order.getList()[index]["image"]}"),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      Text(
                                        " ${order.getList()[index]["brand"]}",
                                        style: GoogleFonts.roboto(
                                            color: Colors.grey[700],
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.width * 0.029,
                                            letterSpacing: 0.6),
                                      ),
                                      SizedBox(
                                        height: size.height*0.01,
                                      ),
                                      Text(
                                        " ${order.getList()[index]["name"]}",
                                        style: GoogleFonts.roboto(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: size.width * 0.045),
                                      ),
                                      SizedBox(
                                        height: size.height*0.014,
                                      ),
                                      Text(
                                        "\$${order.getList()[index]["price"]}",
                                        style: GoogleFonts.meeraInimai(
                                          color: Colors.black.withOpacity(0.9),
                                          fontWeight: FontWeight.w700,
                                          fontSize: size.width * 0.033),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                padding:
                                    EdgeInsets.only(bottom: size.height * 0.03),
                                child: Text(
                                  "QTY ${order.getList()[index]["quantity"]}",
                                  style: GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: size.width * 0.04),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
          bottomNavigationBar: order.getList().length <= 0
              ? Container(
                  height: size.height * 0.22,
                  width: size.width,
                )
              : Container(
                  height: size.height * 0.31,
                  width: size.width,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: size.height * 0.02,
                            bottom: size.height * 0.02),
                        height: 1,
                        width: size.width,
                        color: Colors.grey[400],
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: size.width * 0.03),
                        width: size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Apply a Promo Code",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w700,
                                  fontSize: size.width * 0.04),
                            ),
                            Container(
                                padding:
                                    EdgeInsets.only(right: size.width * 0.03),
                                child: Icon(Icons.keyboard_arrow_down_outlined))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: size.height * 0.02,
                            bottom: size.height * 0.02),
                        height: 1,
                        width: size.width,
                        color: Colors.grey[400],
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: size.width * 0.03),
                        width: size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subtotal",
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w700,
                                  fontSize: size.width * 0.055),
                            ),
                            Container(
                                height: size.height * 0.05,
                                padding: EdgeInsets.only(
                                    top: size.height * 0.015,
                                    right: size.width * 0.03),
                                child: Text(
                                  "\$$totalPrice + Taxes & Fees",
                                  style: GoogleFonts.roboto(
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w500),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: size.height * 0.02,
                            bottom: size.height * 0.02),
                        height: 1,
                        width: size.width,
                        color: Colors.grey[400],
                      ),
                      InkWell(
                        onTap: () {
                          settingModalBottomSheetTime(context);
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: size.width * 0.05,
                              vertical: size.height * 0.005),
                          height: size.height * 0.08,
                          width: size.width,
                          alignment: Alignment.center,
                          child: Text(
                            "Choose Delivery Window",
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: size.width * 0.05,
                                fontWeight: FontWeight.w600),
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xff2a4ff2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

settingModalBottomSheetTime(context) {
  showModalBottomSheet(
      isScrollControlled: isScrollControlled,
      context: context,
      builder: (BuildContext buildContext) {
        return DeliveryTimeBottomSheet();
      });
}

settingModalBottomSheetAddress(context) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext buildContext) {
        return SelectAddress();
      });
}

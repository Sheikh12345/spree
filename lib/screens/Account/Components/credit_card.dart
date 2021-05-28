import 'dart:convert';

import 'package:credit_card/credit_card_form.dart';
import 'package:credit_card/credit_card_model.dart';
import 'package:credit_card/credit_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spree/Models/profile_model.dart';
import 'package:spree/Services/ApiCalls/auth-calls.dart';
import 'package:spree/providers/profile_provider.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:toast/toast.dart';

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<dynamic> cards = [];
  @override
  void initState() {
    super.initState();
    StripePayment.setOptions(
      StripeOptions(
          publishableKey:
              "pk_test_51HAVtEHT5fE06PMkM5d8mhS4fppSU8RcU3NPdtCeXRBXTMWRYeWua4ea9bM0mnsTLYQcCCs9Kyy08EdWl78viinl00cQt1howv",
          merchantId: "test",
          androidPayMode: 'test'),
    );
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
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(icon: Icon(Icons.credit_card), onPressed: ()async{
            print("call");
            CallApi().getItemsToCart(context: context).then((value){
            });
          })
        ],
        title: Text(
          "Add Card",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: CreditCardWidget(
                cardBgColor: Colors.black,
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                textStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                animationDuration: Duration(milliseconds: 1000),
                // width: size.width*0.8,
                // height: size.height*0.25,
                //true when you want to show cvv(back) view
              ),
            ),
            CreditCardForm(
              key: formKey,
              themeColor: Colors.blue,
              onCreditCardModelChange: (CreditCardModel data) {
                setState(() {
                  isCvvFocused = data.isCvvFocused;
                  expiryDate = data.expiryDate;
                  cvvCode = data.cvvCode;
                  cardHolderName = data.cardHolderName;
                  cardNumber = data.cardNumber;
                });
              },
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                primary: Colors.blue,
              ),
              child: Container(
                height: size.height * 0.04,
                alignment: Alignment.center,
                width: size.width * 0.6,
                margin: const EdgeInsets.all(8),
                child: Text('ADD CARD',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        fontSize: size.width * 0.04)),
              ),
              onPressed: () {
                if (cardNumber.length > 15 &&
                    expiryDate.length > 4 &&
                    cardHolderName.length > 1 &&
                    cvvCode.length > 2) {
                  final CreditCard testCard = CreditCard(
                    number: '$cardNumber',
                    expMonth: int.parse(expiryDate.split('/').first),
                    expYear: int.parse(expiryDate.split('/').last),
                    cvc: '$cvvCode',
                    name: '$cardHolderName',
                    currency: 'usd',
                  );

                  StripePayment.createTokenWithCard(
                    testCard,
                  ).then((token) {
                    final snackBar =
                        SnackBar(content: Text('Received ${token.tokenId}'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    print(token.tokenId);
                  }).catchError((error) {
                    print(error);
                  });
                } else {
                  Toast.show(
                    "Invalid card",
                    context,
                    gravity: 1,
                  );
                }
              },
            )
          ],
        ),
      ),
    ),
   );
  }
}

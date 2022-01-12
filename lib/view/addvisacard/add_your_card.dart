import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/view/components/components.dart';


class AddYourCard extends StatefulWidget {
  @override
  _AddYourCardState createState() => _AddYourCardState();
}

class _AddYourCardState extends State<AddYourCard> {
  String cardNumber1 = '';
  String cardNumber2 = '';
  String cardNumber3 = '';
  String cardNumber4 = '';
  String cardHolderName = '';
  String expiryDate = '';
  String cvv = '';
  bool showBack = false;

  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus ? showBack = true : showBack = false;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              height: 84.0,
              color: Color(0xff69A03A),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Add Your Card",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                            fontFamily: "Poppins"),
                      ),
                    ],
                  ),
                ),
              )),
          SizedBox(
            height: 30,
          ),
          CreditCard(
            cardNumber: cardNumber1 + cardNumber2 + cardNumber3 + cardNumber4,
            cardExpiry: expiryDate,
            cardHolderName: cardHolderName,
            cvv: cvv,
            bankName: 'National Bank',
            showBackSide: showBack,
            frontBackground: CardBackgrounds.black,
            backBackground: CardBackgrounds.white,
            showShadow: true,
            frontTextColor: Colors.yellow,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Cardholder Name",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textFormFiledVisa(
                      containerWidth: double.infinity,
                      onChangeFun: (value) {
                        setState(() {
                          cardHolderName = 'Mr.'+value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Card Number",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: textFormFiledVisa(
                            containerWidth: 50,
                            onChangeFun: (value) {
                              setState(() {
                                cardNumber1 = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: textFormFiledVisa(
                            containerWidth: 50,
                            onChangeFun: (value) {
                              setState(() {
                                cardNumber2 = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: textFormFiledVisa(
                            containerWidth: 50,
                            onChangeFun: (value) {
                              setState(() {
                                cardNumber3 = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: textFormFiledVisa(
                            containerWidth: 50,
                            onChangeFun: (value) {
                              setState(() {
                                cardNumber4 = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Valid Thru",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    textFormFiledVisa(
                      containerWidth: double.infinity,
                      onChangeFun: (value) {
                        setState(() {
                          expiryDate = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "CVV/CVC",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        textFormFiledVisa(
                          containerWidth: 100,
                          focusnode: _focusNode,
                          onChangeFun: (value) {
                            setState(() {
                              cvv = value;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "3 or 4 digit code",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                    customIntroductionButton(
                        widthbutton: double.infinity,
                        heightbutton: 52,
                        functionOnPressed: () {},
                        text: "ADD CARD NUMBER "),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

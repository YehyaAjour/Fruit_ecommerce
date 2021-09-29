import 'package:flutter/material.dart';

class FoodDetailsScreen extends StatefulWidget {
  //test
  String imgurl;
  String foodName;
  String foodDescription;

  FoodDetailsScreen({this.imgurl, this.foodName, this.foodDescription});

  @override
  _FoodDetailsScreenState createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(widget.foodName),
      ),
    );
  }
}

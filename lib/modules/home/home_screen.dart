import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/shared/components/components.dart';
import 'package:fruit_ecommerce/shared/cubit/cubit.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 1;
  bool isred = false;
  bool isSelected;
  List<String> imgOrganicFruit = ['assets/images/strawbary1.png','assets/images/grapez1.png','assets/images/orang1.png','assets/images/multifruitPack2.png','assets/images/paperFruitPack.png','assets/images/tropicana2.png'];
  List<String> imgMixed = ['assets/images/multifruitPack2.png','assets/images/paperFruitPack.png','assets/images/tropicana2.png','assets/images/strawbary1.png','assets/images/grapez1.png','assets/images/orang1.png'];
  List<String> imgStone = ['assets/images/nectarines3.png','assets/images/apricots3.png','assets/images/piaches.png','assets/images/melon4.png','assets/images/melon5.png','assets/images/qarnapet4.png'];
  List<String> imgMelons = ['assets/images/melon4.png','assets/images/melon5.png','assets/images/qarnapet4.png',];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150.0,
          child: Stack(
            children: <Widget>[
              Container(
                color: Color(0xff69A03A),
                width: MediaQuery.of(context).size.width,
                height: 100.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Fruit Market",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins"),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.brightness_4_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            AppCubit.get(context).changeTheme();
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 80.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1.0, 10.2),
                            blurRadius: 5.2,
                          )
                        ],
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintText: "Search",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff69A03A),
                            ),
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
                child: Container(
                  height: 30,
                  width: 120,
                  decoration: BoxDecoration(
                    color: index == 1 ? Color(0xffCC7D00) : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Vegetables',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18,
                        color: index == 1 ? Colors.white : Color(0xff989898),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 2;
                  });
                },
                child: Container(
                  height: 30,
                  width: 120,
                  decoration: BoxDecoration(
                    color: index == 2 ? Color(0xffCC7D00) : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Fruits',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18,
                        color: index == 2 ? Colors.white : Color(0xff989898),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 3;
                  });
                },
                child: Container(
                  height: 30,
                  width: 120,
                  decoration: BoxDecoration(
                    color: index == 3 ? Color(0xffCC7D00) : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Dry Fruits',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18,
                        color: index == 3 ? Colors.white : Color(0xff989898),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                fruitTitle(context),
                Container(
                  height: 250,
                  child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          buildItem(context: context, num: index, imagesList: imgOrganicFruit),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 10,
                          ),
                      itemCount: imgOrganicFruit.length),
                ),

                fruitTitle(context),
                Container(
                  height: 250,
                  child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          buildItem(context: context, num: index, imagesList: imgMixed),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 10,
                          ),
                      itemCount: imgMixed.length),
                ),
                fruitTitle(context),
                Container(
                  height: 250,

                  child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => buildItem(
                          context: context, num: index, imagesList: imgStone,
                          functionFavourite: () {
                            setState(() {
                              isred = !isred;
                            });
                          },
                          iconColor: isred ? Colors.red : Colors.grey),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 10,
                          ),
                      itemCount: imgStone.length),
                ),
                fruitTitle(context),
                Container(
                  height: 250,
                  child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          buildItem(context: context, num: index, imagesList: imgMelons),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 10,
                          ),
                      itemCount: imgMelons.length),
                ),




              ],
            ),
          ),
        ),
      ],
    );
  }
}

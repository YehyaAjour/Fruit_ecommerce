import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';


Widget defaultTextFormField({
  @required TextEditingController controller,
  @required TextInputType keyboardType,
  @required Function validate,
  @required String labelText,
  @required IconData prefix,
  IconData suffix,
  bool isPassword = false,
  Function suffixPressed,
}) {
  return SizedBox(
    height: 70,
    child: TextFormField(
      validator: validate,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Color(0xff69A03A)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff69A03A),
          ),
        ),
        prefixIcon: Icon(
          prefix,
          color: Color(0xff69A03A),
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                  color: Color(0xff69A03A),
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    ),
  );
}

Widget customIntroductionButton({
  @required Function functionOnPressed,
  @required String text,
  @required double widthbutton,
  @required double heightbutton,
}) {
  return Column(
    children: [
      SizedBox(
        height: 30,
      ),
      SizedBox(
        width: widthbutton,
        height: heightbutton,
        child: ElevatedButton(
          onPressed: functionOnPressed,
          style: ElevatedButton.styleFrom(primary: Color(0xff69A03A)),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
      ),
    ],
  );
}

Widget defaultButton({@required function, @required String title}) {
  return Container(
    height: 50,
    width: double.infinity,
    child: ElevatedButton(
      onPressed: function,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Color(0xff69A03A),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ))),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    ),
  );
}

Widget buildItem({
  @required BuildContext context,
  Function functionFavourite,
  Color iconColor,
  @required List<String> imagesList,
  @required int num,

}) {
  return Container(
    decoration: BoxDecoration(
        //color: Colors.green,
        ),
    height: 210,
    width: 130,
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            // color: Colors.blue,
            borderRadius: BorderRadius.circular(20),

          ),
          height: 143,
          width: 118,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
           Image.asset(imagesList[num],),

              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, right: 5),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: iconColor,
                        ),
                        onPressed: functionFavourite,
                      ),
                    ),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            width: 118,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RatingBar.builder(
                  initialRating: 4,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemSize: 15,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                Text(
                  "Strawberry",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  "300 Per/ kg",
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget fruitTitle(context) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text(
              "AppCubit.get(context).vegetables[index].fruit_type",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "(20% Off)",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xff4CA300)),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 3,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text("Pick up from organic farms", style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}

Widget myAccountItem(
    {@required BuildContext context,
    @required String labelName,
    @required IconData iconData,
    Function function}) {
  return GestureDetector(
    onTap: function,
    child: Container(
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(
          width: 1.0,
          color: Colors.grey[350],
        ),
      )),
      width: double.infinity,
      height: 75,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Icon(
              iconData,
              color: Color(0xff69A03A),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              labelName,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget textFormFiledVisa(
    {@required double containerWidth,
    @required Function onChangeFun,
    FocusNode focusnode}) {
  return Container(
    width: containerWidth,
    height: 45,
    child: TextFormField(
      style: TextStyle(
        color: Colors.black,
        fontSize: 15,
      ),
      decoration: InputDecoration(
          enabledBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide:  BorderSide(color: Colors.black ),

          ),
          focusedBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide:  BorderSide(color: Color(0xff69A03A) ),

          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(7),),
          counterText: ""),
      onChanged: onChangeFun,
      focusNode: focusnode != null ? focusnode : null,
     // maxLength: 10,
    ),
  );
}

void showToast({
  @required String message,
  @required ToastState state,
}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastState { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.SUCCESS:
      color = Colors.green;
      break;
    case ToastState.ERROR:
      color = Colors.red;
      break;
    case ToastState.WARNING:
      color = Colors.amber;
  }
  return color;
}

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );

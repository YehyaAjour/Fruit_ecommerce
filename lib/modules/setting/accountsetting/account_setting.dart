import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/shared/components/components.dart';

class AccountSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Account Setting",
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
          myAccountItem(
              context: context,
              labelName: "Security",
              iconData: Icons.security),
          myAccountItem(
              context: context,
              labelName: "Deactivate Account",
              iconData: Icons.backspace),
          myAccountItem(
              context: context,
              labelName: "Delete Account",
              iconData: Icons.delete),
        ],
      ),
    );
  }
}

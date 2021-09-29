import 'package:flutter/material.dart';
import 'package:fruit_ecommerce/modules/setting/accountsetting/account_setting.dart';
import 'package:fruit_ecommerce/shared/components/components.dart';


class SettingScreen extends StatelessWidget {
  const SettingScreen({Key key}) : super(key: key);

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
                        "Setting",
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
              labelName: "Account",
              iconData: Icons.account_circle,
              function: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AccountSetting()));
              }),
          myAccountItem(
              context: context,
              labelName: "Notification",
              iconData: Icons.notifications),
          myAccountItem(
              context: context,
              labelName: "Language",
              iconData: Icons.language),
          myAccountItem(
              context: context,
              labelName: "Change Location",
              iconData: Icons.edit_location),
        ],
      ),
    );
  }
}

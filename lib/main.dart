

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_ecommerce/googlemap/google_map.dart';
import 'package:fruit_ecommerce/layout/market_Screen.dart';
import 'package:fruit_ecommerce/modules/addvisacard/add_your_card.dart';
import 'package:fruit_ecommerce/modules/introduction/introductionscreen/intro_Screen.dart';
import 'package:fruit_ecommerce/modules/introduction/splashscreen/Splash_Screen.dart';
import 'package:fruit_ecommerce/modules/login/login_screen.dart';
import 'package:fruit_ecommerce/shared/bloc_observer.dart';
import 'package:fruit_ecommerce/shared/cubit/cubit.dart';
import 'package:fruit_ecommerce/shared/cubit/states.dart';
import 'package:fruit_ecommerce/shared/network/local/cache_helper.dart';
import 'package:fruit_ecommerce/style/theme_data.dart';
import 'package:introduction_screen/introduction_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  Bloc.observer = MyBlocObserver();

  await CacheHelper.init();

  bool isDark = CacheHelper.getData(key: "isDark");

  Widget widget;

  var uId = CacheHelper.getData(key: "uId");

  if (uId != null) {
    widget = MarketScreen();
  } else {
    widget = SplashScreen();
  }

  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final bool isDark;
  final Widget startWidget;

  MyApp({this.isDark, this.startWidget});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..changeTheme(fromShared: isDark)..getVegetables(),
      child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(

              darkTheme: darkTheme(),
              theme: lightTheme(),
              themeMode: AppCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              home: AddYourCard(),
            );
          }),
    );
  }
}
//test

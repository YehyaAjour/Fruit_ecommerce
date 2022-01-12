import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fruit_ecommerce/view_model/AppCupit/cubit.dart';
import 'package:fruit_ecommerce/view_model/AppStates/states.dart';



class MarketScreen extends StatelessWidget {
  int x;

  MarketScreen({this.x});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (BuildContext context, AppState state) {},
      builder: (BuildContext context, AppState state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          body: cubit.screens[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: cubit.currentindex,
            onTap: (value) {
              cubit.changeIndex(value);
            },
            items: cubit.bottomItems,
            selectedItemColor: Color(0xff69A03A),
          ),
        );
      },
    );
  }
}

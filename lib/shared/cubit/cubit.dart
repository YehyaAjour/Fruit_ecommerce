import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_ecommerce/model/user_model.dart';
import 'package:fruit_ecommerce/modules/favourite/favourites_screen.dart';
import 'package:fruit_ecommerce/modules/home/home_screen.dart';
import 'package:fruit_ecommerce/modules/myaccount/my_account_screen.dart';
import 'package:fruit_ecommerce/modules/shoppingcart/shopping_cart_screen.dart';
import 'package:fruit_ecommerce/shared/cubit/states.dart';
import 'package:fruit_ecommerce/shared/network/local/cache_helper.dart';


class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  void userRegister(
      {@required String name,
      @required String email,
      @required String password,
      @required String phone}) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user.email);
      print(value.user.uid);
      userCreateAfterRegister(
          name: name, email: email, phone: phone, uId: value.user.uid);
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }

  void userCreateAfterRegister(
      {@required name, @required email, @required phone, @required uId}) {
    UserModel model =
        UserModel(name: name, email: email, phone: phone, uId: uId);

    FirebaseFirestore.instance
        .collection("user")
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(RegisterCreateUserSuccessState());
    }).catchError((error) {
      emit(RegisterCreateUserErrorState(error.toString()));
    });
  }

  void userLogin({@required email, @required password}) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user.email);
      print(value.user.uid);
      emit(LoginSuccessState(value.user.uid));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility;
  bool isPassword = true;
  int currentindex = 0;
  List<int> counter = List();
  List<Widget> screens = [
    HomeScreen(),
    ShoppingCartScreen(),
    FavouriteScreen(),
    MyAccountScreen(),
  ];
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
      ),
      label: 'HOME',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.shopping_cart,
      ),
      label: 'Shopping cart',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.favorite,
      ),
      label: 'Favourite',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.account_circle_rounded,
      ),
      label: 'My Account',
    ),
  ];

  void changeIndex(int index) {
    currentindex = index;
    emit(AppChangeBottomNavBarState());
  }

  incrementCounter(int i) {
    counter[i]++;
    emit(IncrementCounterState());
    // _event.add(counter[i]);
  }

  decrementCounter(int i) {
    if (counter[i] <= 0) {
      counter[i] = 0;
    } else {
      counter[i]--;
    }
    emit(DecrementCounterState());
    //  _event.add(counter[i]);
  }

  changePasswordVisability() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordVisibilityState());
  }

  bool isDark = false;

  void changeTheme({bool fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeThemeState());
    } else {
      isDark = !isDark;
      CacheHelper.putData(key: "isDark", value: isDark)
          .then((value) => emit(ChangeThemeState()));
    }
  }
}
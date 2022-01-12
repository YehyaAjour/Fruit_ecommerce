


import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_ecommerce/model/UserModel/user_model.dart';
import 'package:fruit_ecommerce/model/VegetablesModel/vegetables_model.dart';
import 'package:fruit_ecommerce/services/CacheHelper/cache_helper.dart';
import 'package:fruit_ecommerce/view/favourite/favourites_screen.dart';
import 'package:fruit_ecommerce/view/home/home_screen.dart';
import 'package:fruit_ecommerce/view/myaccount/my_account_screen.dart';
import 'package:fruit_ecommerce/view/shoppingcart/shopping_cart_screen.dart';
import 'package:fruit_ecommerce/view_model/AppStates/states.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  void userRegister({@required String name,
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
  List<String> imgOrganicFruit = [
    'assets/images/strawbary1.png',
    'assets/images/grapez1.png',
    'assets/images/orang1.png',
    'assets/images/multifruitPack2.png',
    'assets/images/paperFruitPack.png',
    'assets/images/tropicana2.png'
  ];
  List<VegetablesModel> vegetables = [];

  void getVegetables() {
    emit(GetVegetablesLoadingState());
    FirebaseFirestore.instance.collection('vegetables')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        vegetables.add(VegetablesModel.fromJson(element.data()));
      }
      );
      emit(GetVegetablesSuccessState());
        }
    ).catchError((e) {
      emit(GetVegetablesErrorState());
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

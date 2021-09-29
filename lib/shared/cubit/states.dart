abstract class AppState {}

class AppInitialState extends AppState {}

class AppChangeBottomNavBarState extends AppState {}

class IncrementCounterState extends AppState {}

class DecrementCounterState extends AppState {}

class ChangePasswordVisibilityState extends AppState {}

class RegisterLoadingState extends AppState {}

class RegisterSuccessState extends AppState {}

class RegisterErrorState extends AppState {
  String error;

  RegisterErrorState(this.error);
}

class RegisterCreateUserSuccessState extends AppState {}

class RegisterCreateUserErrorState extends AppState {
  String error;

  RegisterCreateUserErrorState(this.error);
}

class LoginLoadingState extends AppState {}

class LoginSuccessState extends AppState {
  String uId;

  LoginSuccessState(this.uId);
}

class LoginErrorState extends AppState {
  String error;

  LoginErrorState(this.error);
}

class ChangeThemeState extends AppState {}

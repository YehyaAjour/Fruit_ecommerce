import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_ecommerce/services/CacheHelper/cache_helper.dart';
import 'package:fruit_ecommerce/view/components/components.dart';
import 'package:fruit_ecommerce/view/layout/market_Screen.dart';
import 'package:fruit_ecommerce/view/register/register_screen.dart';
import 'package:fruit_ecommerce/view_model/AppCupit/cubit.dart';
import 'package:fruit_ecommerce/view_model/AppStates/states.dart';




class LoginPage extends StatelessWidget {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (BuildContext context, AppState state) {
        if (state is LoginErrorState) {
          showToast(message: state.error, state: ToastState.ERROR);
        } else if (state is LoginSuccessState) {
          CacheHelper.saveData(key: "uId", value: state.uId).then((value) {
            showToast(message: "LOGIN SUCCESSFUL", state: ToastState.SUCCESS);
            navigateAndFinish(context, MarketScreen());
          }).catchError((error) {});
          showToast(message: "LOGIN SUCCESSFUL", state: ToastState.SUCCESS);
          navigateAndFinish(context, MarketScreen());
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/PngItem_2746375.png",
                          width: 180,
                          height: 130,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text("FRUIT MARKET",
                            style: TextStyle(
                                color: Color(0xff69A03A),
                                fontSize: 35.0,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 20,
                        ),
                        defaultTextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validate: (value) {
                              if (value.isEmpty) {
                                return "Email Address Must Not Be Empty";
                              }
                              return null;
                            },
                            labelText: "Email Address",
                            prefix: Icons.email),
                        SizedBox(
                          height: 15,
                        ),
                        defaultTextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            isPassword: AppCubit.get(context).isPassword,
                            validate: (value) {
                              if (value.isEmpty) {
                                return "Password  Must Not Be Empty";
                              }
                              return null;
                            },
                            labelText: "Password",
                            prefix: Icons.lock,
                            suffix: AppCubit.get(context).suffix,
                            suffixPressed: () {
                              AppCubit.get(context).changePasswordVisability();
                            }),
                        SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context) => defaultButton(
                              function: () {
                                if (formKey.currentState.validate()) {
                                  AppCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                  // AuthHelper.authHelper.login(
                                  //     emailController.text.trim(),
                                  //     passwordController.text.trim());
                                }
                              },
                              title: "LOGIN"),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Dont Have An Account? "),
                            TextButton(
                                onPressed: () {
                                  navigateTo(context, RegisterScreen());
                                },
                                child: Text(
                                  "Register Now",
                                  style: TextStyle(
                                    color: Color(0xff69A03A),
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

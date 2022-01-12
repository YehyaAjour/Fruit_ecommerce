import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_ecommerce/view/components/components.dart';
import 'package:fruit_ecommerce/view/layout/market_Screen.dart';
import 'package:fruit_ecommerce/view_model/AppCupit/cubit.dart';
import 'package:fruit_ecommerce/view_model/AppStates/states.dart';



class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    var usernameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var phoneController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          if (state is RegisterCreateUserSuccessState) {
            navigateAndFinish(context, MarketScreen());
          }
        },
        builder: (context, state) {
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
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            //  mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'REGISTER',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    fontFamily: "Poppins"),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                'register now to browse our hot offer',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                    fontFamily: "Poppins"),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              defaultTextFormField(
                                  controller: usernameController,
                                  keyboardType: TextInputType.text,
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return "Email Address Must Not Be Empty";
                                    }
                                    return null;
                                  },
                                  labelText: "User Name",
                                  prefix: Icons.person_rounded),
                              SizedBox(
                                height: 10,
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
                                height: 10,
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
                                    AppCubit.get(context)
                                        .changePasswordVisability();
                                  }),
                              SizedBox(
                                height: 10,
                              ),
                              defaultTextFormField(
                                  controller: phoneController,
                                  keyboardType: TextInputType.phone,
                                  validate: (value) {
                                    if (value.isEmpty) {
                                      return "Email Address Must Not Be Empty";
                                    }
                                    return null;
                                  },
                                  labelText: "Phone",
                                  prefix: Icons.phone),
                              SizedBox(
                                height: 15,
                              ),
                              ConditionalBuilder(
                                condition: state is! RegisterLoadingState,
                                builder: (context) => defaultButton(
                                    function: () {
                                      if (formKey.currentState.validate()) {
                                        AppCubit.get(context).userRegister(
                                            name: usernameController.text,
                                            email: emailController.text,
                                            password: passwordController.text,
                                            phone: phoneController.text);
                                      }
                                    },
                                    title: "REGISTER"),
                                fallback: (context) =>
                                    Center(child: CircularProgressIndicator()),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

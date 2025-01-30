import 'dart:developer';

import 'package:agoris_admin/common/asset_constants.dart';
import 'package:flutter/material.dart';

import 'package:agoris_admin/common/route_constants.dart';
import 'package:agoris_admin/common/size_constants.dart';
import 'package:agoris_admin/common/text_constants.dart';

import 'package:agoris_admin/domain/entities/login_params.dart';

import 'package:agoris_admin/presentation/theme/colors.dart';

import 'package:agoris_admin/presentation/blocs/auth/auth_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login>  {

  late Size size;
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late bool isButtonEnabled = false;
  late bool passwordCharacterLimitVisible = true;
  late bool isVisible;

  @override
  void initState() {
    super.initState();
    isVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Constrain width for responsiveness
            final isMobile = constraints.maxWidth < Sizes.dimen_600;
            final containerWidth = isMobile ? constraints.maxWidth * 0.9 : Sizes.dimen_400;

            return BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {

                log('auth state listened in login:\t$state');

                if(state is AuthStateFailure){
                  Flushbar(
                    flushbarPosition: FlushbarPosition.TOP,
                    duration: const Duration(milliseconds: 4500),
                    backgroundColor: Colors.red,
                    title: 'Login Failed',
                    icon: const Icon(Icons.error_outline),
                    message: state.failureMessage,
                  ).show(context);
                }
                if(state is AuthStateAuthenticated){
                  Navigator.pushNamed(context, RouteLiterals.dashBoardRoute);
                }
              },
              child: SingleChildScrollView(
                child: Container(
                  width: containerWidth,
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_20, vertical: Sizes.dimen_40),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Sizes.dimen_12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: Sizes.dimen_10,
                        offset: Offset(Sizes.dimen_0, Sizes.dimen_5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Logo
                      Padding(
                        padding: const EdgeInsets.only(bottom: Sizes.dimen_20),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(Sizes.dimen_30)),
                          child: Image.asset(
                            AssetConstants.appIcon,
                            width: Sizes.dimen_100,
                            height: Sizes.dimen_100,
                          ),
                        ),
                      ),
                      const SizedBox(height: Sizes.dimen_20,),

                      // Welcome Text
                      const Text(
                        "Welcome back, Admin",
                        style: TextStyle(fontSize: Sizes.dimen_22, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: Sizes.dimen_10),
                      const Text(
                        "Welcome back! Please enter your details.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: Sizes.dimen_30),

                      // Email Address Input
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          labelStyle: TextStyle(
                            color: AppColors.appBlack,
                            fontSize: Sizes.dimen_12,
                            fontWeight: FontWeight.w600,
                          ),
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(
                            color: AppColors.subTitleColor,
                            fontSize: Sizes.dimen_12,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(Sizes.dimen_8)),
                              borderSide: BorderSide(color: AppColors.lightGrey)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(Sizes.dimen_8)),
                              borderSide: BorderSide(
                                  color: AppColors.primaryColor,
                                  width: Sizes.dimen_2,
                                  style: BorderStyle.solid
                              )
                          ),
                          errorBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(Sizes.dimen_8)),
                              borderSide: BorderSide(
                                  color: AppColors.errorColor,
                                  width: Sizes.dimen_2,
                                  style: BorderStyle.solid
                              )
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (v) {
                          return null;
                        },
                      ),
                      const SizedBox(height: Sizes.dimen_20),

                      // Password Input
                      TextFormField(
                        controller: passwordController,
                        obscureText: isVisible,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: AppColors.appBlack,
                            fontSize: Sizes.dimen_12,
                            fontWeight: FontWeight.w600,
                          ),
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(
                            color: AppColors.subTitleColor,
                            fontSize: Sizes.dimen_12,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(Sizes.dimen_8)),
                              borderSide: BorderSide(color: AppColors.lightGrey)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(Sizes.dimen_8)),
                              borderSide: BorderSide(
                                  color: AppColors.primaryColor,
                                  width: Sizes.dimen_2,
                                  style: BorderStyle.solid
                              )
                          ),
                          errorBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(Sizes.dimen_8)),
                              borderSide: BorderSide(
                                  color: AppColors.errorColor,
                                  width: Sizes.dimen_2,
                                  style: BorderStyle.solid
                              )
                          ),
                          suffixIcon: IconButton(
                            onPressed: ()=> setState(()=> isVisible = !isVisible),
                            icon: Icon(
                              isVisible ? Icons.visibility_off : Icons.visibility,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        keyboardType: isVisible ? TextInputType.text : TextInputType.visiblePassword,
                        onChanged: (String v) {
                          if (v.length >= 8 && emailController.text.isNotEmpty) {
                            setState(() {
                              isButtonEnabled = true;
                              passwordCharacterLimitVisible = false;
                              isVisible = false;
                            });
                          } else {
                            setState(() {
                              isButtonEnabled = false;
                            });
                          }
                        },
                        validator: (v) {
                          return null;
                        },
                      ),
                      const SizedBox(height: Sizes.dimen_10),

                      // Remember Me and Forgot Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.pushNamed(context, RouteLiterals.forgotPasswordRoute),
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.teal),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: Sizes.dimen_20),

                      // Sign In Button
                      SizedBox(
                        width: double.infinity,
                        height: Sizes.dimen_50,
                        child: BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state){
                            return state is AuthStateLoading
                                ? Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),))
                                : ElevatedButton(
                              onPressed: (){
                                //todo make api call to login
                                BlocProvider.of<AuthBloc>(context).add(const LoginEvent(loginParams: LoginParams(email: '', password: '')));

                                // Navigator.pushNamedAndRemoveUntil(context, RouteLiterals.dashBoardRoute, (route) => false);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(Sizes.dimen_8),
                                ),
                              ),
                              child: Text(
                                "Sign in",
                                style: TextStyle(
                                  fontSize: Sizes.dimen_16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.lightWhite,
                                ),
                              ),
                            );
                          }
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      backgroundColor: Colors.grey[100],
    );
  }

  @override
  void dispose() {
    super.dispose();
    log('dispose()');
    emailController.dispose();
    passwordController.dispose();
  }

}

import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:agoris_admin/common/db_constants.dart';
import 'package:agoris_admin/common/asset_constants.dart';
import 'package:agoris_admin/common/route_constants.dart';
import 'package:agoris_admin/common/size_constants.dart';
import 'package:agoris_admin/common/text_constants.dart';

import 'package:agoris_admin/domain/entities/change_password_params.dart';

import 'package:agoris_admin/presentation/blocs/auth/auth_bloc.dart';

import 'package:agoris_admin/presentation/theme/colors.dart';

import 'package:agoris_admin/presentation/widgets/common/cta_button.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:another_flushbar/flushbar.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < Sizes.dimen_600;
            final containerWidth = isMobile ? constraints.maxWidth * 0.9 : Sizes.dimen_400;

            return SingleChildScrollView(
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

                    // Set New Password Text
                    const Text(
                      "Set New Password",
                      style: TextStyle(fontSize: Sizes.dimen_24, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: Sizes.dimen_10),
                    const Text(
                      "Your new password must be different to previously used passwords.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: Sizes.dimen_30),

                    // New Password Input
                    TextField(
                      obscureText: !isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'New Password',
                        labelStyle: TextStyle(
                          color: AppColors.appBlack,
                          fontSize: Sizes.dimen_12,
                          fontWeight: FontWeight.w600,
                        ),
                        hintText: 'Enter your new password',
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
                          icon: Icon(
                            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            color: AppColors.primaryColor,
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: Sizes.dimen_10),
                    const Text(
                      "Must be at least 8 characters.",
                      style: TextStyle(fontSize: Sizes.dimen_12, color: Colors.grey),
                    ),
                    const SizedBox(height: Sizes.dimen_20),

                    // Confirm Password Input
                    TextField(
                      obscureText: !isConfirmPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(
                          color: AppColors.appBlack,
                          fontSize: Sizes.dimen_12,
                          fontWeight: FontWeight.w600,
                        ),
                        hintText: 'Re-enter your new password',
                        hintStyle: TextStyle(
                          color: AppColors.subTitleColor,
                          fontSize: Sizes.dimen_12,
                          fontWeight: FontWeight.w400,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            color: AppColors.primaryColor,
                          ),
                          onPressed: () {
                            setState(() {
                              isConfirmPasswordVisible = !isConfirmPasswordVisible;
                            });
                          },
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
                    ),
                    const SizedBox(height: Sizes.dimen_30),

                    // Reset Password Button
                    SizedBox(
                      width: double.infinity,
                      height: Sizes.dimen_50,
                      child: ElevatedButton(
                        onPressed: () {
                          //todo Implement your password reset logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Sizes.dimen_8),
                          ),
                        ),
                        child: const Text(
                          "Reset Password",
                          style: TextStyle(fontSize: Sizes.dimen_16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: Sizes.dimen_20),

                    // Back to Sign In Link
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(RouteLiterals.loginRoute, (route) => false);
                      },
                      child: const Text(
                        "Back to Sign in",
                        style: TextStyle(color: Colors.teal),
                      ),
                    ),
                  ],
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

    passwordController.dispose();
    confirmPasswordController.dispose();
  }

}
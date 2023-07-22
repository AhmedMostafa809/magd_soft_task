import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magd_soft_task/business_logic/login_cubit/login_cubit.dart';
import 'package:magd_soft_task/business_logic/login_cubit/login_cubit.dart';
import 'dart:ui';

import 'package:magd_soft_task/constants/app_colors.dart';
import 'package:magd_soft_task/presentation/router/routes.dart';
import 'package:magd_soft_task/presentation/widget/default_button.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/home_cubit/home_cubit.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    return Scaffold(
        body: Stack(
          children: [
            ColorFiltered(
              colorFilter:
              const ColorFilter.mode(AppColors.blue, BlendMode.modulate),
              child: Image.asset(
                "assets/login.png",
                fit: BoxFit.cover,
                // color: Colors.blue.withOpacity(20),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 65.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColors.blue,
                            thickness: 1,
                            indent: 7.w,
                          ),
                        ),
                        SizedBox(width: 2.5.w),
                        const Text(
                          "OR",
                          style: TextStyle(color: AppColors.blue),
                        ),
                        SizedBox(width: 2.5.w),
                        Expanded(
                          child: Divider(
                            color: AppColors.blue,
                            thickness: 1,
                            endIndent: 7.w,
                            indent: 5,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20.sp,
                            child: Image.asset(
                              "assets/f.png",
                              height: 5.h,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20.sp,
                            child: Image.asset(
                              "assets/ios 2.png",
                              height: 35,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20.sp,
                            child: Image.asset(
                              "assets/Google__G__Logo 2.png",
                              height: 35,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: FractionalTranslation(
                translation: const Offset(0, -.1),
                child: Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 10.0.w),
                  child: SizedBox(
                    height: 45.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                      child: Form(
                        child: ListView(
                          children: [
                            Center(
                              child: Text(
                                'Welcome',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                height: 0.5.h,
                                width: 40.w,
                                color: AppColors.blue,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),

                              child: TextField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(fontSize: 12),
                                  hintText: 'Enter your Full Name',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                ),

                              ),
                            ),
                            SizedBox(height: 2.h),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: TextField(
                                controller: phoneController,
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(fontSize: 12),
                                  hintText: 'Enter your Phone Number',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                ),
                              ),
                            ),
                            SizedBox(height: 3.h),
                            BlocConsumer<LoginCubit, LoginState>(
                              listener: (context, state) {
                               },
                              builder: (context, state) {
                                return DefaultButton(
                                    Onpressed: () {
                                      loginCubit.login(nameController.text, phoneController.text);
                                      if(state is LoginSuccessState){
                                    Navigator.pushNamed(
                                        context, AppRoutes.verificationRoute);
                                  }
                                      else if(state is LoginErrorState){}
                                },
                                    text: "Login",
                                    leftColor: Colors.white,
                                    rightColor: Colors.blue,
                                    Height: 5.h,
                                    width: 80.w);
                              },
                            )
                          ],
                        ),
                      ),

                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

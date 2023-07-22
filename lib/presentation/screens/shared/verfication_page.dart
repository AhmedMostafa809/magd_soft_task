import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magd_soft_task/presentation/router/routes.dart';
import 'package:magd_soft_task/presentation/widget/default_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:sizer/sizer.dart';

import '../../../business_logic/login_cubit/login_cubit.dart';
import '../../../constants/app_colors.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final TextEditingController controller = TextEditingController();
  String _pinCode = "";

  // TextEditingController textEditingController = TextEditingController();
  // // ..text = "123456";
  //
  // // ignore: close_sinks
  // StreamController<ErrorAnimationType>? errorController;
  //
  // bool hasError = false;
  // String currentText = "";
  // final formKey = GlobalKey<FormState>();
  //
  // @override
  // void initState() {
  //   errorController = StreamController<ErrorAnimationType>();
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   errorController!.close();
  //   super.dispose();
  // }
  //
  // // snackBar Widget
  // snackBar(String? message) {
  //   return ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message!),
  //       duration: const Duration(seconds: 2),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final loginCubit = BlocProvider.of<LoginCubit>(context);

    return Scaffold(
      body: SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xD90062BD),
                  Color(0x000062BD),
                ],
                stops: [
                  0,
                  1
                ]),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0.h),
                child: Center(
                  child: Text(
                    "Verify Phone",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              PinCodeTextField(
                enableActiveFill: true,
                appContext: context,
                length: 4,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  fieldHeight: 10.h,
                  selectedColor: Colors.white,
                  fieldWidth: 15.w,
                  disabledColor: Colors.white,
                  activeColor: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  inactiveColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  activeFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                ),
                showCursor: false,
                keyboardType: TextInputType.phone,
                boxShadows: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 1,
                  )
                ],
                onChanged: (value) {
                  setState(() {
                    _pinCode = value;
                  });
                },
                onCompleted: (value) {},
              ),
              SizedBox(
                height: 10.h,
              ),
              const Center(
                  child: InkWell(
                      child: Text(
                "Resend Code",
                style: TextStyle(color: AppColors.blue, fontSize: 20),
              ))),
              SizedBox(
                height: 10.h,
              ),
              DefaultButton(
                  Onpressed: () {
                    if (_pinCode == loginCubit.loginModel.code) {
                      Navigator.pushNamed(context, AppRoutes.helpRoute);
                    } else {
                      Fluttertoast.showToast(
                          msg: "Wrong verification code",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: AppColors.blue,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  text: "Verify",
                  leftColor: Colors.white,
                  rightColor: Colors.blue,
                  Height: 5.h,
                  width: 80.w),
            ],
          ),
        ),
      ),
    );
  }
}

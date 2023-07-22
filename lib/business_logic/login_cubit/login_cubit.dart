import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magd_soft_task/constants/end_points.dart';
import 'package:magd_soft_task/data/data_providers/remote/dio_helper.dart';
import 'package:magd_soft_task/data/models/login_model.dart';
import 'package:meta/meta.dart';
import 'package:magd_soft_task/constants/app_colors.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  LoginModel loginModel = LoginModel();
  String otpCode = "";

  login(String name, String phone) {
    emit(LoadingState());
    DioHelper.postData(
        endPoint: EndPoint.login,
        data: {'name': name, 'phone': phone}).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      otpCode = loginModel.code.toString();
      print(loginModel.message);
      print(loginModel.code);
      if (loginModel.message.toString() ==
          "phone number must be more than 10 and less than 15") {
        Fluttertoast.showToast(
            msg: "phone number must be more than 10 and less than 15",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: AppColors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
        emit(LoginErrorState());
      }
      else if (loginModel.message.toString() == "name is Required") {
        Fluttertoast.showToast(
            msg: "name is Required",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: AppColors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
        emit(LoginErrorState());
      } else if (loginModel.message.toString() == "phone is Required") {
        Fluttertoast.showToast(
            msg: "phone is Required",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: AppColors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
        emit(LoginErrorState());
      } else if (loginModel.message.toString() ==
          "phone number must be more than 10 and less than 15") {
        Fluttertoast.showToast(
            msg: "phone number must be more than 10 and less than 15",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: AppColors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
        emit(LoginErrorState());
      }else if (loginModel.message.toString() == "Account Created Successfully"||loginModel.message.toString() =="Account Verified"){
        emit(LoginSuccessState());
      }
    }).catchError((e) {
      print(e.toString());
      Fluttertoast.showToast(
          msg: "Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
      emit(LoginErrorState());
    });
  }
}

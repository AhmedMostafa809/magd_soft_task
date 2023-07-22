import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magd_soft_task/constants/end_points.dart';
import 'package:magd_soft_task/data/data_providers/remote/dio_helper.dart';
import 'package:magd_soft_task/data/models/help_model.dart';
import 'package:meta/meta.dart';

part 'help_state.dart';

class HelpCubit extends Cubit<HelpState> {
  HelpCubit() : super(HelpInitial());
  static HelpCubit get(context) => BlocProvider.of(context);
  HelpModel helpModel = HelpModel();
  List<HelpModel> _help = [];

  Future<List<dynamic>> getText()async{
    var response =await DioHelper.getData(endPoint: EndPoint.helpURL);
    return response.data['help'];
  }

  Future<List<HelpModel>>mapping()async{
  final helpMap =await getText();
   return helpMap.map((help) => HelpModel.fromJson(help)).toList();
  }

  List<HelpModel> help() {
    mapping().then((help) {
      emit(HelpLoaded(help));
      _help = help;
    });
    return _help;
  }
}

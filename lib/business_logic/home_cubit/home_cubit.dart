import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magd_soft_task/constants/end_points.dart';
import 'package:magd_soft_task/data/data_providers/remote/dio_helper.dart';
import 'package:magd_soft_task/data/models/products_model.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  ProductsModel productsModel = ProductsModel();

  // List storeProducts = [];
  int productCount = 1;

  Future<Map<String, dynamic>> fetchDataFromAPI() async {
    try {
      final response = await DioHelper.getData(endPoint: EndPoint.getProducts);
      if (response.statusCode == 200) {
        Map<String, dynamic> productsData = response.data;
        productsModel = ProductsModel.fromJson(response.data);
        productCount = productsModel.products!.length;
        // emit(GetProductSuccessState());
        return productsData;
      } else {
        throw Exception('Failed to load data from API');
      }
    } catch (e) {
      throw Exception('Failed to load data from API');
    }
  }

// getAllProducts(){
//   DioHelper.getData(endPoint: EndPoint.getProducts).then((value) {
//     // var response = ProductsModel.fromJson(value.data['products']);
//     //   List<ProductsModel> products = (value.data['products'] as List).map((data) => ProductsModel.fromJson(data)).toList();
//       // storeProducts.clear();
//       // products.forEach((element) {storeProducts.add(element.status);});
//       productsModel.products.
//       print(products);
//
//   });
//
// }
//
// bool selectBrand(bool brand){
//   if (brand == true) {
//     brand = false;
//     print('val changed to false');
//   } else if (brand == false) {
//     brand = true;
//     print('val changed to true');
//   }
//
//   return brand;
//    }
}

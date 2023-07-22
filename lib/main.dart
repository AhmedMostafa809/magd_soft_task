import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magd_soft_task/business_logic/help_cubit/help_cubit.dart';
import 'package:magd_soft_task/business_logic/home_cubit/home_cubit.dart';
import 'package:magd_soft_task/business_logic/login_cubit/login_cubit.dart';
import 'package:magd_soft_task/presentation/router/app_router.dart';
import 'package:magd_soft_task/presentation/router/routes.dart';
import 'package:sizer/sizer.dart';
import 'business_logic/bloc_observer.dart';
import 'data/data_providers/remote/dio_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  // await initSharedPrefs();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MultiBlocProvider(providers: [
        BlocProvider(create: (_) => HomeCubit()),
        BlocProvider(create: (_) => LoginCubit()),
        BlocProvider(create: (_) => HelpCubit()),
    BlocProvider(create: (_) => HomeCubit()),
      ], child: const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return const MaterialApp(
        initialRoute: AppRoutes.helpRoute,
        onGenerateRoute: onGenerate,
        debugShowCheckedModeBanner: false,
      );
    });
  }
}

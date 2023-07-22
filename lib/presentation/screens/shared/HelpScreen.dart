import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magd_soft_task/constants/app_colors.dart';
import 'package:sizer/sizer.dart';
import '../../../business_logic/help_cubit/help_cubit.dart';
import '../../../business_logic/home_cubit/home_cubit.dart';
import '../../../constants/end_points.dart';
import '../../../data/data_providers/remote/dio_helper.dart';
import '../../../data/models/help_model.dart';
import '../../router/routes.dart';
import '../../widget/default_button.dart';

HelpModel helpModel = HelpModel();

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  List<HelpModel> allHelp = [];

  @override
  void initState() {
    super.initState();
    allHelp = BlocProvider.of<HelpCubit>(context).help();
  }


  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      body: ListView(
        children: [
          Container(
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
                    .5
                  ]),
            ),
            //child: buildHelpList(),
            child: BlocBuilder<HelpCubit, HelpState>(
              builder: (context, state) {
                if (state is HelpLoaded) {
                  allHelp = state.help;
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.0.h, bottom: 6.h),
                        child: Center(
                          child: Text(
                            "Help",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.sp,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 5,
                          child: ExpansionTile(
                            title: Text(
                              allHelp[0].question!,
                              style: const TextStyle(color: AppColors.blue),
                            ),
                            childrenPadding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 2.h),
                            children: [
                              Text(allHelp[0].answer!),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 5,
                          child: ExpansionTile(
                            title: Text(
                              allHelp[1].question!,
                              style: const TextStyle(color:AppColors.blue),
                            ),
                            childrenPadding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 2.h),
                            children: [
                              Text(
                                allHelp[1].answer!,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 5,
                          child: ExpansionTile(
                            title: Text(
                              allHelp[2].question!,
                              style: const TextStyle(color: AppColors.blue),
                            ),
                            childrenPadding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 2.h),
                            children: [
                              Text(
                                allHelp[2].answer!,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 5,
                          child: ExpansionTile(
                            title: Text(
                              allHelp[3].question!,
                              style: const TextStyle(color: AppColors.blue),
                            ),
                            childrenPadding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 2.h),
                            children: [
                              Text(
                                allHelp[3].answer!,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 5,
                          child: ExpansionTile(
                            title: Text(
                              allHelp[4].question!,
                              style: const TextStyle(color: AppColors.blue),
                            ),
                            childrenPadding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 2.h),
                            children: [
                              Text(
                                allHelp[4].answer!,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // CustomElevatedButton(
                      //     Onpressed: () {
                      //       Navigator.pushNamed(context, AppRoutes.homeRoute);
                      //     },
                      //     text: "Continue",
                      //     leftColor: Colors.white,
                      //     rightColor: Colors.blue,
                      //     Height: 5.h,
                      //     width: 80.w)
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.blue,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0.w),
        child: DefaultButton(
            Onpressed: () {
              homeCubit.fetchDataFromAPI();
              Navigator.pushNamed(context, AppRoutes.homeRoute);
            },
            text: "Continue",
            leftColor: Colors.white,
            rightColor: Colors.blue,
            Height: 5.h,
            width: 80.w),
      )
    );
  }


}


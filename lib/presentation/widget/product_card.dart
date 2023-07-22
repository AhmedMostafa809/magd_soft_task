import 'package:flutter/material.dart';
import 'package:magd_soft_task/constants/app_colors.dart';

import 'package:sizer/sizer.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String image;

  const ProductCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      width: 50.w,
      child: Stack(
        children: [
          Card(
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),

                  ),
                  width: double.infinity,
                  height: 15.h,
                  child: Image.network(
                    image,
                  ),
                ),
                // const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            color: AppColors.blue,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle( overflow: TextOverflow.ellipsis,
                            color: Colors.grey,
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      // SizedBox(
                      //   height: 2.h,
                      // ),
                      SizedBox(
                        height: 3.h,
                      ),

                      Text(
                        price,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 7.sp,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),

              ],
            ),

          ),
          Align
            (
            alignment: Alignment.bottomRight,
            child: Container(
                width: 10.w,
                height: 5.h,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xD90062BD),
                        Color(0x000062BD),
                      ],
                      stops: [
                        0,
                        1
                      ]),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: AppColors.blue,
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 18.sp,
                )),
          ),
        ],
      ),
    );
  }
}

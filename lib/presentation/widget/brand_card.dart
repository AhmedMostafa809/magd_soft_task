import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magd_soft_task/constants/app_colors.dart';
import 'package:magd_soft_task/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class BrandCard extends StatelessWidget {
  String image;
  String brand;
  bool selected;
  Function()? select;

  BrandCard({
    Key? key,
    required this.brand,
    required this.selected,
    required this.select,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: select,
      child: SizedBox(

        width: 35.w,
        height: 8.h,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: selected == false ? Colors.white : Colors.blue,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                    selected == true ? const Color(0xD90062BD):Colors.white,
                    selected == true ? const Color(0x000062BD):Colors.white,
                  ],
                  stops: const [
                    0,
                    1
                  ]),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Container(
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
                        radius: 18.sp,
                        backgroundColor: Colors.white,
                        child: Image.asset(image, height: 25.sp),
                      )),
                ),
                Text(
                  brand,
                  style: TextStyle(
                      fontSize: 20,
                      color: selected == false ? Colors.black87 : Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

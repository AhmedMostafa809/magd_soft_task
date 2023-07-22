import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magd_soft_task/constants/app_colors.dart';

class DefaultButton extends StatelessWidget{
  final VoidCallback Onpressed;
  final String text;
  final double Height,width;
  final Color? clr;
  final Color rightColor;
  final Color leftColor;
  const DefaultButton({Key ?key , required this.Onpressed,
    required this.text,
     this.clr,required this.leftColor,required this.rightColor,
    required this.Height,required this.width
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0062BD),AppColors.blue],
          // stops: [.5.,1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: SizedBox(

          child: MaterialButton(onPressed: Onpressed,
            height: Height,
            child: Text(text,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400),),
            color: clr,
            minWidth: width,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
          )
      ),
    );
  }





}
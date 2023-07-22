import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductScreen extends StatelessWidget {
  String? name;
  String? type;
  String? image;
  String? price;
  String? description;

  ProductScreen({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
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
              child: Padding(
                padding: EdgeInsets.all(8.0.sp),
                child: SingleChildScrollView(
                  child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Card(
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.grey,
                          )),
                    ),
                    Text("$name",style: TextStyle(color: Colors.white,fontSize: 25.sp),),
                    Text("$type",style: TextStyle(color: Colors.white,fontSize: 15.sp),),
                    Card(shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                      elevation: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        width: double.infinity,
                        height: 30.h,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            "$image",fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Row(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text("Price",style: TextStyle(color: Colors.grey,fontSize: 15.sp),),

                        Text("$price EGP",style: TextStyle(color: Colors.black,fontSize: 17.sp),),

                      ],)
                    ],),
                        Text("$description",style: TextStyle(color: Colors.grey,fontSize: 15.sp))
                  ]),
                ),
              ))),
    );
  }
}

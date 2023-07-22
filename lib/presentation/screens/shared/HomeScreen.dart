import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magd_soft_task/business_logic/home_cubit/home_cubit.dart';
import 'package:magd_soft_task/constants/app_colors.dart';
import 'package:magd_soft_task/presentation/widget/brand_card.dart';
import 'package:magd_soft_task/presentation/widget/product_card.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

//
// List<dynamic> getCompanyProductList(Map<String, dynamic> responseData, String company) {
//   List<dynamic> productList = responseData['products'];
//   return productList.where((product) => product['company'] == company).toList();
// }


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    final homeCubit = BlocProvider.of<HomeCubit>(context);
    bool all = false;
    bool acer = false;
    bool razer = false;
    bool apple = false;

    // void initState() {
    //   super.initState();
    //   homeCubit.fetchDataFromAPI();
    // }

    return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    // homeCubit.fetchDataFromAPI();
    },
  builder: (context, state) {
    return Scaffold(
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
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 8.h,
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: const [
                              Text(
                                "Search",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Spacer(),
                              Icon(
                                Icons.search,
                                color: Colors.grey,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.filter_alt_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0.w),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    // set the border radius as desired
                    child: Image.asset(
                        "assets/Acer-Predator-Helios-300-2021 2.png")),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: BlocConsumer<HomeCubit, HomeState>(
                  listener: (context, state) {
                    // all = homeCubit.selectBrand(all);
                  },
                  builder: (context, state) {
                    return Row(
                      children: [
                        BrandCard(
                            brand: "All",
                            selected: all,
                            select: () {
                              // all = homeCubit.selectBrand(all);
                              print(all);
                              // homeCubit.selectBrand(all);
                              // print(homeCubit.al);
                            },
                            image: "assets/vector-trophy-cup-icon 2.png"),
                        BrandCard(
                            brand: "Acer",
                            selected: acer,
                            select: () {
                              // acer = homeCubit.selectBrand(acer);
                            },
                            image:
                                "assets/309-3098835_predator-tlcs-2017-acer-predator-logo-vector 2.png"),
                        BrandCard(
                            brand: "Razer",
                            selected: false,
                            select: () {},
                            image: "assets/Razer-Logo 2.png"),
                        BrandCard(
                            brand: "Apple",
                            selected: false,
                            select: () {},
                            image: "assets/ios 2.png"),
                      ],
                    );
                  },
                ),
              ),
            ),
          StaggeredGridView.countBuilder(
              shrinkWrap: true,
              crossAxisCount: 4,
              itemCount: 6,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) => index == 0
                      ? Padding(
                          padding: EdgeInsets.all(5.sp),
                          child: Text(
                            "Recommended for You",
                            style: TextStyle(
                              fontSize: 20.sp,
                            ),
                          ),
                        )
                      //ProductCard(title: "title", subtitle: "subtitle", price: "price", image: "assets/300 2022 2.png")
                      :
                  FutureBuilder<Map<String, dynamic>>(
                          future: homeCubit.fetchDataFromAPI(),
                          builder: (context, snapshot) {
                            String company = "";
                            String name = "";
                            String image = "";
                            String price = "";
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text('Error: ${snapshot.error}'),
                              );
                            } else {
                              Map<String, dynamic> response = snapshot.data!;
                              List<dynamic> products  = response['products'];
                              String company = products[index]['company'];
                              String name = products[index]['name'];
                              String image = products[index]['image'];
                              String price = products[index]['price'];
                              return ProductCard(title: company, subtitle: name, price: price, image: image);
                            }
                            // return
                            // ProductCard(title: "title", subtitle: "subtitle", price: "price", image: "assets/300 2022 2.png");
                          },
                        ),
                  staggeredTileBuilder: (int index) =>
                      StaggeredTile.count(2, index.toInt() == 0 ? 1 : 2),
                  mainAxisSpacing: 3.h,
                  // crossAxisSpacing: 0.0.w,
                )
              // :Center(child: CircularProgressIndicator(),),
              ],
            ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 5.h,
        elevation: 0,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(
              Icons.login,
              color: Colors.grey,
            ),
            Icon(
              Icons.favorite,
              color: Colors.grey,
            ),
            SizedBox(width: 48.0),
            Icon(
              Icons.notifications,
              color: Colors.grey,
            ),
            Icon(
              Icons.settings,
              color: Colors.grey,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 56.0,
        height: 56.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,
              AppColors.blue,
            ],
          ),
        ),
        child: FloatingActionButton(
          onPressed: () {
            homeCubit.fetchDataFromAPI().then((value) => print("OKJ"));
            // homeCubit.getAllProducts();
            print("object");
          },
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          elevation: 0,
          highlightElevation: 0,
          focusElevation: 0,
          hoverElevation: 0,
          child: const Icon(Icons.home),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  },
);
  }
}

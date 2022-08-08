import 'package:flutter/material.dart';
import 'package:food_delivary/controller/popular_product_controller.dart';
import 'package:food_delivary/controller/recommended_product_controller.dart';
import 'package:get/get.dart';
import 'Pages/food/popular_food_detail.dart';
import 'Pages/food/recommended_food_detail.dart';
import 'Pages/home/main_food_page.dart';
import 'helper/dependinces.dart' as dep;
import 'routes/route_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainFoodPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}

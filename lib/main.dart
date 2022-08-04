import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Pages/food/popular_food_detail.dart';
import 'Pages/food/recommended_food_detail.dart';
import 'Pages/home/main_food_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecommendedFoodDetail(),
    );
  }
}

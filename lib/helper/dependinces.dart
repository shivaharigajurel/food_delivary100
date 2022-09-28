import 'package:food_delivary/controller/cart_controller.dart';
import 'package:food_delivary/controller/popular_product_controller.dart';
import 'package:food_delivary/controller/recommended_product_controller.dart';
import 'package:food_delivary/data/api/api_client.dart';
import 'package:food_delivary/data/repogetroy/popular_product_repo.dart';
import 'package:food_delivary/data/repogetroy/recommended_product.dart';
import 'package:food_delivary/utilts/app_constant.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/repogetroy/cart_repo.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  // apiCleint
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
  // repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  // controllers
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}

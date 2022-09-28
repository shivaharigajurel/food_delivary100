import 'package:food_delivary/Pages/food/popular_food_detail.dart';
import 'package:food_delivary/splash_screen.dart';
import 'package:get/get.dart';

import '../Pages/cart/cart_page.dart';
import '../Pages/food/recommended_food_detail.dart';
import '../Pages/home/home_page.dart';
import '../Pages/home/main_food_page.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  static String getSplashPage() => splashPage;
  static String getInitial() => initial;
  static String getPopularFood(int pageId, String page) =>
      "$popularFood?pageId=$pageId&page=$page";
  static String getRecommendedFood(int pageId, String page) =>
      "$recommendedFood?pageId=$pageId&page=$page";
  static String getCartPage() => cartPage;

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => const SplashScreen()),
    GetPage(name: initial, page: () => const HomePage()),
    //slider
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return PopularFoodDetail(
          pageId: int.parse(pageId!),
          page: page!,
        );
      },
      transition: Transition.fadeIn,
      transitionDuration: Duration(seconds: 1),
    ),
    // recommended food
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return RecommendedFoodDetail(
            pageId: int.parse(
              pageId!,
            ),
            page: page!);
      },
      transition: Transition.fadeIn,
      transitionDuration: Duration(seconds: 1),
    ),
    GetPage(
      name: cartPage,
      page: () {
        return CartPage();
      },
      transition: Transition.fadeIn,
      transitionDuration: Duration(seconds: 2),
    )
  ];
}

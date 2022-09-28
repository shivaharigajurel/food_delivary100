import 'package:flutter/material.dart';
import 'package:food_delivary/Pages/cart/cart_page.dart';
import 'package:food_delivary/controller/cart_controller.dart';
import 'package:food_delivary/controller/popular_product_controller.dart';
import 'package:food_delivary/models/popular_product_model.dart';
import 'package:food_delivary/routes/route_helper.dart';
import 'package:food_delivary/utilts/app_constant.dart';
import 'package:food_delivary/utilts/dimensions.dart';
import 'package:food_delivary/widgets/Icon_Widget.dart';
import 'package:food_delivary/widgets/exandable.dart';
import '../../utilts/colors.dart';
import '../../widgets/Column.dart';
import '../../widgets/Icon_and_text.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import 'package:get/get.dart';
import '../home/food_page_body.dart';
import '../home/main_food_page.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  PopularFoodDetail({Key? key, required this.pageId, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];

    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.height360,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(AppConstants.UPLOAD_URL + product.img!),
                ),
              ),
            ),
          ),
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (page == "cartPage") {
                        Get.toNamed(RouteHelper.getCartPage());
                      } else {
                        Get.toNamed(RouteHelper.getInitial());
                      }
                    },
                    child: IconWidget(
                      icon: Icons.arrow_back_ios,
                    ),
                  ),
                  GetBuilder<PopularProductController>(builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        if (controller.totalItems >= 1)
                          Get.toNamed(RouteHelper.getCartPage());
                      },
                      child: Stack(
                        children: [
                          IconWidget(icon: Icons.shopping_cart_outlined),
                          controller.totalItems >= 1
                              ? Positioned(
                                  right: 0,
                                  top: 0,
                                  child: IconWidget(
                                    icon: Icons.circle,
                                    size: 20,
                                    iconColor: Colors.transparent,
                                    backgroundColor: AppColors.mainColor,
                                  ),
                                )
                              : Container(),
                          Get.find<PopularProductController>().totalItems >= 1
                              ? Positioned(
                                  right: 3,
                                  top: 3,
                                  child: BigText(
                                    text: Get.find<PopularProductController>()
                                        .totalItems
                                        .toString(),
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                )
                              : Container()
                        ],
                      ),
                    );
                  }),
                ],
              )),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.height360 - 20,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: product.name!),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(text: "Introduce"),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExandableTextWidget(
                        text: product.description!,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      //  Bottom Navigation Bar
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularProduct) {
          return Container(
            height: Dimensions.height120,
            padding: EdgeInsets.only(
              left: Dimensions.width20,
              right: Dimensions.width20,
              top: Dimensions.height30,
              bottom: Dimensions.height30,
            ),
            decoration: BoxDecoration(
                color: const Color(0xFFa9a29f),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        left: Dimensions.width15,
                        right: Dimensions.width15,
                      ),
                      height: Dimensions.height100,
                      width: Dimensions.width120,
                      decoration: BoxDecoration(
                        color: const Color(0xFFccc7c5),
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              popularProduct.setQuantaty(false);
                            },
                            child: Icon(Icons.remove),
                          ),
                          SizedBox(width: Dimensions.width10 / 2),
                          BigText(text: popularProduct.inCartItem.toString()),
                          SizedBox(width: Dimensions.width10 / 2),
                          GestureDetector(
                            onTap: () {
                              popularProduct.setQuantaty(true);
                            },
                            child: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        popularProduct.addItem(product);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          left: Dimensions.width10,
                          right: Dimensions.width10,
                        ),
                        height: Dimensions.height100,
                        width: Dimensions.width120 * 2 - 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFF89dad0),
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                        ),
                        child: Row(
                          children: [
                            BigText(text: "\$ ${product.price} Add To Card"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

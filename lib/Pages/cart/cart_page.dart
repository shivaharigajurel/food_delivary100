import 'package:flutter/material.dart';
import 'package:food_delivary/Pages/home/main_food_page.dart';
import 'package:food_delivary/controller/cart_controller.dart';
import 'package:food_delivary/controller/popular_product_controller.dart';
import 'package:food_delivary/controller/recommended_product_controller.dart';
import 'package:food_delivary/utilts/app_constant.dart';
import 'package:food_delivary/utilts/colors.dart';
import 'package:food_delivary/utilts/dimensions.dart';
import 'package:food_delivary/widgets/Icon_Widget.dart';
import 'package:get/get.dart';
import '../../routes/route_helper.dart';
import '../../widgets/Icon_and_text.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: Dimensions.height20 * 3,
          left: Dimensions.width20,
          right: Dimensions.width20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconWidget(
                icon: Icons.arrow_back_ios,
                iconColor: Colors.white,
                backgroundColor: AppColors.mainColor,
                size: Dimensions.font26 * 1.5,
              ),
              SizedBox(
                width: Dimensions.width20 * 5,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteHelper.getInitial());
                },
                child: IconWidget(
                  icon: Icons.home_outlined,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  size: Dimensions.font26 * 1.5,
                ),
              ),
              IconWidget(
                icon: Icons.shopping_cart,
                iconColor: Colors.white,
                backgroundColor: AppColors.mainColor,
                size: Dimensions.font26 * 1.5,
              )
            ],
          ),
        ),
        Positioned(
            top: Dimensions.height20 * 6,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(builder: (cartController) {
                  var _cartList = cartController.getItems;
                  return ListView.builder(
                      itemCount: _cartList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: Dimensions.height15),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  var popularIndex =
                                      Get.find<PopularProductController>()
                                          .popularProductList
                                          .indexOf(_cartList[index].product!);
                                  if (popularIndex >= 0) {
                                    Get.toNamed(RouteHelper.getPopularFood(
                                        popularIndex, "CartPage"));
                                  } else {
                                    var recommendedIndex =
                                        Get.find<RecommendedProductController>()
                                            .recommendProductList
                                            .indexOf(_cartList[index].product!);
                                    Get.toNamed(RouteHelper.getRecommendedFood(
                                        recommendedIndex, 'recommendedpage'));
                                  }
                                },
                                child: Container(
                                  height: Dimensions.height120,
                                  width: Dimensions.width120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius20),
                                      color: Colors.white24,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            AppConstants.UPLOAD_URL +
                                                cartController
                                                    .getItems[index].img!,
                                          ))),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(
                                    left: Dimensions.width10,
                                    right: Dimensions.width10,
                                    top: Dimensions.height10,
                                    bottom: Dimensions.height10,
                                  ),
                                  height: Dimensions.height120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight:
                                          Radius.circular(Dimensions.radius20),
                                      bottomRight:
                                          Radius.circular(Dimensions.radius20),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BigText(
                                          text: cartController
                                              .getItems[index].name!),
                                      SizedBox(height: Dimensions.height10),
                                      SmallText(text: "Spicy"),
                                      SizedBox(
                                        height: Dimensions.height20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(
                                            text: '\$ ' +
                                                cartController
                                                    .getItems[index].price
                                                    .toString(),
                                            color: Colors.redAccent,
                                          ),
                                          Container(
                                            child: Row(children: [
                                              GestureDetector(
                                                onTap: () {
                                                  cartController.addItem(
                                                      _cartList[index].product!,
                                                      -1);
                                                },
                                                child: Icon(Icons.remove),
                                              ),
                                              SizedBox(
                                                height: Dimensions.height10 / 2,
                                              ),
                                              BigText(
                                                  text: _cartList[index]
                                                      .quantity
                                                      .toString()),
                                              SizedBox(
                                                height: Dimensions.height10 / 2,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  cartController.addItem(
                                                      _cartList[index].product!,
                                                      1);
                                                },
                                                child: Icon(Icons.add),
                                              ),
                                            ]),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              )
                            ],
                          ),
                        );
                      });
                }),
              ),
            ))
      ]),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (CartController) {
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
                topRight: Radius.circular(Dimensions.radius20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        height: Dimensions.height100,
                        width: Dimensions.width120 - 20,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BigText(
                                text: '\$ ' +
                                    CartController.totalAmount.toString()),
                          ],
                        ))
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(
                          left: Dimensions.width10,
                          right: Dimensions.width10,
                        ),
                        height: Dimensions.height100,
                        width: Dimensions.width120,
                        decoration: BoxDecoration(
                          color: const Color(0xFF89dad0),
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                        ),
                        child: Row(
                          children: [
                            BigText(text: "Check Out"),
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

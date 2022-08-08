import 'package:flutter/material.dart';
import 'package:food_delivary/Pages/home/main_food_page.dart';
import 'package:food_delivary/controller/cart_controller.dart';
import 'package:food_delivary/utilts/app_constant.dart';
import 'package:food_delivary/utilts/colors.dart';
import 'package:food_delivary/utilts/dimensions.dart';
import 'package:food_delivary/widgets/Icon_Widget.dart';
import 'package:get/get.dart';
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
                  Get.to(() => MainFoodPage());
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
                  return ListView.builder(
                      itemCount: cartController.getItems.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: Dimensions.height15),
                          child: Row(
                            children: [
                              Container(
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
                                            text: cartController
                                                .getItems[index].price
                                                .toString(),
                                            color: Colors.redAccent,
                                          ),
                                          Container(
                                            child: Row(children: [
                                              Icon(Icons.remove),
                                              SizedBox(
                                                height: Dimensions.height10 / 2,
                                              ),
                                              BigText(text: "0"),
                                              SizedBox(
                                                height: Dimensions.height10 / 2,
                                              ),
                                              Icon(Icons.add),
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivary/Pages/cart/cart_page.dart';
import 'package:food_delivary/routes/route_helper.dart';
import 'package:food_delivary/utilts/dimensions.dart';
import 'package:food_delivary/widgets/Icon_Widget.dart';
import 'package:food_delivary/widgets/exandable.dart';
import 'package:get/get.dart';
import '../../controller/cart_controller.dart';
import '../../controller/popular_product_controller.dart';
import '../../controller/recommended_product_controller.dart';
import '../../utilts/app_constant.dart';
import '../../utilts/colors.dart';
import '../../widgets/big_text.dart';
import '../home/main_food_page.dart';

class RecommendedFoodDetail extends StatelessWidget {
  int pageId;
  RecommendedFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: Dimensions.height45 * 2,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: IconWidget(icon: Icons.clear),
                  ),
                  // IconWidget(icon: Icons.shopping_cart),
                  GetBuilder<PopularProductController>(builder: (controller) {
                    return Stack(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.to(() => CartPage());
                            },
                            child:
                                IconWidget(icon: Icons.shopping_cart_outlined)),
                        Get.find<PopularProductController>().totalItems >= 1
                            ? Positioned(
                                right: 0,
                                top: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => CartPage());
                                  },
                                  child: IconWidget(
                                    icon: Icons.circle,
                                    size: 20,
                                    iconColor: Colors.transparent,
                                    backgroundColor: AppColors.mainColor,
                                  ),
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
                    );
                  }),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(Dimensions.height45),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius30),
                      topRight: Radius.circular(Dimensions.radius30),
                    ),
                  ),
                  width: double.maxFinite,
                  child: Center(
                      child: BigText(
                          size: Dimensions.font26, text: product.name!)),
                  padding: EdgeInsets.only(
                    top: Dimensions.height10 / 2,
                    bottom: Dimensions.height10,
                  ),
                ),
              ),
              pinned: true,
              expandedHeight: 300,
              backgroundColor: AppColors.yellowColor,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  AppConstants.UPLOAD_URL + product.img!,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: Dimensions.width10,
                    right: Dimensions.width10,
                    top: Dimensions.height10,
                    bottom: Dimensions.height10,
                  ),
                  child: ExandableTextWidget(
                    text: product.description!,
                  ),
                )
              ],
            ))
          ],
        ),
        bottomNavigationBar:
            GetBuilder<PopularProductController>(builder: (popularProduct) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: Dimensions.width20 * 2.5,
                  right: Dimensions.width20 * 2.5,
                  top: Dimensions.height15,
                  bottom: Dimensions.height15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        popularProduct.setQuantaty(false);
                      },
                      child: IconWidget(
                          size: Dimensions.height45,
                          iconColor: Colors.white,
                          backgroundColor: AppColors.mainColor,
                          icon: Icons.remove),
                    ),
                    BigText(
                      text: "\$ ${product.price!}" +
                          " X " +
                          "${popularProduct.inCartItem}",
                      size: Dimensions.font30,
                    ),
                    GestureDetector(
                      onTap: () {
                        popularProduct.setQuantaty(true);
                      },
                      child: IconWidget(
                          size: Dimensions.height45,
                          iconColor: Colors.white,
                          backgroundColor: AppColors.mainColor,
                          icon: Icons.add),
                    ),
                  ],
                ),
              ),
              Container(
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
                          width: Dimensions.width45 * 1.8,
                          decoration: BoxDecoration(
                            color: const Color(0xFFccc7c5),
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                size: Dimensions.height45,
                                Icons.favorite,
                                color: AppColors.mainColor,
                              )
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
                                BigText(
                                    text: "\$ ${product.price!} Add To Card")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        }));
  }
}

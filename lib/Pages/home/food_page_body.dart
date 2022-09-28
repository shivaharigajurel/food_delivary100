import 'package:flutter/material.dart';
import 'package:food_delivary/controller/popular_product_controller.dart';
import 'package:food_delivary/controller/recommended_product_controller.dart';
import 'package:food_delivary/routes/route_helper.dart';
import 'package:food_delivary/utilts/app_constant.dart';
import 'package:food_delivary/utilts/colors.dart';
import 'package:food_delivary/utilts/dimensions.dart';
import 'package:food_delivary/widgets/Icon_and_text.dart';
import 'package:food_delivary/widgets/big_text.dart';
import 'package:food_delivary/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import '../../widgets/Column.dart';
import '../food/popular_food_detail.dart';
import '../food/recommended_food_detail.dart';

class FoodPageBody extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  // ignore: prefer_final_fields
  double _scaleFactor = 0.8;
  // ignore: prefer_final_fields
  double _height = Dimensions.height220;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  // ignore: must_call_super
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ignore: sized_box_for_whitespace
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return Container(
              height: Dimensions.height320,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: popularProducts.popularProductList.length,
                  itemBuilder: (context, position) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                            RouteHelper.getPopularFood(position, "FoodPage"));
                      },
                      child: _buildPageItem(position,
                          popularProducts.popularProductList[position]),
                    );
                  }));
        }),

        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty
                ? 1
                : popularProducts.popularProductList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),

        SizedBox(
          height: Dimensions.height10,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(
                width: Dimensions.width10,
              ),
              BigText(
                text: ".",
                color: Colors.black26,
              ),
              SizedBox(width: Dimensions.width10),
              SmallText(text: "Food Pairing")
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.height15,
        ),

        GetBuilder<RecommendedProductController>(
            builder: (recommendedProducts) {
          return recommendedProducts.isLoaded
              ? ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommendedProducts.recommendProductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                            RouteHelper.getRecommendedFood(index, 'home'));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                          bottom: Dimensions.height10,
                        ),
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
                                          recommendedProducts
                                              .recommendProductList[index].img!,
                                    ),
                                  )),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BigText(
                                        text: recommendedProducts
                                            .recommendProductList[index].name!),
                                    SizedBox(height: Dimensions.height10),
                                    SmallText(
                                        text: "With Chinese Characterstics"),
                                    SizedBox(
                                      height: Dimensions.height20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconAndText(
                                            icon: Icons.circle_sharp,
                                            text: "Normal",
                                            iconColor: AppColors.iconColor1),
                                        IconAndText(
                                            icon: Icons.location_on_outlined,
                                            text: "1.7 Km",
                                            iconColor: AppColors.mainColor),
                                        IconAndText(
                                            icon: Icons.access_time,
                                            text: "32 min",
                                            iconColor: AppColors.iconColor2),
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
                      ),
                    );
                  })
              : CircularProgressIndicator();
        }),
      ],
    );
  }

  Widget _buildPageItem(int index, popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor), 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.height220,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                image: DecorationImage(
                  image: NetworkImage(
                    // ignore: prefer_interpolation_to_compose_strings
                    AppConstants.UPLOAD_URL + popularProduct.img!,
                  ),
                  fit: BoxFit.cover,
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.height120,
              margin: EdgeInsets.all(Dimensions.radius30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: const Color.fromARGB(255, 255, 255, 255),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.6,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                  ]),
              child: Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.width15,
                    left: Dimensions.width15,
                    right: Dimensions.width15,
                  ),
                  child: AppColumn(
                    text: popularProduct.name!,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

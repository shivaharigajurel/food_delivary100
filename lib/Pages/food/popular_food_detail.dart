import 'package:flutter/material.dart';
import 'package:food_delivary/utilts/dimensions.dart';
import 'package:food_delivary/widgets/Icon_Widget.dart';
import 'package:food_delivary/widgets/exandable.dart';

import '../../utilts/colors.dart';
import '../../widgets/Column.dart';
import '../../widgets/Icon_and_text.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                image: AssetImage(
                  "assets/image/food0.png",
                ),
              )),
            ),
          ),
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconWidget(icon: Icons.arrow_back_ios),
                  IconWidget(icon: Icons.shopping_cart_outlined)
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
                  AppColumn(text: "Chinese Side"),
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
                        text:
                            "Chinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese SideChinese Side",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
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
                  width: Dimensions.width120 - 20,
                  decoration: BoxDecoration(
                    color: const Color(0xFFccc7c5),
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.remove),
                      SizedBox(width: Dimensions.width10 / 2),
                      BigText(text: "0"),
                      SizedBox(width: Dimensions.width10 / 2),
                      Icon(Icons.add),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: Dimensions.width10,
                    right: Dimensions.width10,
                  ),
                  height: Dimensions.height100,
                  width: Dimensions.width120 * 2 - 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFF89dad0),
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                  ),
                  child: Row(
                    children: [BigText(text: "\$ 0.08 Add To Card")],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

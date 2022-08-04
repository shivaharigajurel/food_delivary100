import 'package:flutter/material.dart';
import 'package:food_delivary/utilts/dimensions.dart';
import 'package:food_delivary/widgets/Icon_Widget.dart';
import 'package:food_delivary/widgets/exandable.dart';

import '../../utilts/colors.dart';
import '../../widgets/big_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: Dimensions.height45 * 2,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconWidget(icon: Icons.clear),
                IconWidget(icon: Icons.shopping_cart),
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
                    child:
                        BigText(size: Dimensions.font26, text: "Chinese Side")),
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
              background: Image.asset(
                "assets/image/food0.png",
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
                  text:
                      "Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side Chinese Side ",
                ),
              )
            ],
          ))
        ],
      ),
      bottomNavigationBar: Column(
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
                IconWidget(
                    size: Dimensions.height45,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.remove),
                BigText(
                  text: "\$12.88 " + " X " + " 0",
                  size: Dimensions.font30,
                ),
                IconWidget(
                    size: Dimensions.height45,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.add),
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
                    Container(
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
                        children: [BigText(text: "\$ 28 Add To Card")],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivary/controller/cart_controller.dart';
import 'package:food_delivary/utilts/dimensions.dart';
import 'package:food_delivary/widgets/Icon_Widget.dart';
import 'package:food_delivary/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../utilts/colors.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList();

    Map<String, int> cartItemsPerOrder = Map();

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }
    List<int> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<int> itemsPerOrder = cartOrderTimeToList();

    var ListCounter = 0;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            color: AppColors.mainColor,
            padding: EdgeInsets.only(top: 45, left: 15, right: 15, bottom: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(
                    text: "Cart History",
                    color: Colors.white,
                  ),
                  AppIcon(icon: Icons.shopping_cart_outlined),
                ]),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              child: ListView(
                children: [
                  for (int i = 0; i < itemsPerOrder.length; i++)
                    Container(
                      margin: EdgeInsets.only(
                        bottom: Dimensions.height20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(
                            text: "22/10/2022 10:00 AM",
                            color: Colors.black,
                          )
                        ],
                      ),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

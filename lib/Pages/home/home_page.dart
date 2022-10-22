import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivary/Pages/cart/cart_history.dart';
import 'package:food_delivary/Pages/cart/cart_page.dart';
import 'package:food_delivary/Pages/home/main_food_page.dart';

import '../../utilts/colors.dart';
import '../../utilts/dimensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List Pages = [
    const MainFoodPage(),
    const Text("Next page"),
    Container(
      child: const CartHistory(),
    ),
    Container(
      child: Text("Next next next page"),
    ),
  ];

  void onTapNev(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius15),
            topRight: Radius.circular(Dimensions.radius15),
          ),
        ),
        child: BottomNavigationBar(
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          onTap: onTapNev,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.archive_outlined), label: "history"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: "cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: "me"),
          ],
        ),
      ),
    );
  }
}

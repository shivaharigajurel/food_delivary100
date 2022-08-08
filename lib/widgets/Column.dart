import 'package:flutter/material.dart';

import '../utilts/colors.dart';
import '../utilts/dimensions.dart';
import 'Icon_and_text.dart';
import 'big_text.dart';
import 'small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  TextOverflow overFlow;

  AppColumn({
    Key? key,
    required this.text,
    this.overFlow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font26,
        ),
        SizedBox(height: Dimensions.height10),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                  (index) => Icon(
                        Icons.star,
                        color: AppColors.mainColor,
                        size: 15,
                      )),
            ),
            SizedBox(
              width: Dimensions.width10 - 1,
            ),
            SmallText(
              text: "4.5",
            ),
            SizedBox(
              width: Dimensions.width10 - 3,
            ),
            SmallText(
              text: "41564",
            ),
            SizedBox(
              width: Dimensions.width10 / 2,
            ),
            SmallText(
              text: "Comments",
            ),
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}

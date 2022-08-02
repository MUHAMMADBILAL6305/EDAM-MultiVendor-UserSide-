import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../utils/my_app_colors.dart';

class HomeCustomCatalog extends StatelessWidget {
  const HomeCustomCatalog(
      {Key? key,
      required this.titleText,
      required this.averageRate,
      required this.imagePath,
      required this.onTap,
      required this.vendorName,
      required this.calories,
      required this.grams,
      required this.price})
      : super(key: key);
  final Function() onTap;
  final String imagePath, titleText, vendorName;
  final double price, averageRate, calories, grams;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width * .8,
        // height: Get.height * .15,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.withOpacity(0.5))),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(1),
                  width: Get.width * .42,
                  height: Get.height * .15,
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black45),
                    borderRadius: BorderRadius.circular(9),
                    image: DecorationImage(
                        image: AssetImage(imagePath), fit: BoxFit.cover),
                  ),
                ),
                Container(
                  height: Get.height * .025,
                  width: Get.width * .15,
                  decoration: BoxDecoration(
                    color: MyAppColors.appPrimaryColor,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                  ),
                  child: Center(
                    child: Text(
                      "${grams.toString()} Grams",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.yellow,
                        fontSize: 8,
                          ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                    // width: Get.width * .32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: MyAppColors.appPrimaryColor)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9.0),
                        child: Text(
                          "\$${price.toString()}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: MyAppColors.appPrimaryColor),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: Get.width * .32,
                    child: Text(
                      titleText,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                    width: Get.width * .32,
                    // color: Colors.black45,
                    child: Text(
                      vendorName,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 12,
                          color: MyAppColors.guestButtonColor.withOpacity(.9)),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                    width: Get.width * .32,
                    child: Row(
                      children: [
                        RatingBarIndicator(
                          rating: averageRate,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: MyAppColors.appPrimaryColor,
                          ),
                          itemCount: 5,
                          itemSize: 15.0,
                          direction: Axis.horizontal,
                        ),
                        Text(
                          " ${averageRate.toString()}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_edam/demoData/catalog_data.dart';
import 'package:multi_vendor_edam/screens/my_widgets/my_large_button.dart';
import 'package:multi_vendor_edam/utils/my_app_colors.dart';

import 'title_price_rating.dart';

class ItemDetailBody extends StatelessWidget {
  const ItemDetailBody({Key? key, required this.index}) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(myDummyCatalogData[2].imagePath,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: MyAppColors.appPrimaryColor.withOpacity(0.2),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: <Widget>[
            Row(
            children: <Widget>[
              Icon(
              Icons.location_on,
              color: MyAppColors.guestButtonColor,
            ),
            const SizedBox(width: 10),
            Text(myDummyCatalogData[index].vendorName),
            ],
          ),
                TitlePriceRating(
                  name: myDummyCatalogData[index].name,
                  numOfReviews: 24,
                  rating: myDummyCatalogData[index].rating,
                  price: myDummyCatalogData[index].price,
                  // onRatingChanged: (value) {},
                ),
                 Text(
                  myDummyCatalogData[index].description,style: const TextStyle(
                    height: 1.5,
                  ),
                ),
                SizedBox(height: Get.height * 0.1),
                // Free space  10% of total height
                MyLargeButton(title: "Order Now", onTap: (){}, buttonColor: MyAppColors.appPrimaryColor),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
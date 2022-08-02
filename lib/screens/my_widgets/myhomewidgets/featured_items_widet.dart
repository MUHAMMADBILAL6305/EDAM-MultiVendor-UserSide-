import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_edam/utils/my_app_colors.dart';

import '../../../item_details/details-screen.dart';

class FeaturedItemsBuilder extends StatefulWidget {
  FeaturedItemsBuilder(
      {Key? key,
      required this.itemName,
      required this.imagePath,
      required this.isFavorite,
      required this.price,
      required this.gram,
      required this.calories,
      required this.index,
      required this.rating})
      : super(key: key);

  final String itemName, imagePath;
  bool isFavorite;
  final double price, gram, calories, rating;
  final int index;

  @override
  _FeaturedItemsBuilderState createState() => _FeaturedItemsBuilderState();
}

class _FeaturedItemsBuilderState extends State<FeaturedItemsBuilder> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ItemDetailsScreen(index: widget.index));
      },
      child: Container(
        // height: Get.height * .3,
        width: Get.width * .55,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(20),
            // boxShadow: [
            //   BoxShadow(
            //       color: Colors.grey.shade300,
            //       offset: const Offset(-2, -1),
            //       blurRadius: 5),
            // ],
        ),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Image.asset(widget.imagePath,
                        height: Get.height * .2),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.itemName,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.isFavorite = !widget.isFavorite;
                      });
                    },
                    child: Icon(
                      widget.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: MyAppColors.appPrimaryColor,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "${widget.gram.toString()} Grams",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("${widget.calories.toString()} Calories",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 12)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(widget.rating.toString()),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Icon(
                      Icons.star,
                      color: MyAppColors.appPrimaryColor,
                      size: 16,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    "\$${widget.price.toString()}",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: MyAppColors.appPrimaryColor),
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

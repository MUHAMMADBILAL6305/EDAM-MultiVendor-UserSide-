import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_edam/screens/vendor_profile/vendor_profile_screen.dart';
import 'package:multi_vendor_edam/utils/my_app_colors.dart';

import '../../../demoData/catalog_data.dart';
import '../../../item_details/details-screen.dart';

class ItemsGridBuilder extends StatefulWidget {
  ItemsGridBuilder(
      {Key? key,
      required this.itemName,
      required this.imagePath,
      required this.isFavorite,
      required this.price,
      required this.gram,
      required this.calories,
      required this.index,
      required this.rating,
      this.isInStocks = true})
      : super(key: key);

  final String itemName, imagePath;
  bool isFavorite;
  final bool isInStocks;
  final double price, gram, calories, rating;
  final int index;

  @override
  _ItemsGridBuilderState createState() => _ItemsGridBuilderState();
}

class _ItemsGridBuilderState extends State<ItemsGridBuilder> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: Get.height * .4,
      // height: 220,
      child: GestureDetector(
        onTap: () {
          Get.to(ItemDetailsScreen(index: widget.index));
        },
        child: Container(
          // height: Get.height * .5,
          width: Get.width * .4,
          padding: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade300,
                    offset: const Offset(-2, -1),
                    blurRadius: 5),
              ]),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Image.asset(
                        widget.imagePath,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            widget.isFavorite = !widget.isFavorite;
                          });
                        },
                        icon: Icon(
                          widget.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: MyAppColors.appPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    // color: Colors.black54,
                    width: Get.width * .29,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Text(
                        widget.itemName,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      "\$${(widget.price + 100).toString()}",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: MyAppColors.appPrimaryColor),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8),
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       setState(() {
                  //         widget.isFavorite = !widget.isFavorite;
                  //       });
                  //     },
                  //     child: Icon(
                  //       widget.isFavorite
                  //           ? Icons.favorite
                  //           : Icons.favorite_border_outlined,
                  //       color: MyAppColors.appPrimaryColor,
                  //     ),
                  //   ),
                  // )
                ],
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  myDummyCatalogData[widget.index].vendorName,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 12),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Availability",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(widget.isInStocks ? "InStock" : 'Not Available',
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
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: MyAppColors.appPrimaryColor)),
                    child: Center(
                      child: IconButton(
                        // color: Colors.black54,
                        onPressed: () {
                          Get.snackbar('Item Added to cart successfully...',
                              'You can check it out from MyCart',
                              snackPosition: SnackPosition.BOTTOM,
                              duration: const Duration(seconds: 1),
                              margin: const EdgeInsets.only(
                                  bottom: 12, left: 12, right: 12),
                              // overlayBlur: 2,
                              borderColor: MyAppColors.appPrimaryColor,
                              borderWidth: 1.5,
                              // overlayColor: Colors.black45,
                              backgroundColor:
                                  MyAppColors.appPrimaryColor.withOpacity(0.3));
                        },
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                          color: MyAppColors.appPrimaryColor,
                          size: 23,
                        ),
                      ),
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: ElevatedButton.icon(
                          onPressed: () {
                            Get.to(VendorProfileScreen(index: 4));
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            size: 15,
                          ),
                          label: const Text(
                            'Visit Shop',
                            style: TextStyle(fontSize: 11),
                          )),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

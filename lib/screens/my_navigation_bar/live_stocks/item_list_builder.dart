import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../item_details/details-screen.dart';
import '../../../utils/my_app_colors.dart';
import '../../vendor_profile/vendor_profile_screen.dart';

class ItemsListBuilder extends StatefulWidget {
  ItemsListBuilder(
      {Key? key,
      required this.titleText,
      required this.averageRate,
      required this.imagePath,
      required this.onTap,
      required this.vendorName,
      required this.price,
      required this.isFavorite, required this.index})
      : super(key: key);
  final Function() onTap;
  final String imagePath, titleText, vendorName;
  final double price, averageRate;
  bool isFavorite;
  final int index;

  @override
  State<ItemsListBuilder> createState() => _ItemsListBuilderState();
}

class _ItemsListBuilderState extends State<ItemsListBuilder> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: Get.width * .8,
        // height: Get.height * .15,
        margin: const EdgeInsets.symmetric(horizontal: 6),
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
                    // color: Colors.black54,
                    // border: Border.all(color: Colors.black45),
                    borderRadius: BorderRadius.circular(9),
                    image: DecorationImage(
                        image: AssetImage(widget.imagePath),
                        fit: BoxFit.fitWidth),
                  ),
                ),
                Container(
                  // height: Get.height * .05,
                  // width: Get.width * .1,
                  margin: const EdgeInsets.only(left: 1.5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    border: Border.all(
                        width: 0.5, color: MyAppColors.appPrimaryColor),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                  ),
                  child: Center(
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
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      // width: Get.width * .32,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: MyAppColors.appPrimaryColor)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 9.0),
                          child: Text(
                            "\$${widget.price.toString()}",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: MyAppColors.appPrimaryColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Container(
                    width: Get.width * .32,
                    child: Text(
                      widget.titleText,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Container(
                    width: Get.width * .32,
                    // color: Colors.black45,
                    child: Text(
                      widget.vendorName,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 12,
                          color: MyAppColors.guestButtonColor.withOpacity(.9)),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),                  Container(
                    width: Get.width * .32,
                    // color: Colors.black45,
                    child: Text(
                   'In Stock',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 12,
                          color: MyAppColors.guestButtonColor.withOpacity(.9)),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Container(
                    width: Get.width * .32,
                    child: Row(
                      children: [
                        RatingBarIndicator(
                          rating: widget.averageRate,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: MyAppColors.appPrimaryColor,
                          ),
                          itemCount: 5,
                          itemSize: 15.0,
                          direction: Axis.horizontal,
                        ),
                        Text(
                          " ${widget.averageRate.toString()}",
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
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
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
                  child:listIconButton(myIcon: Icons.shopping_cart_outlined,context: context)
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Get.to(VendorProfileScreen(index: 5));


                  },
                  child: listIconButton(myIcon: Icons.arrow_forward_ios, context: context)
                ),

                // Directionality(
                //   textDirection: TextDirection.rtl,
                //   child: Container(
                //     margin: EdgeInsets.only(left: 5),
                //     child: ElevatedButton.icon(
                //         onPressed: () {},
                //         icon: Icon(
                //           Icons.arrow_back_ios,
                //           size: 15,
                //         ),
                //         label: Text(
                //           'Visit Shop',
                //           style: TextStyle(fontSize: 11),
                //         )),
                //   ),
                // )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget listIconButton({required IconData myIcon,required BuildContext context}){
  return Container(
    height: 35,
    width: 40,
    decoration: BoxDecoration(
      color: Theme.of(context).backgroundColor,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: MyAppColors.appPrimaryColor),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          offset: Offset(
            .5,
            1.0,
          ),
          blurRadius: 2.0,
          spreadRadius: .3,
        ), // //BoxShadow
      ],
    ),
    child: Center(
      child: Icon(
        myIcon,
        color: MyAppColors.appPrimaryColor,
        size: 20,
      ),
    ),
  );
}
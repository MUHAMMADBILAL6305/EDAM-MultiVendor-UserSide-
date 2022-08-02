import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_edam/check_out_details/check_out_details.dart';
import 'package:multi_vendor_edam/demoData/catalog_data.dart';
import 'package:multi_vendor_edam/item_details/details-screen.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';
import '../../../theme_shared_preferences/theme_provider.dart';
import '../../../utils/my_app_colors.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({Key? key, required this.pageTitle}) : super(key: key);

  final String pageTitle;

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  int index = 2;

  @override
  void initState() {
    for (int i = 0; i < 3; i++) {
      subTotal += myDummyCatalogData[i].price;
    }
  }

  double subTotal = 0, total = 0;

  @override
  Widget build(BuildContext context) {
    total = subTotal + 20;
    var themeNotifier = Provider.of<MyThemeModel>(context);
    return Scaffold(
      backgroundColor: themeNotifier.isDark
          ? Theme.of(context).primaryColorDark.withOpacity(0.42)
          : Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          widget.pageTitle,
          style: Theme.of(context).textTheme.headline6,
        ),
        actionsIconTheme: Theme.of(context).appBarTheme.actionsIconTheme,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).iconTheme.color,
            size: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: JumpingText(
              'Edam',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: MyAppColors.appPrimaryColor),
            ),
          )
        ],
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              color: Colors.grey.withOpacity(0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total 3 items',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 16),
                  ),
                  TextButton(onPressed: () {}, child: const Text('CLEAR CART'))
                ],
              ),
            ),

            ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (_, index) {
                  return CustomCartItem(
                      titleText: myDummyCatalogData[index].name,
                      averageRate: myDummyCatalogData[index].rating,
                      imagePath: myDummyCatalogData[index].imagePath,
                      onTap: () {},
                      vendorName: myDummyCatalogData[index].vendorName,
                      calories: myDummyCatalogData[index].calories,
                      grams: myDummyCatalogData[index].grams,
                      price: myDummyCatalogData[index].price);
                }),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * .05,
                  ),
                  Divider(
                    color: MyAppColors.appSecondaryColor.withOpacity(0.5),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                    color: Colors.grey.withOpacity(0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sub Total:',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(fontSize: 16),
                        ),
                        Text(
                          '\$${subTotal.toString()}',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                  color: MyAppColors.appSecondaryColor,
                                  fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                    color: Colors.grey.withOpacity(0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Fee:',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(fontSize: 16),
                        ),
                        Text(
                          '\$20',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                  color: MyAppColors.appSecondaryColor,
                                  fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                    color: Colors.grey.withOpacity(0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total:',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(fontSize: 16),
                        ),
                        Text(
                          '\$${total.toString()}',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                  color: MyAppColors.appSecondaryColor,
                                  fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: MyAppColors.appSecondaryColor.withOpacity(0.5),
                  ),
                  SizedBox(height: Get.height * .01),
                  MyTextIconButton(
                    titleTxt: 'CheckOut',
                    bgColor: MyAppColors.appPrimaryColor,
                    txtColor: Colors.white,
                    borderColor: MyAppColors.appPrimaryColor,
                    myIcon: Icons.arrow_forward_ios,
                    onTap: () {
                      Get.off(CheckOutDetails(total: total,subTotal: subTotal,));
                    },
                  ),
                  SizedBox(height: Get.height * .01),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCartItem extends StatefulWidget {
  const CustomCartItem(
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
  State<CustomCartItem> createState() => _CustomCartItemState();
}

class _CustomCartItemState extends State<CustomCartItem> {
  double quantity = .5, total = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: double.infinity,
        // height: Get.height * .15,
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.withOpacity(0.5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(1),
              width: Get.width * .42,
              height: Get.height * .15,
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.black45),
                borderRadius: BorderRadius.circular(9),
                image: DecorationImage(
                    image: AssetImage(widget.imagePath), fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    width: Get.width * .32,
                    child: Text(
                      widget.titleText,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  SizedBox(
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
                    height: 6,
                  ),
                  SizedBox(
                    width: Get.width * .32,
                    child: Row(
                      children: [
                        Text(
                          "Quantity: ${quantity.toString()}kg",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    width: Get.width * .32,
                    child: Row(
                      children: [
                        Text(
                          " Total: \$$totalCalculation",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    width: Get.width * .32,
                    child: Row(
                      children: [
                        QuantityButton(
                            myIcon: Icons.remove,
                            bgColor: MyAppColors.guestButtonColor,
                            iconColor: Colors.black45,
                            borderColor: MyAppColors.appSecondaryColor,
                            onTap: () {
                              setState(() {
                                if (quantity >= 1) {
                                  quantity = quantity - .5;
                                } else if (quantity == 0.5) {
                                  Get.snackbar('Minimum Quantity is 0.5 !',
                                      'Cannot be decreased than 0.5',
                                      snackPosition: SnackPosition.BOTTOM,
                                      duration: const Duration(seconds: 1),
                                      margin: const EdgeInsets.only(
                                          bottom: 12, left: 12, right: 12),
                                      // overlayBlur: 2,
                                      borderColor: MyAppColors.appPrimaryColor,
                                      borderWidth: 1.5,
                                      // overlayColor: Colors.black45,
                                      backgroundColor: MyAppColors
                                          .appPrimaryColor
                                          .withOpacity(0.3));
                                }
                              });
                            }),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: Text(
                            " ${quantity}kg",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 10),
                          ),
                        ),
                        QuantityButton(
                            myIcon: Icons.add,
                            bgColor: MyAppColors.guestButtonColor,
                            iconColor: Colors.black45,
                            borderColor: MyAppColors.appSecondaryColor,
                            onTap: () {
                              setState(() {
                                quantity = quantity + .5;
                              });
                            })
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
                Container(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    "\$${widget.price.toString()}",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16, color: MyAppColors.appPrimaryColor),
                  ),
                ),
                SizedBox(height: Get.height * .06),
                InkWell(
                  onTap: () {
                    Get.snackbar(widget.titleText, 'Item deleted successful',
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
                  child: Icon(
                    Icons.delete_outline,
                    color: MyAppColors.appSecondaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String get totalCalculation {
    total = quantity * widget.price;
    return total.toStringAsFixed(2);
  }
}

class QuantityButton extends StatelessWidget {
  const QuantityButton(
      {Key? key,
      required this.myIcon,
      required this.bgColor,
      required this.iconColor,
      required this.borderColor,
      required this.onTap})
      : super(key: key);

  final IconData myIcon;
  final Color bgColor, iconColor, borderColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(
                1.5,
                1.5,
              ),
              blurRadius: 1.0,
              spreadRadius: .2,
            ), //B//BoxShadow
          ],
          border: Border.all(color: borderColor.withOpacity(.2)),
          borderRadius: BorderRadius.circular(20),
          color: bgColor,
        ),
        child: Icon(
          myIcon,
          color: iconColor,
        ),
      ),
    );
  }
}

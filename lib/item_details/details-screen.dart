import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_edam/check_out_details/check_out_details.dart';
import '../demoData/catalog_data.dart';
import '../utils/my_app_colors.dart';
import 'components/title_price_rating.dart';

class ItemDetailsScreen extends StatefulWidget {
  const ItemDetailsScreen({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  double quantity = 0.5, total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      // appBar: detailsAppBar(),
      body: Column(
        children: <Widget>[
          SizedBox(height: Get.height * .05),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back_ios)),
                IconButton(
                  onPressed: () {
                    setState(() {
                      myDummyCatalogData[widget.index].isFavorite =
                          !myDummyCatalogData[widget.index].isFavorite;
                    });
                  },
                  icon: Icon(
                    myDummyCatalogData[widget.index].isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: MyAppColors.appPrimaryColor,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            // color: MyAppColors.appPrimaryColor.withOpacity(0.15),
            child: Image.asset(
              myDummyCatalogData[widget.index].imagePath,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                      const SizedBox(width: 6),
                      Text(myDummyCatalogData[widget.index].vendorName),
                    ],
                  ),
                  TitlePriceRating(
                    name: myDummyCatalogData[widget.index].name,
                    numOfReviews: 24,
                    rating: myDummyCatalogData[widget.index].rating,
                    price: myDummyCatalogData[widget.index].price,
                    // onRatingChanged: (value) {},
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black45.withOpacity(0.05))),
                    height: Get.height * .25,
                    child: SingleChildScrollView(
                      child: Text(
                        "${myDummyCatalogData[widget.index].description}",
                        style: const TextStyle(
                          height: 1.5,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  Row(
                    children: [
                      QuantityIconButton(
                          myIcon: Icons.remove,
                          bgColor: MyAppColors.guestButtonColor,
                          iconColor: Colors.black45,
                          borderColor:
                              MyAppColors.appSecondaryColor.withOpacity(.2),
                          onTap: () {
                            setState(() {
                              if (quantity >= 1) {
                                quantity = (quantity - .5);
                              } else if (quantity == .5) {
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
                                    backgroundColor: MyAppColors.appPrimaryColor
                                        .withOpacity(0.3));
                              }
                            });
                          }),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text('${quantity}kg'),
                      ),
                      QuantityIconButton(
                          myIcon: Icons.add,
                          bgColor: MyAppColors.guestButtonColor,
                          iconColor: Colors.black45,
                          borderColor:
                              MyAppColors.appSecondaryColor.withOpacity(.2),
                          onTap: () {
                            setState(() {
                              quantity = (quantity + .5);
                            });
                          }),
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.only(right: 5),
                        child: Text(
                          textAlign: TextAlign.right,
                          'Total: \$$totalCalculation',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: MyAppColors.appSecondaryColor),
                        ),
                      ))
                    ],
                  ),
                  SizedBox(height: Get.height * 0.03),
                  // Free space  10% of total height
                  Row(
                    children: [
                      MyTextIconButton(
                        titleTxt: 'Add',
                        bgColor: MyAppColors.guestButtonColor,
                        borderColor: MyAppColors.appPrimaryColor,
                        txtColor: Colors.black45,
                        myIcon: Icons.add_shopping_cart_outlined,
                        onTap: () {
                          ///todo from here

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
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: MyTextIconButton(
                          titleTxt: "Order Now",
                          onTap: () {
                            Get.to(CheckOutDetails(
                              total: double.parse(totalCalculation),
                              subTotal: double.parse(totalCalculation),
                            ));
                          },
                          bgColor: MyAppColors.appPrimaryColor,
                          borderColor: MyAppColors.appPrimaryColor,
                          myIcon: Icons.arrow_forward_ios,
                          txtColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String get totalCalculation {
    total = quantity * myDummyCatalogData[widget.index].price;
    return total.toStringAsFixed(2);
  }
}

class QuantityIconButton extends StatelessWidget {
  const QuantityIconButton(
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
        padding: const EdgeInsets.all(5),
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

class MyTextIconButton extends StatelessWidget {
  const MyTextIconButton({
    Key? key,
    required this.titleTxt,
    required this.bgColor,
    required this.txtColor,
    required this.borderColor,
    required this.onTap,
    required this.myIcon,
    this.isBack = false,
  }) : super(key: key);

  final bool isBack;
  final IconData myIcon;
  final String titleTxt;
  final Color bgColor, txtColor, borderColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(20),
          color: bgColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(
                1.0,
                2.0,
              ),
              blurRadius: 3.0,
              spreadRadius: .5,
            ), //BoxShadow
            // BoxShadow(
            //   color: Colors.white,
            //   offset: Offset(0.0, 0.0),
            //   blurRadius: 0.0,
            //   spreadRadius: 0.0,
            // ), //BoxShadow
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isBack
                ? Icon(
                    myIcon,
                    color: txtColor,
                    size: 20,
                  )
                : Container(),
            isBack
                ? const SizedBox(width: 4)
                : const SizedBox(
                    width: 0,
                  ),
            Text(
              titleTxt,
              style: TextStyle(
                  color: txtColor,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600),
            ),
            isBack
                ? const SizedBox(
                    width: 0,
                  )
                : const SizedBox(width: 4),
            isBack
                ? Container()
                : Icon(
                    myIcon,
                    color: txtColor,
                    size: 20,
                  ),
          ],
        ),
      ),
    );
  }
}

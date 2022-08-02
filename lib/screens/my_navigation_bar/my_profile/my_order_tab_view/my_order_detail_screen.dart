import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_edam/demoData/addresses_demo_data.dart';
import 'package:multi_vendor_edam/demoData/catalog_data.dart';
import 'package:multi_vendor_edam/demoData/orders_data.dart';
import 'package:multi_vendor_edam/item_details/details-screen.dart';
import 'package:multi_vendor_edam/screens/my_navigation_bar/my_profile/my_chats/single_chat_screen.dart';
import 'package:multi_vendor_edam/utils/my_app_colors.dart';
import 'package:progress_indicators/progress_indicators.dart';

class MyOrderDetailScreen extends StatelessWidget {
  const MyOrderDetailScreen({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        foregroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Order Summery",
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Theme.of(context).iconTheme.color,
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
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Actions",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: Get.height * .01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyTextIconButton(
                      titleTxt: 'Vendor Chat',
                      bgColor: MyAppColors.appPrimaryColor,
                      txtColor: Colors.white,
                      borderColor: MyAppColors.guestButtonColor,
                      onTap: () {
                        Get.to(SingleChatScreen(index));
                      },
                      myIcon: Icons.chat),
                  MyTextIconButton(
                      titleTxt: 'Cancel Order',
                      bgColor: MyAppColors.guestButtonColor,
                      txtColor: MyAppColors.appPrimaryColor,
                      borderColor: MyAppColors.appPrimaryColor,
                      onTap: () {

                      },
                      myIcon: Icons.cancel_outlined),
                ],
              ),
              SizedBox(height: Get.height * .03),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Order's Detail",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: MyAppColors.appPrimaryColor.withOpacity(.2)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(1, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Order#"),
                        Text(myOrdersDemoData[index].orderNo.toString()),
                      ],
                    ),
                    SizedBox(height: Get.height * .01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Order Date"),
                        Text(myOrdersDemoData[index].orderDate),
                      ],
                    ),
                    SizedBox(height: Get.height * .01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Order Total"),
                        Text(
                            "\$${myOrdersDemoData[index].totalPayment.toString()}"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height * .02),

              ///Payment detail
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Payment's Detail",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: MyAppColors.appPrimaryColor.withOpacity(.2)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(1, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Payment Method",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    Text(myOrdersDemoData[index].paymentMethod.toString()),
                  ],
                ),
              ),
              SizedBox(height: Get.height * .02),

              ///Shipping detail
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Shipping Address",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: MyAppColors.appPrimaryColor.withOpacity(.2)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(1, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * .7,
                      child: Text(
                        myAddressesDemoData[1].titleName,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: Get.width * .7,
                      margin: const EdgeInsets.only(bottom: 4),
                      padding: const EdgeInsets.only(left: 14),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on_outlined, color: Colors.grey),
                          Container(
                            padding: const EdgeInsets.only(left: 8),
                            width: Get.width * .58,
                            child: Text(
                              myAddressesDemoData[1].streetAddress +
                                  '. ' +
                                  myAddressesDemoData[1].town +
                                  ', ' +
                                  myAddressesDemoData[1].countryName +
                                  ' ' +
                                  myAddressesDemoData[1].postCode,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: Get.width * .7,
                      margin: const EdgeInsets.only(bottom: 4),
// color: Colors.black45,
                      padding: const EdgeInsets.only(left: 18),
                      child: Row(
                        children: [
                          const Icon(Icons.attach_email_outlined,
                              color: Colors.grey, size: 18),
                          Container(
                            padding: const EdgeInsets.only(left: 8),
                            width: Get.width * .58,
                            child: Text(
                              myAddressesDemoData[1].email,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: Get.width * .7,
                      margin: const EdgeInsets.only(bottom: 4),
// color: Colors.black45,
                      padding: const EdgeInsets.only(left: 18),
                      child: Row(
                        children: [
                          const Icon(Icons.phone, size: 18, color: Colors.grey),
                          Container(
                            padding: const EdgeInsets.only(left: 8),
                            width: Get.width * .58,
                            child: Text(
                              myAddressesDemoData[1].phoneNo,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),



                // child: Column(
                //   children: [
                //     Row(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Text("Address   : "),
                //         Container(
                //           // color: Colors.black54,
                //           width: Get.width * .65,
                //           child: Text(
                //             "New Gulberg Colony, House no 4 main street, Islamabad",
                //             textAlign: TextAlign.justify,
                //           ),
                //         ),
                //       ],
                //     ),
                //     SizedBox(height: Get.height * .01),
                //     Row(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Text("Phone No : "),
                //         Container(
                //           // color: Colors.black54,
                //           width: Get.width * .65,
                //           child: Text(
                //             "0123456789",
                //             textAlign: TextAlign.justify,
                //           ),
                //         ),
                //       ],
                //     ),
                //     SizedBox(height: Get.height * .01),
                //     Row(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Text("Email add : "),
                //         Container(
                //           // color: Colors.black54,
                //           width: Get.width * .65,
                //           child: Text(
                //             "test@gmail.com",
                //             textAlign: TextAlign.justify,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
              ),
              SizedBox(height: Get.height * .02),

              ///Item detail
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Items Detail",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: MyAppColors.appPrimaryColor.withOpacity(.2)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset:
                            const Offset(1, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ListView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Item# ${index + 1}'),
                            ItemDetail(
                              titleText: myDummyCatalogData[index].name,
                              averageRate: myDummyCatalogData[index].rating,
                              imagePath: myDummyCatalogData[index].imagePath,
                              vendorName: myDummyCatalogData[index].vendorName,
                              price: myDummyCatalogData[index].price,
                              quantity: 2.5,
                            ),
                            SizedBox(
                              height: Get.height * .01,
                            )
                          ],
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemDetail extends StatelessWidget {
  const ItemDetail(
      {Key? key,
      required this.titleText,
      required this.averageRate,
      required this.imagePath,
      required this.vendorName,
      required this.price,
      required this.quantity})
      : super(key: key);
  final String imagePath, titleText, vendorName;
  final double price, averageRate, quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: Get.height * .15,
      margin: const EdgeInsets.symmetric(vertical: 4),
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
                  image: AssetImage(imagePath), fit: BoxFit.cover),
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
                  width: Get.width * .38,
                  child: Text(
                    titleText,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: Get.width * .38,
                  child: Text(
                    vendorName,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 14,
                        color: MyAppColors.guestButtonColor.withOpacity(.9)),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: Get.width * .38,
                  child: Row(
                    children: [
                      Text(
                        "Quantity: ${quantity.toString()}kg",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 14),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: Get.width * .38,
                  child: Row(
                    children: [
                      Text(
                        "SubTotal: \$12",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  width: Get.width * .38,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.star,
                          size: 18, color: MyAppColors.appPrimaryColor),
                      Text(
                        averageRate.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

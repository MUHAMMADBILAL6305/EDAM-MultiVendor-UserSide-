import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_edam/demoData/addresses_demo_data.dart';
import 'package:multi_vendor_edam/item_details/details-screen.dart';
import 'package:multi_vendor_edam/screens/my_navigation_bar/my_navbar.dart';
import 'package:multi_vendor_edam/screens/my_navigation_bar/my_profile/my_order_tab_view/tab_layout_order.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';

import '../screens/my_navigation_bar/my_profile/my_shipping_address/my_address_screen.dart';
import '../theme_shared_preferences/theme_provider.dart';
import '../utils/my_app_colors.dart';

class CheckOutDetails extends StatelessWidget {
  const CheckOutDetails({Key? key, required this.total, required this.subTotal})
      : super(key: key);

  final double total, subTotal;

  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<MyThemeModel>(context);
    return Scaffold(
      backgroundColor: themeNotifier.isDark
          ? Theme.of(context).backgroundColor
          : Colors.grey.shade200,
      appBar: AppBar(
        title: Text(
          'Check-Out Details',
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
      body: CheckOutSteps(
        subTotal: subTotal,
        total: total,
      ),
    );
  }
}

enum DeliveryType { delivery, pickUp }

enum PaymentMethods { byWallet, cashOnDelivery }

class CheckOutSteps extends StatefulWidget {
  const CheckOutSteps({Key? key, required this.total, required this.subTotal})
      : super(key: key);

  final double total, subTotal;

  @override
  _CheckOutStepsState createState() => _CheckOutStepsState();
}

class _CheckOutStepsState extends State<CheckOutSteps> {
// we have initialized active step to 0 so that
// our stepper widget will start from first step
  int _activeCurrentStep = 0;

  // String myShippingAddress = 'Sawan garden 123, Islamabad, Pakistan';
  DeliveryType _deliveryType = DeliveryType.delivery;

  PaymentMethods _paymentMethods = PaymentMethods.byWallet;

// Here we have created list of steps
// that are required to complete the form
  List<Step> stepList() => [
        // This is step1 which is called Account.
        // Here we will fill our personal details
        Step(
          state:
              _activeCurrentStep <= 0 ? StepState.indexed : StepState.complete,
          isActive: _activeCurrentStep >= 0,
          title: Text(
            'Delivery',
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12),
          ),
          content: Container(
            // color: Colors.black54.withOpacity(0.1),
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Delivery Address",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                RadioListTile(
                  value: DeliveryType.delivery,
                  groupValue: _deliveryType,
                  onChanged: (DeliveryType? value) {
                    setState(() {
                      _deliveryType = value!;
                    });
                  },
                  title: const Text("Delivery"),
                  subtitle: Text(
                    'Will be shipped to your door',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .color!
                            .withOpacity(0.5),
                        fontSize: 12),
                  ),
                  secondary: const Icon(Icons.delivery_dining),
                  toggleable: true,
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
                RadioListTile(
                  value: DeliveryType.pickUp,
                  groupValue: _deliveryType,
                  onChanged: (DeliveryType? value) {
                    setState(() {
                      _deliveryType = value!;
                    });
                  },
                  title: const Text("Pick Up"),
                  subtitle: Text(
                    "PickUp by your own",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .color!
                            .withOpacity(0.5),
                        fontSize: 12),
                  ),
                  secondary: const Icon(Icons.person_pin_circle_outlined),
                  toggleable: true,
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
                _deliveryType == DeliveryType.delivery
                    ? Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          // side: BorderSide(
                          //   color: Colors.black,
                          // ),
                        ),
                        elevation: 2,
                        shadowColor: Colors.grey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 14, right: 22, top: 14, bottom: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: Get.width * .6,
// color: Colors.black45,
                                    child: Text(
                                      myAddressesDemoData[1].titleName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(const AddAddressScreen(
                                        pageTitle: 'Your Shipping Address',
                                      ));
                                    },
                                    child: Text(
                                      'Change',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                              // decoration: TextDecoration.underline,
                                              color:
                                                  MyAppColors.appPrimaryColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: Get.width * .7,
                              margin: const EdgeInsets.only(bottom: 4),
                              padding: const EdgeInsets.only(left: 14),
                              child: Row(
                                children: [
                                  const Icon(Icons.location_on_outlined,
                                      color: Colors.grey),
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
                                      style:
                                          const TextStyle(color: Colors.grey),
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
                                      style:
                                          const TextStyle(color: Colors.grey),
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
                                  const Icon(Icons.phone,
                                      size: 18, color: Colors.grey),
                                  Container(
                                    padding: const EdgeInsets.only(left: 8),
                                    width: Get.width * .58,
                                    child: Text(
                                      myAddressesDemoData[1].phoneNo,
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      )
                    : Container(),
                _deliveryType == DeliveryType.delivery
                    ? SizedBox(height: Get.height * .015)
                    : SizedBox(height: Get.height * .275),

                Column(
                  children: [
                    SizedBox(
                      height: Get.height * .05,
                    ),
                    Divider(
                      color: MyAppColors.appSecondaryColor.withOpacity(0.5),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 12),
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
                            '\$${widget.subTotal.toString()}',
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
                    _deliveryType == DeliveryType.delivery
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 12),
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
                          )
                        : Container(),
                    _deliveryType == DeliveryType.delivery
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 12),
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
                                  '\$${widget.total.toString()}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                          color: MyAppColors.appSecondaryColor,
                                          fontSize: 16),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                    Divider(
                      color: MyAppColors.appSecondaryColor.withOpacity(0.5),
                    ),
                    SizedBox(height: Get.height * .01),
                  ],
                )

                ///todo from here for step 1 Delivery
              ],
            ),
          ),
        ),
        // This is Step2 here we will enter our address
        Step(
          state:
              _activeCurrentStep <= 1 ? StepState.indexed : StepState.complete,
          isActive: _activeCurrentStep >= 1,
          title: Text(
            'Payment',
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12),
          ),
          content: Container(
            // color: Colors.black54.withOpacity(0.1),
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Payment Information",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    // side: BorderSide(
                    //   color: Colors.black,
                    // ),
                  ),
                  elevation: 2,
                  shadowColor: Colors.grey,
                  child: RadioListTile(
                    value: PaymentMethods.byWallet,
                    groupValue: _paymentMethods,
                    onChanged: (PaymentMethods? value) {
                      setState(() {
                        _paymentMethods = value!;
                      });
                    },
                    title: const Text("Wallet"),
                    subtitle: Text(
                      "\$5400",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .color!
                              .withOpacity(0.5),
                          fontSize: 12),
                    ),
                    secondary: const Icon(Icons.wallet_outlined),
                    toggleable: true,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    // side: BorderSide(
                    //   color: Colors.black,
                    // ),
                  ),
                  elevation: 2,
                  shadowColor: Colors.grey,
                  child: RadioListTile(
                    value: PaymentMethods.cashOnDelivery,
                    groupValue: _paymentMethods,
                    onChanged: (PaymentMethods? value) {
                      setState(() {
                        _paymentMethods = value!;
                      });
                    },
                    title: const Text("Cash on Delivery"),
                    subtitle: Text(
                      "Cash payment after item is delivered",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .color!
                              .withOpacity(0.5),
                          fontSize: 12),
                    ),
                    secondary: const Icon(Icons.money),
                    toggleable: true,
                    controlAffinity: ListTileControlAffinity.trailing,
                  ),
                ),
                SizedBox(
                  height: Get.height * .05,
                ),

                _paymentMethods == PaymentMethods.byWallet
                    ? Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Apply Coupon",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 2,
                            shadowColor: Colors.grey,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: 'Enter coupon code here...',
                                      hintStyle: TextStyle(
                                          fontSize: 13,
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .color!
                                              .withOpacity(0.4)),
                                      border: InputBorder.none)),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              onPressed: () {
                                // Get.to(MyNavBar());
                              },
                              child: const Text('Apply'),
                            ),
                          ),
                        ],
                      )
                    : Container(),
                _paymentMethods == PaymentMethods.byWallet
                    ? SizedBox(height: Get.height * .2)
                    : SizedBox(height: Get.height * .363),

                ///todo from here for step2 Payments
              ],
            ),
          ),
        ),

        // This is Step3 here we will display all the details
        // that are entered by the user
        Step(
          state: StepState.indexed,
          isActive: _activeCurrentStep >= 2,
          title: Text(
            'Completed',
            style:
                Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: Get.height * .3,
                width: Get.width * .2,
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/JobDone.png'))),
              ),
              // SizedBox()
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                color: MyAppColors.guestButtonColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Congratulation It's ordered!",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: Get.height * .01),
                    Text(
                      "Order#: 6995",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
              SizedBox(height: Get.height * .05),
              Text(
                "You've successfully placed the order",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: Get.height * .01),
              const Text(
                "You can check status of your order by orders section of our application.",
                textAlign: TextAlign.start,
                // style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: Get.height * .1)
            ],
          ),
        )
      ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: MyAppColors.appPrimaryColor),
          primaryColor: MyAppColors.appPrimaryColor),
      child: Stepper(
        type: StepperType.horizontal,
        currentStep: _activeCurrentStep,
        steps: stepList(),
        controlsBuilder: (context, _) {
          return Row(
            children: <Widget>[
              MyTextIconButton(
                titleTxt: _activeCurrentStep == 2 ? 'Goto Home' : 'Back',
                bgColor: MyAppColors.appPrimaryColor,
                txtColor: Colors.white,
                borderColor: MyAppColors.appPrimaryColor,
                myIcon: Icons.arrow_back_ios_outlined,
                isBack: true,
                onTap: () {
                  if (_activeCurrentStep == 0) {
                    Get.back();
                  }
                  if (_activeCurrentStep == 2) Get.off(const MyNavBar());
                  setState(() {
                    _activeCurrentStep -= 1;
                  });
                },
              ),
              SizedBox(width: Get.width * .05),
              Expanded(
                child: MyTextIconButton(
                  titleTxt: _activeCurrentStep == 2 ? ' My Orders' : 'Confirm',
                  bgColor: MyAppColors.appPrimaryColor,
                  txtColor: Colors.white,
                  borderColor: MyAppColors.appPrimaryColor,
                  myIcon: Icons.arrow_forward_ios,
                  onTap: () {
                    if (_activeCurrentStep < (stepList().length - 1)) {
                      setState(() {
                        _activeCurrentStep += 1;
                      });
                    } else if (_activeCurrentStep == 2) {
                      Get.off(const MyOrdersTabLayout());
                    }
                  },
                ),
              ),
            ],
          );
        },

        physics: const BouncingScrollPhysics(),
        // onStepContinue takes us to the next step
        // onStepContinue: () {
        //   if (_activeCurrentStep < (stepList().length - 1)) {
        //     setState(() {
        //       _activeCurrentStep += 1;
        //     });
        //   }
        // },

        // onStepCancel takes us to the previous step
        // onStepCancel: () {
        //   if (_activeCurrentStep == 0) {
        //     return;
        //   }
        //
        //   setState(() {
        //     _activeCurrentStep -= 1;
        //   });
        // },

        // onStepTap allows to directly click on the particular step we want
        // onStepTapped: (int index) {
        //   setState(() {
        //     _activeCurrentStep = index;
        //   });
        // },
      ),
    );
  }
}

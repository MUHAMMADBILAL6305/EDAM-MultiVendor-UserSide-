import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_edam/screens/my_navigation_bar/my_profile/my_shipping_address/delet_confirmation_dialog.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';
import '../../../../demoData/addresses_demo_data.dart';
import '../../../../theme_shared_preferences/theme_provider.dart';
import '../../../../utils/my_app_colors.dart';
import '../../../my_widgets/my_large_button.dart';
import '../../../my_widgets/my_text_field.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key, required this.pageTitle}) : super(key: key);

  final String pageTitle;

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  @override
  Widget build(BuildContext context) {
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
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              enableDrag: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return AddressBottomSheetForm();
              });
        },
        backgroundColor: MyAppColors.appPrimaryColor,
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  border: Border(
                      bottom: BorderSide(
                          color:
                              MyAppColors.appPrimaryColor.withOpacity(0.1)))),
              child: Text(
                'Total ${myAddressesDemoData.length} addresses',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 16),
              ),
            ),
            ListView.builder(
              itemCount: myAddressesDemoData.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return myAddressBuilder(
                  context: context,
                  titleName: myAddressesDemoData[index].titleName,
                  streetAddress: myAddressesDemoData[index].streetAddress,
                  town: myAddressesDemoData[index].town,
                  countryName: myAddressesDemoData[index].countryName,
                  postCode: myAddressesDemoData[index].postCode,
                  email: myAddressesDemoData[index].email,
                  phoneNo: myAddressesDemoData[index].phoneNo,
                  isDefault:
                      myAddressesDemoData[index].isDefaultShippingAddress,
                  index: index,
                  onChange: (bool? isDefault) {
                    setState(() {
                      for (int i = 0;
                          i <= myAddressesDemoData.length - 1;
                          i++) {
                        if (i == index) {
                          myAddressesDemoData[index].isDefaultShippingAddress =
                              isDefault!;
                        } else {
                          myAddressesDemoData[i].isDefaultShippingAddress =
                              false;
                        }
                      }
                    });
                  },
                );
              },
            ),
            SizedBox(
              height: Get.height * .1,
            )
          ],
        ),
      ),
    );
  }
}

class AddressBottomSheetForm extends StatefulWidget {
  AddressBottomSheetForm({Key? key, this.index = -1}) : super(key: key);

  int index;

  @override
  State<AddressBottomSheetForm> createState() => _AddressBottomSheetFormState();
}

class _AddressBottomSheetFormState extends State<AddressBottomSheetForm> {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController countryController = TextEditingController();

  TextEditingController streetAddressController = TextEditingController();

  TextEditingController townCityController = TextEditingController();

  TextEditingController postCodeController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  bool isBilling = false;

  @override
  // ignore: must_call_super
  void initState() {
    if (widget.index != -1) {
      setState(() {
        fullNameController.text =
            myAddressesDemoData[widget.index].titleName.toString();
        countryController.text =
            myAddressesDemoData[widget.index].countryName.toString();

        streetAddressController.text =
            myAddressesDemoData[widget.index].streetAddress.toString();
        townCityController.text =
            myAddressesDemoData[widget.index].town.toString();
        postCodeController.text =
            myAddressesDemoData[widget.index].postCode.toString();

        emailController.text =
            myAddressesDemoData[widget.index].email.toString();
        phoneNumberController.text =
            myAddressesDemoData[widget.index].phoneNo.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 220),
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 20),
          // color: Colors.transparent,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.index != -1
                        ? 'Update Your Address'
                        : 'Add New Address',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.cancel_outlined,
                        color: MyAppColors.appPrimaryColor,
                      ))
                ],
              ),
              MyTextFormField(
                  titleText: 'Full Name',
                  hintText: "Enter your good name",
                  myController: fullNameController),
              MyTextFormField(
                  titleText: 'Country',
                  hintText: "Enter your country name",
                  myController: countryController),
              MyTextFormField(
                  titleText: 'Street address',
                  hintText: "Enter your street address",
                  myController: streetAddressController),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width * .43,
                    child: MyTextFormField(
                        titleText: 'Town/City',
                        hintText: "Enter your city name",
                        myController: townCityController),
                  ),
                  SizedBox(
                    width: Get.width * .43,
                    child: MyTextFormField(
                        titleText: 'PostCode',
                        hintText: "Enter postcode of city",
                        myController: postCodeController,
                        isNumeric: true),
                  ),
                ],
              ),
              MyTextFormField(
                  titleText: 'Email',
                  hintText: "Enter your email address",
                  myController: emailController),
              MyTextFormField(
                titleText: 'Phone Number',
                hintText: "Enter your phone number",
                myController: phoneNumberController,
              ),
              SwitchListTile(
                  title: Text(
                    'Use this address as Billing address',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 13),
                  ),
                  value: isBilling,
                  tileColor: MyAppColors.appPrimaryColor,
                  activeColor: MyAppColors.appPrimaryColor,
                  dense: true,
                  secondary: const Icon(Icons.payments_outlined),
                  onChanged: (value) {
                    setState(() {
                      isBilling = value;
                    });
                  }),
              const SizedBox(
                height: 20,
              ),
              MyLargeButton(
                  title: widget.index != -1 ? 'Update Address' : 'Save Address',
                  onTap: () {},
                  buttonColor: MyAppColors.appPrimaryColor),
            ],
          ),
        ),
      ),
    );
  }
}

Widget myAddressBuilder(
    {required BuildContext context,
    required String titleName,
    required countryName,
    required streetAddress,
    required town,
    required postCode,
    required email,
    required phoneNo,
    required bool isDefault,
    required int index,
    required void Function(bool? isDefault) onChange}) {
  return Container(
    margin: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      // border: Border.all(color: MyAppColors.guestButtonColor, width: 0.5),
    ),
    child: Card(
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
            padding:
                const EdgeInsets.only(left: 14, right: 22, top: 14, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width * .7,
// color: Colors.black45,
                  child: Text(
                    titleName,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        enableDrag: true,
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return AddressBottomSheetForm(index: 1);
                        });
                  },
                  child: Text(
                    'Edit',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: MyAppColors.appPrimaryColor),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: Get.width * .7,
            margin: const EdgeInsets.only(bottom: 4),
// color: Colors.black45,
            padding: const EdgeInsets.only(left: 14),
            child: Row(
              children: [
                const Icon(Icons.location_on_outlined, color: Colors.grey),
                Container(
                  padding: const EdgeInsets.only(left: 8),
                  width: Get.width * .58,
                  child: Text(
                    streetAddress +
                        '. ' +
                        town +
                        ', ' +
                        countryName +
                        ' ' +
                        postCode,
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
                    email,
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
                    phoneNo,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width * .7,
                  child: CheckboxListTile(
                    tileColor: MyAppColors.guestButtonColor.withOpacity(0.1),
                    value: isDefault,

                    // title: const Text('Use as default shipping address'),
                    subtitle: Text(
                      'Use as default shipping address',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 13),
                    ),
                    onChanged: onChange,
                  ),
                ),
                IconButton(
                  color: MyAppColors.appPrimaryColor,
                  onPressed: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (_) =>  const AddressDeleteConfirmationDialog(),
                    );
                  },
                  iconSize: 22,
                  splashRadius: 25,
                  icon: const Icon(Icons.delete_outline),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

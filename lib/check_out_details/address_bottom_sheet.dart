import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_edam/screens/my_widgets/my_text_field.dart';
import 'package:multi_vendor_edam/theme_shared_preferences/theme_provider.dart';
import 'package:provider/provider.dart';

import '../utils/my_app_colors.dart';


class MyAddressBottomSheet extends StatefulWidget {
  MyAddressBottomSheet({Key? key, required this.shippingAddress})
      : super(key: key);

  String shippingAddress;

  @override
  _MyAddressBottomSheetState createState() => _MyAddressBottomSheetState();
}

class _MyAddressBottomSheetState extends State<MyAddressBottomSheet> {
  TextEditingController shippingAddressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    // var themeNotifier = Provider.of<ThemeModel>(context);
    shippingAddressController.text = widget.shippingAddress;
    var themeNotifier = Provider.of<MyThemeModel>(context);
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.only(
            top: Get.height * .2,
            left: Get.height * .05,
            right: Get.height * .05,
            bottom: Get.height * .35),
        padding: EdgeInsets.all(Get.height * .02),
        decoration: BoxDecoration(
            border: Border.all(color: MyAppColors.appPrimaryColor),
            color: Theme.of(context).backgroundColor,
            //,Theme.of(context).bottomSheetTheme.backgroundColor,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * .01,
            ),
            Text(
              'Update your shipping address',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 18),
            ),
            const Divider(),
            SizedBox(
              height: Get.height * .04,
            ),
            TextFormField(
              // textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontSize: 15),
              controller: shippingAddressController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Field is empty!';
                }
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.location_on_outlined,
                  color: MyAppColors.guestButtonColor,
                ),
                labelText: 'Shipping Address',
                labelStyle: themeNotifier.isDark
                    ? TextStyle(
                        backgroundColor: Colors.grey.shade100,
                        color: Colors.black26)
                    : TextStyle(
                        fontSize: 14, color: Theme.of(context).hintColor),
                hintText: 'Shipping Address',
                hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    width: .1,
                    color: MyAppColors.appPrimaryColor,
                    style: BorderStyle.solid,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyAppColors.appPrimaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 2, color: MyAppColors.appPrimaryColor)),
                filled: true,
                contentPadding: const EdgeInsets.all(16),
                fillColor: Colors.grey.shade100,
              ),
              // expands: true,
              maxLines: 4,
              // minLines: 1,
            ),
            SizedBox(height: Get.height * .07),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: bottomSheetButton(
                      context: context,
                      titleText: 'Cancel',
                      backgroundColor: MyAppColors.guestButtonColor,
                      borderColor: MyAppColors.appPrimaryColor.withOpacity(0.8),
                      textColor: Colors.black),
                ),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        widget.shippingAddress = shippingAddressController.text;
                      });
                      Navigator.pop(context);
                      // TODO submit
                    }
                    // print('Apply taped');
                  },
                  child: bottomSheetButton(
                      context: context,
                      titleText: 'Update',
                      backgroundColor: MyAppColors.appPrimaryColor,
                      borderColor:
                          MyAppColors.guestButtonColor.withOpacity(0.6),
                      textColor: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget bottomSheetButton(
    {required BuildContext context,
    required String titleText,
    required Color backgroundColor,
    required borderColor,
    required textColor}) {
  return Container(
    width: Get.width * .33,
    decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: borderColor)),
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Text(
          titleText,
          style: Theme.of(context).textTheme.button!.copyWith(color: textColor),
        ),
      ),
    ),
  );
}

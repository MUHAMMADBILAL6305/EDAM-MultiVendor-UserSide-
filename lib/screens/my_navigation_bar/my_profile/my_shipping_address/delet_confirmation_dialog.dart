import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/my_app_colors.dart';

class AddressDeleteConfirmationDialog extends StatefulWidget {
  const AddressDeleteConfirmationDialog({Key? key}) : super(key: key);

  @override
  _AddressDeleteConfirmationDialogState createState() =>
      _AddressDeleteConfirmationDialogState();
}

class _AddressDeleteConfirmationDialogState
    extends State<AddressDeleteConfirmationDialog> {
  @override
  Widget build(BuildContext context) {
    // var themeNotifier = Provider.of<ThemeModel>(context);
    return Container(
      margin: EdgeInsets.only(
          left: Get.height * .05,
          right: Get.height * .05,
          bottom: Get.height * .24),
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
            'Delete Confirmation ',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Divider(),
          SizedBox(
            height: Get.height * .04,
          ),
          Text(
            'Are you sure you want to delete this shipping address! ',
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
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
                  ///todo here for deletion of address
                  print('Apply taped');
                  Navigator.pop(context);
                },
                child: bottomSheetButton(
                    context: context,
                    titleText: 'Delete',
                    backgroundColor: MyAppColors.appPrimaryColor,
                    borderColor: MyAppColors.guestButtonColor.withOpacity(0.6),
                    textColor: Colors.white),
              ),
            ],
          ),
        ],
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

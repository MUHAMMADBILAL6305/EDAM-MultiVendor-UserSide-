import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/my_app_colors.dart';
import '../../my_navbar.dart';

class NoOrdersYet extends StatelessWidget {
  const NoOrdersYet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.remove_shopping_cart_outlined,
          size: Get.height * .2,
          color: MyAppColors.guestButtonColor,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'No Orders yet please go to search or home first make an order, then come here to see your orders status.',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: MyAppColors.guestButtonColor),
            textAlign: TextAlign.justify,
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: MyAppColors.appPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          onPressed: () {
            Get.to(MyNavBar());
          },
          child: const Text('Goto Home'),
        ),
      ],
    );
  }
}

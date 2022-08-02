import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:multi_vendor_edam/screens/authentications/reset_password.dart';
import 'package:multi_vendor_edam/screens/my_navigation_bar/my_profile/my_chats/chat_data.dart';
import 'package:multi_vendor_edam/screens/my_navigation_bar/my_profile/edit_profile.dart';
import 'package:multi_vendor_edam/screens/my_navigation_bar/my_profile/my_favorite.dart';
import 'package:multi_vendor_edam/screens/my_navigation_bar/my_profile/my_wallet.dart';
import 'package:multi_vendor_edam/screens/my_navigation_bar/my_profile/pdf_viewer.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';
import '../../../theme_shared_preferences/theme_provider.dart';
import '../../../utils/my_app_colors.dart';
import '../../welcomescreens/welcome_screen.dart';
import 'package:share_plus/share_plus.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'my_shipping_address/my_address_screen.dart';
import 'my_cart.dart';
import 'my_order_tab_view/tab_layout_order.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final String _shareContents =
      "Hi There!\n I am using EDAM app which provide to see and order all your meats to your home door, you can search it in PlayStore or AppStore below is the link to the app: \n \\http:flutter.com";
  bool isPushNotifications = false,
      isRememberLogIn = false,
      isFingerPrint = false,
      isLoading = false;

  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<MyThemeModel>(context);

    return LoaderOverlay(
      useDefaultLoading: isLoading,
      overlayColor: Colors.black,
      overlayWholeScreen: true,

      overlayOpacity: 0.8,
      overlayWidget: Center(
        child: CircularProgressIndicator(
          color: MyAppColors.appPrimaryColor,

          strokeWidth: 50,
        ),
      ),
      child: Scaffold(
        backgroundColor: themeNotifier.isDark
            ? Theme.of(context).primaryColorDark.withOpacity(0.42)
            : Colors.grey.shade200,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: Get.height * .02),
              InkWell(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: Get.width * .03),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: MyAppColors.appPrimaryColor.withOpacity(.2),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: Get.height * .07,
                          backgroundColor: MyAppColors.appPrimaryColor,
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/profile.jpg',
                              height: Get.height * .135,
                              width: Get.height * .135,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              myChatsDummyData[1].profileName,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              '20220535111',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'poppins',
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'abc123@example.com',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'poppins',
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: Get.width * .15),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: Get.height * .025,
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Get.to(const EditProfileScreen());
                },
              ),
              SizedBox(height: Get.height * .01),
              const Divider(),
              SettingsList(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                applicationType: ApplicationType.both,
                // brightness: Brightness.light,
                // darkTheme: ,
                // backgroundColor: themeNotifier.isDark ? Theme.of(context).primaryColor:Colors.grey.shade200,
                // darkBackgroundColor: Theme.of(context).backgroundColor,
                sections: [
                  SettingsSection(
                    // titlePadding:  const EdgeInsets.all(20),
                    title: Text(
                      'My Profile',
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText2!.color,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    tiles: [
                      SettingsTile(
                        title: const Text('My Shipping Address'),
                        description: const Text(
                            'You can add multiple Shipping address.'),
                        leading: Icon(
                          Icons.add_location_alt_outlined,
                          size: Get.height * .030,
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                        ),
                        onPressed: (BuildContext context) {
                          Get.to(const AddAddressScreen(
                              pageTitle: 'Shipping Address'));
                        },
                      ),
                      SettingsTile(
                        title: const Text('My Cart'),
                        description: const Text('All items in cart list'),
                        leading: Icon(
                          Icons.shopping_cart_outlined,
                          size: Get.height * .030,
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                        ),
                        onPressed: (BuildContext context) {
                          Get.to(const MyCartScreen(pageTitle: 'My Cart'));
                        },
                      ),
                      SettingsTile(
                        title: const Text('My Orders'),
                        description: const Text('All orders list'),
                        leading: Icon(
                          Icons.playlist_play_rounded,
                          size: Get.height * .030,
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                        ),
                        onPressed: (BuildContext context) {
                          Get.to(const MyOrdersTabLayout());
                        },
                      ),
                      SettingsTile(
                        title: const Text('My Wallet'),
                        description:
                            const Text('Manage attached walled systems'),
                        leading: Icon(
                          Icons.wallet_outlined,
                          size: Get.height * .030,
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                        ),
                        onPressed: (BuildContext context) {
                          Get.to(const MyWalletScreen(pageTitle: 'My Wallet'));
                        },
                      ),
                      SettingsTile(
                        title: const Text('My Favorites'),
                        description: const Text('All favorite vendors list'),
                        leading: Icon(
                          Icons.favorite,
                          color: MyAppColors.appPrimaryColor,
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                        ),
                        onPressed: (BuildContext context) {
                          Get.to(const MyFavoritiesScreen(
                              pageTitle: 'My Favorite List'));
                        },
                      ),
                      SettingsTile(
                        title: const Text('Reset password'),
                        description: const Text('Reset your account password'),
                        leading: Icon(
                          Icons.security_outlined,
                          size: Get.height * .030,
                          // color: MyAppColors.appPrimaryColor,
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                        ),
                        onPressed: (BuildContext context) {
                          Get.to(const ResetPassword(isOldPassword: true));
                          // openAlertBox(context);
                        },
                      ),
                      SettingsTile(
                        title: Text(
                          'Logout',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: MyAppColors.appPrimaryColor,
                                  fontWeight: FontWeight.bold),
                        ),
                        description: const Text('SignOut from your account!'),
                        leading: Icon(
                          Icons.logout_outlined,
                          size: Get.height * .030,
                          color: MyAppColors.appPrimaryColor,
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                        ),
                        onPressed: (BuildContext context) {
                          Get.to(const WelcomeScreen());
                          // openAlertBox(context);
                        },
                      ),
                    ],
                  ),
                  SettingsSection(
                    // titlePadding:  const EdgeInsets.all(20),
                    title: Text(
                      'App Settings',
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText2!.color,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    tiles: [
                      SettingsTile(
                        title: const Text('Languages'),
                        description: const Text('English'),
                        leading: const Icon(Icons.language),
                        trailing: const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          size: 25,
                        ),
                        onPressed: (BuildContext context) {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (_) => const MyBottomSheet(),
                          );
                        },
                      ),
                      SettingsTile.switchTile(
                        initialValue: themeNotifier.isDark,
                        title: const Text('Use Dark Theme'),
                        leading: const Icon(Icons.phone_android),
                        activeSwitchColor: MyAppColors.appPrimaryColor,
                        onToggle: (value) {
                          makeLoadingTrue();
                          setState(() async {
                            themeNotifier.isDark = value;
                            await themeNotifier.themeSharedPreferences
                                .setTheme(value);

                            if (Platform.isAndroid)
                              await {
                                SystemChrome.setSystemUIOverlayStyle(
                                  SystemUiOverlayStyle(
                                    statusBarColor: themeNotifier.isDark
                                        ? Colors.grey
                                        : Colors.white,
                                    // statusBarBrightness: themeNotifier.isDark
                                    //     ? Brightness.dark
                                    //     : Brightness.light,
                                    systemNavigationBarColor:
                                        themeNotifier.isDark
                                            ? Colors.grey
                                            : Colors.white,
                                    // Theme.of(context)
                                    //     .navigationBarTheme
                                    //     .backgroundColor,
                                    // systemNavigationBarIconBrightness:
                                    //     themeNotifier.isDark
                                    //         ? Brightness.light
                                    //         : Brightness.dark
                                  ),
                                )
                              };

                            // if (value == true) {
                            //   SystemChrome.setSystemUIOverlayStyle(
                            //       SystemUiOverlayStyle.dark);
                            // } else if (value == false) {
                            //   SystemChrome.setSystemUIOverlayStyle(
                            //       SystemUiOverlayStyle.light);
                            // }
                            makeLoadingFalse();
                          });
                        },
                      ),
                    ],
                  ),
                  SettingsSection(
                    // titlePadding: const EdgeInsets.all(20),
                    title: Text(
                      'App Securities',
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText2!.color,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    tiles: [
                      SettingsTile.switchTile(
                        title: const Text('Use fingerprint'),
                        leading: const Icon(Icons.fingerprint),
                        activeSwitchColor: MyAppColors.appPrimaryColor,
                        initialValue: isFingerPrint,
                        onToggle: (value) {
                          setState(() {
                            isFingerPrint = value;
                          });
                        },
                      ),
                      SettingsTile.switchTile(
                        title: const Text('Push Notifications'),
                        leading:
                            const Icon(Icons.notifications_active_outlined),
                        activeSwitchColor: MyAppColors.appPrimaryColor,
                        initialValue: isPushNotifications,
                        onToggle: (value) {
                          setState(() {
                            isPushNotifications = value;
                          });
                        },
                      ),
                      SettingsTile.switchTile(
                        title: const Text('Remember LogIn'),
                        leading: const Icon(Icons.remember_me_rounded),
                        activeSwitchColor: MyAppColors.appPrimaryColor,
                        initialValue: isRememberLogIn,
                        onToggle: (value) {
                          setState(() {
                            isRememberLogIn = value;
                          });
                        },
                      ),
                    ],
                  ),
                  SettingsSection(
                    // titlePadding: const EdgeInsets.all(20),
                    title: Text(
                      'App Info',
                      style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText2!.color,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),

                    tiles: [
                      SettingsTile(
                        title: const Text('Share app'),
                        description:
                            const Text('Tell your friends about the app'),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                        ),
                        leading: const Icon(Icons.share),
                        onPressed: (BuildContext context) {
                          Share.share(_shareContents);
                          print('taped');
                        },
                      ),
                      SettingsTile(
                        title: const Text('Terms & Conditions'),
                        description: const Text('Business terms & conditions'),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                        ),
                        leading: const Icon(Icons.sticky_note_2_sharp),
                        onPressed: (BuildContext context) {
                          Get.to(const MyPDFViewer(
                            pageTitle: 'Terms and Conditions',
                            pdfPath: 'assets/pdf/TermsOfUse.pdf',
                          ));
                        },
                      ),
                      SettingsTile(
                        title: const Text('Contact Us'),
                        description: const Text('Official Contacts'),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                        ),
                        leading: const Icon(Icons.quick_contacts_mail),
                        onPressed: (BuildContext context) {
                          Get.to(const MyPDFViewer(
                            pageTitle: 'Contact Us',
                            pdfPath: 'assets/pdf/contactUs.pdf',
                          ));
                        },
                      ),
                      SettingsTile(
                        title: const Text('About Us'),
                        description: const Text('About the Platform'),
                        trailing: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                        ),
                        leading: const Icon(Icons.contact_support),
                        onPressed: (BuildContext context) {
                          Get.to(const MyPDFViewer(
                            pageTitle: 'About Us',
                            pdfPath: 'assets/pdf/AboutUs.pdf',
                          ));
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: Get.height * .1)
            ],
          ),
        ),
      ),
    );
  }

  makeLoadingFalse() {
    Timer(
        const Duration(seconds: 3),
        () => setState(() {
              isLoading = false;
            }));
  }

  makeLoadingTrue() {
    isLoading = true;
    setState(() {});
  }
}

class MyBottomSheet extends StatefulWidget {
  const MyBottomSheet({Key? key}) : super(key: key);

  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  String language = 'English';

  @override
  Widget build(BuildContext context) {
    // var themeNotifier = Provider.of<ThemeModel>(context);
    return Container(
      margin: EdgeInsets.only(
          left: Get.height * .05,
          right: Get.height * .05,
          bottom: Get.height * .08),
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
            'Select the app language ',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Divider(),
          SizedBox(
            height: Get.height * .04,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: MyAppColors.appPrimaryColor
                  .withOpacity(language == 'English' ? 0.2 : 0.0),
            ),
            child: ListTile(
              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              selected: language == 'English' ? true : false,
              onTap: () {
                setState(() {
                  language = 'English';
                });
              },
              trailing: Radio<String>(
                activeColor: MyAppColors.appPrimaryColor,
                // fillColor: MaterialStateColor.resolveWith(
                //     (states) => MyAppColors.appPrimaryColor),
                value: 'English',
                groupValue: language,
                onChanged: (value) {
                  setState(() {
                    language = value!;
                  });
                },
              ),
              leading: Icon(
                Icons.language,
                color: language == "English"
                    ? MyAppColors.appPrimaryColor
                    : Theme.of(context).iconTheme.color!.withOpacity(.5),
              ),
              title: Text(
                'English',
                style: TextStyle(
                  color: language == "English"
                      ? MyAppColors.appPrimaryColor
                      : Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: MyAppColors.appPrimaryColor
                  .withOpacity(language == 'Arabic' ? 0.2 : 0.0),
            ),
            child: ListTile(
              onTap: () {
                setState(() {
                  language = 'Arabic';
                });
              },
              leading: Icon(
                Icons.language,
                color: language == "Arabic"
                    ? MyAppColors.appPrimaryColor
                    : Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .color!
                        .withOpacity(.5),
              ),
              trailing: Radio<String>(
                value: 'Arabic',
                activeColor: MyAppColors.appPrimaryColor,
                // fillColor: MaterialStateColor.resolveWith(
                //     (states) =>  MyAppColors.appPrimaryColor),
                groupValue: language,
                onChanged: (value) {
                  setState(() {
                    language = value!;
                  });
                },
              ),
              title: Text(
                'Arabic',
                style: TextStyle(
                  color: language == "Arabic"
                      ? MyAppColors.appPrimaryColor
                      : Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
            ),
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
                  print('Apply taped');
                },
                child: bottomSheetButton(
                    context: context,
                    titleText: 'Apply',
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

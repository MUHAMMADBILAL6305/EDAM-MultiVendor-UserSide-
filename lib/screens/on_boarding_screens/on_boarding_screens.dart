import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../theme_shared_preferences/theme_provider.dart';
import '../../utils/my_app_colors.dart';
import '../my_widgets/my_large_button.dart';
import '../welcomescreens/welcome_screen.dart';
import 'explanation_data.dart';
import 'explanation_page.dart';

class OnBoardingScreens extends StatefulWidget {
  const OnBoardingScreens({Key? key}) : super(key: key);

  @override
  _OnBoardingScreensState createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  final _controller = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var themeNotifier = Provider.of<MyThemeModel>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            color: Theme.of(context).backgroundColor,
            alignment: Alignment.center,
            child: Column(children: [
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: Get.width * .2,
                  height: Get.height * .04,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: themeNotifier.isDark
                              ? MyAppColors.appPrimaryColor
                              : Colors.transparent),
                      borderRadius: BorderRadius.circular(40)),
                  alignment: Alignment.topRight,
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          _currentIndex = data.length - 1;
                          _controller.jumpToPage(_currentIndex);
                        });
                      },
                      child: Center(
                        child: Text(
                          'Skip',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: MyAppColors.appSecondaryColor,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal),
                          textAlign: TextAlign.right,
                        ),
                      )),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 12),
                  // color: Colors.green,
                  height: Get.height * .6,
                  alignment: Alignment.center,
                  child: PageView(
                      scrollDirection: Axis.horizontal,
                      controller: _controller,
                      onPageChanged: (value) {
                        setState(() {
                          _currentIndex = value;
                        });
                      },
                      children:
                          data.map((e) => ExplanationPage(data: e)).toList())),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        data.length, (index) => pageIndicators(index: index)),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  MyLargeButton(
                      title: _currentIndex == 3 ? 'Get Started' : 'Next',
                      buttonColor: MyAppColors.appPrimaryColor,
                      onTap: () {
                        setState(() {
                          if (_currentIndex == 3) {
                            {
                              Get.offAll(const WelcomeScreen());
                            }
                          } else {
                            _currentIndex++;
                          }
                          _controller.jumpToPage(_currentIndex);
                        });
                      })
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }

  //PageIndicators model
  Widget pageIndicators({required int index}) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        margin: const EdgeInsets.only(right: 4),
        height: 6,
        width: _currentIndex == index ? 18 : 6,
        decoration: BoxDecoration(
            color: _currentIndex == index
                ? MyAppColors.appPrimaryColor
                : const Color(0xffDADADA),
            borderRadius: BorderRadius.circular(12)));
  }
}

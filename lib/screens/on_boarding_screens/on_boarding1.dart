import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'on_boarding_screens.dart';

class OnBoardingScreen1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.values[5],
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 13.35, right: 14.76, top: 12.44, bottom: 5.4),
            child: Image.asset('assets/images/onboarding1.png',
                height: 382.03, width: 280.38),
          ),
          Text(
            "Discover Daily News",
            style: TextStyle(
              fontFamily: 'Inter',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Color(0xff209CEE),
            ),
          ),
          Text(
            "We bring you\ncloser to the\nnews.",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
              fontSize: 40,
              letterSpacing: -0.5,
              height: 1.1,
              color: Color(0xff1E1A15),
            ),
          ),
          InkWell(
            child: Container(
              height: 48.0,
              width: 144.0,
              decoration: BoxDecoration(
                  color: Color(0xff209CEE),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                        color:
                        Color.fromRGBO(32, 156, 238, 0.3).withOpacity(0.8),
                        blurRadius: 16,
                        offset: Offset(0.0, 8.0))
                  ]),
              child: Center(
                child: Text(
                  "Get Started",
                  style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins'),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => OnBoardingScreens()));
            },
          )
        ],
      )),
    );
  }
}

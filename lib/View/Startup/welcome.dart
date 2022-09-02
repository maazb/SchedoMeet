import 'package:bit_planner/Helper/values.dart';
import 'package:bit_planner/View/Startup/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  late double height;
  late double width;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarContrastEnforced: true,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      color: white,
      height: height,
      width: width,
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.15,
          ),
          Container(
            height: height * 0.2,
            width: height * 0.2,
            child: Image.asset(
              "assets/images/logo1.png",
              fit: BoxFit.cover,
              width: height * 0.2,
              height: height * 0.2,
            ),
          ),
          SizedBox(
            height: height * 0.06,
          ),
          CupertinoButton(
            padding: EdgeInsets.all(0.0),
            minSize: 0.0001,
            onPressed: null,
            child: Container(
                width: width,
                child: Text(
                  'Welcome to SchedoMeet',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        decoration: TextDecoration.none,
                        color: textColor,
                        height: 1.3,
                        fontSize: height * 0.026,
                        fontWeight: FontWeight.w500),
                  ),
                )),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          CupertinoButton(
            padding: EdgeInsets.all(0.0),
            minSize: 0.0001,
            onPressed: null,
            child: Container(
                width: width * 0.9,
                child: Text(
                  'Create an account to save all your schedules and access them from anywhere',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        decoration: TextDecoration.none,
                        color: grey,
                        height: 1.3,
                        fontSize: height * 0.018,
                        fontWeight: FontWeight.w400),
                  ),
                )),
          ),
          SizedBox(
            height: height * 0.08,
          ),
          CupertinoButton(
            padding: EdgeInsets.all(0.0),
            minSize: 0.0001,
            onPressed: () {
              Get.to(() => Login());
            },
            child: Container(
              height: height * 0.07,
              width: width,
              margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.02),
                color: primaryBlue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Container(
                    child: SvgPicture.asset(
                      "assets/icons/envelope.svg",
                      color: white,
                      fit: BoxFit.cover,
                      height: height * 0.03,
                      width: height * 0.03,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.04,
                  ),
                  Text(
                    'Continue with Email',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: white,
                          height: 1.3,
                          fontSize: height * 0.018,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          CupertinoButton(
            padding: EdgeInsets.all(0.0),
            minSize: 0.0001,
            onPressed: () {},
            child: Container(
              height: height * 0.07,
              width: width,
              margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.02),
                color: greyLight,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Container(
                    child: SvgPicture.asset(
                      "assets/icons/google.svg",
                      color: primaryBlue,
                      fit: BoxFit.cover,
                      height: height * 0.03,
                      width: height * 0.03,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.04,
                  ),
                  Text(
                    'Continue with Google',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: grey,
                          height: 1.3,
                          fontSize: height * 0.018,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

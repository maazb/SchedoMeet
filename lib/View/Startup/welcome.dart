import 'package:bit_planner/Helper/values.dart';
import 'package:bit_planner/View/Startup/login.dart';
import 'package:bit_planner/View/Startup/register.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:unicons/unicons.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  CarouselController _carouselController = CarouselController();
  PageController _pageController = PageController(
    initialPage: 0,
  );
  RxInt pos = 0.obs;
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.05),
            height: height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.all(0.0),
                  minSize: 0.0001,
                  onPressed: () async {
                    await _carouselController.animateToPage(2,
                        duration: Duration(milliseconds: 200));
                    setState(() {
                      pos.value = 2;
                    });
                  },
                  child: Obx(
                    () => Container(
                      margin: EdgeInsets.symmetric(vertical: height * 0.01),
                      child: pos.value != 2
                          ? Text(
                              'Skip',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: primaryBlue,
                                    height: 1.3,
                                    fontSize: height * 0.022,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          : Container(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CarouselSlider(
                  carouselController: _carouselController,
                  items: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.04,
                          ),
                          Center(
                            child: Container(
                              height: height * 0.38,
                              width: height * 0.38,
                              child: LottieBuilder.asset(
                                "assets/animations/meetings.json",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.all(0.0),
                            minSize: 0.0001,
                            onPressed: null,
                            child: Container(
                                width: width * 0.9,
                                child: Text(
                                  'Schedule meetings and events automatically',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: textColor,
                                        height: 1.3,
                                        fontSize: height * 0.022,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.04,
                          ),
                          Center(
                            child: Container(
                              height: height * 0.38,
                              width: height * 0.38,
                              child: LottieBuilder.asset(
                                "assets/animations/access.json",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.all(0.0),
                            minSize: 0.0001,
                            onPressed: null,
                            child: Container(
                                width: width * 0.9,
                                child: Text(
                                  'And access them anytime anywhere',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: textColor,
                                        height: 1.3,
                                        fontSize: height * 0.022,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.08,
                          ),
                          Container(
                            height: height * 0.25,
                            width: height * 0.25,
                            child: Image.asset(
                              "assets/images/logo1.png",
                              fit: BoxFit.cover,
                              height: height * 0.25,
                              width: height * 0.25,
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
                        ],
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                      pauseAutoPlayOnManualNavigate: false,
                      enableInfiniteScroll: false,
                      viewportFraction: 1,
                      autoPlay: false,
                      height: height * 0.5,
                      pageSnapping: true,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        setState(() {
                          pos.value = index;
                        });
                      })),
              SizedBox(
                height: height * 0.02,
              ),
              Obx(
                () => AnimatedSmoothIndicator(
                  activeIndex: pos.value,
                  count: 3,
                  effect: ExpandingDotsEffect(
                      activeDotColor: primaryBlue,
                      dotColor: primaryBlue,
                      spacing: 5,
                      dotHeight: 7,
                      dotWidth: 7),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Obx(
                () => Container(
                  child: pos.value == 2
                      ? Column(
                          children: [
                            CupertinoButton(
                              padding: EdgeInsets.all(0.0),
                              minSize: 0.0001,
                              onPressed: () {
                                Get.to(() => Login());
                              },
                              child: Container(
                                height: height * 0.07,
                                width: width,
                                margin: EdgeInsets.symmetric(
                                    horizontal: width * 0.05),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(width * 0.02),
                                  color: primaryBlue,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: width * 0.05,
                                    ),
                                    Container(
                                        child: Icon(
                                      CupertinoIcons.square_arrow_right,
                                      color: white,
                                      size: height * 0.03,
                                    )),
                                    SizedBox(
                                      width: width * 0.04,
                                    ),
                                    Text(
                                      'Login',
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
                              onPressed: () {
                                Get.to(() => Register());
                              },
                              child: Container(
                                height: height * 0.07,
                                width: width,
                                margin: EdgeInsets.symmetric(
                                    horizontal: width * 0.05),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(width * 0.02),
                                  color: greyLight,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: width * 0.05,
                                    ),
                                    Container(
                                        child: Icon(
                                      CupertinoIcons.person_add_solid,
                                      color: primaryBlue,
                                      size: height * 0.03,
                                    )),
                                    SizedBox(
                                      width: width * 0.04,
                                    ),
                                    Text(
                                      'Sign up',
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: grey,
                                            height: 1.3,
                                            fontSize: height * 0.018,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: height * 0.05,
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.all(0.0),
                              minSize: 0.0001,
                              onPressed: () {
                                pos.value++;
                                _carouselController.nextPage();
                              },
                              child: Container(
                                padding: EdgeInsets.all(width * 0.03),
                                decoration: BoxDecoration(
                                    color: primaryBlue,
                                    borderRadius:
                                        BorderRadius.circular(width * 100)),
                                child: Icon(
                                  UniconsLine.arrow_right,
                                  color: white,
                                  size: width * 0.09,
                                ),
                              ),
                            )
                          ],
                        ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}

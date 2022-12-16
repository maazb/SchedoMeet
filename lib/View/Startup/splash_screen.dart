import 'package:animated_card/animated_card.dart';
import 'package:bit_planner/Helper/values.dart';
import 'package:bit_planner/View/Startup/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
    loadData();
  }

  Future<void> loadData() async {
    Future.delayed(Duration(milliseconds: 4000)).then((value) async {
      Get.offAll(() => Welcome());
      // logoWidth.value = width * 0.8;
      // SharedPreferences pref = await SharedPreferences.getInstance();
      // if (pref.getBool('isLoggedIn') ?? false) {
      //   Future.delayed(Duration(milliseconds: 2000)).then((value) {
      //     Get.to(() => DataEntries());
      //   });
      // } else {
      //   Future.delayed(Duration(milliseconds: 2000)).then((value) {
      //     Get.to(() => Login());
      //   });
      // }
    });
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: width * 0.8,
              width: width * 0.8,
              alignment: Alignment.center,
              child: LottieBuilder.asset(
                "assets/animations/loading.json",
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      )),
    );
  }
}

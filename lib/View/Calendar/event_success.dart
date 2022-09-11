import 'package:bit_planner/Helper/values.dart';
import 'package:bit_planner/View/Meetings/meetings.dart';
import 'package:bit_planner/View/bottom_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

class EventSuccess extends StatefulWidget {
  const EventSuccess({Key? key}) : super(key: key);

  @override
  State<EventSuccess> createState() => _EventSuccessState();
}

class _EventSuccessState extends State<EventSuccess> {
  late double height;
  late double width;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await Future.delayed(Duration(seconds: 3)).then((value) {
      Get.offAll(BottomNavigator());
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      color: white,
      height: height,
      width: width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(width * 100)),
                width: width * 0.2,
                height: width * 0.2,
                alignment: Alignment.center,
                child: Icon(
                  UniconsLine.check,
                  color: white,
                  size: width * 0.15,
                )),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              "Success".tr,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: textColor,
                    height: 1.3,
                    decoration: TextDecoration.none,
                    fontSize: height * 0.026,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              width: width * 0.7,
              child: CupertinoButton(
                padding: EdgeInsets.all(0.0),
                minSize: 0.0001,
                onPressed: null,
                child: Text(
                  "Event has been sucessfully arranged on 12 Aug 2022 at 09:15 AM."
                      .tr,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: textColor,
                        height: 1.3,
                        fontSize: height * 0.018,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

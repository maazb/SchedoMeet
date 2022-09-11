import 'package:bit_planner/Controller/calendar_controller.dart';
import 'package:bit_planner/Helper/values.dart';
import 'package:bit_planner/View/Calendar/event_success.dart';
import 'package:bit_planner/View/Meetings/meetings.dart';
import 'package:bit_planner/View/bottom_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

class EventFailure extends StatefulWidget {
  const EventFailure({Key? key}) : super(key: key);

  @override
  State<EventFailure> createState() => _EventFailureState();
}

class _EventFailureState extends State<EventFailure> {
  late double height;
  late double width;
  CalendarController _calendarController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    // await Future.delayed(Duration(seconds: 4)).then((value) {
    //   Get.back();
    //   Get.back();
    // });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.0),
        color: white,
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.15,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: red,
                      borderRadius: BorderRadius.circular(width * 100)),
                  width: width * 0.2,
                  height: width * 0.2,
                  alignment: Alignment.center,
                  child: Icon(
                    UniconsLine.multiply,
                    color: white,
                    size: width * 0.1,
                  )),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                "Sorry".tr,
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
                    "We could not arrange event at your preferred time frame due to the busy schedules of attendees"
                        .tr,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    maxLines: null,
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
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                width: width * 0.7,
                child: CupertinoButton(
                  padding: EdgeInsets.all(0.0),
                  minSize: 0.0001,
                  onPressed: null,
                  child: Text(
                    "Available timeframes (Select to arrange):".tr,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    maxLines: null,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: textColor,
                          height: 1.3,
                          fontSize: height * 0.02,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
              Container(
                child: ListView.builder(
                    clipBehavior: Clip.antiAlias,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: ((context, index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: index == 0 ? 0 : height * 0.015,
                          ),
                          Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: width * 0.05),
                            child: Expanded(
                              child: CupertinoButton(
                                padding: EdgeInsets.all(0.0),
                                minSize: 0.0001,
                                onPressed: () {
                                  Get.to(EventSuccess());
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.04,
                                    ),
                                    decoration: BoxDecoration(
                                        color: white,
                                        border: Border.all(
                                            width: 1,
                                            color: grey.withOpacity(0.4)),
                                        borderRadius: BorderRadius.circular(
                                            width * 0.02)),
                                    height: height * 0.06,

                                    //width: width,

                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Obx(
                                          () => Text(
                                            _calendarController.startTime!.value
                                                    .format(context)
                                                    .toString() +
                                                " - " +
                                                _calendarController
                                                    .endTime!.value
                                                    .format(context)
                                                    .toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: textColor,
                                                  height: 1.5,
                                                  fontSize: height * 0.018,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          UniconsLine.clock,
                                          color: grey,
                                          size: height * 0.03,
                                        )
                                      ],
                                    )),
                              ),
                            ),
                          ),
                        ],
                      );
                    })),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        alignment: Alignment.center,
        height: height * 0.12,
        decoration: BoxDecoration(
            color: white,
            gradient: LinearGradient(colors: [
              white,
              white,
              white,
              white,
              white,
              white,
              white,
              white,
              white.withOpacity(0.7),
              white.withOpacity(0.4),
              white.withOpacity(0)
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.03),
            CupertinoButton(
              padding: EdgeInsets.all(0.0),
              minSize: 0.0001,
              onPressed: () {
                Get.offAll(BottomNavigator());
              },
              child: Container(
                alignment: Alignment.center,
                width: width * 0.9,
                height: height * 0.07,
                padding: EdgeInsets.symmetric(vertical: height * 0.005),
                decoration: BoxDecoration(
                    color: primaryBlue,
                    borderRadius: BorderRadius.circular(width * 5)),
                child: Text(
                  "Return to Home",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: white,
                        //height: 1.3,
                        fontSize: height * 0.018,
                        fontWeight: FontWeight.w500),
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

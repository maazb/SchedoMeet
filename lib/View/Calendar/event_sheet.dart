import 'package:bit_planner/Helper/values.dart';
import 'package:bit_planner/View/Calendar/add_event.dart';
import 'package:bit_planner/View/Calendar/automatic_event.dart';
import 'package:bit_planner/View/Meetings/add_meeting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

class EventSheet extends StatelessWidget {
  const EventSheet({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: height * 0.02),
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(width * 0.04),
                    topRight: Radius.circular(width * 0.04))),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Add Event',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: textColor,
                              height: 1.3,
                              fontSize: height * 0.02,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.all(0.0),
                    minSize: 0.0001,
                    onPressed: () {
                      Get.to(() => AutomaticEvent())!
                          .then((value) => Get.back());
                    },
                    child: Container(
                      width: width,
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.04, vertical: height * 0.015),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.02),
                        border:
                            Border.all(width: 1, color: grey.withOpacity(0.4)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/Refresh.svg",
                            color: primaryBlue,
                            height: height * 0.03,
                            width: height * 0.03,
                          ),
                          SizedBox(width: width * 0.03),
                          Text(
                            'Automatic',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: textColor,
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
                    height: height * 0.01,
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.all(0.0),
                    minSize: 0.0001,
                    onPressed: () {
                      Get.to(() => AddEvent())!.then((value) => Get.back());
                    },
                    child: Container(
                      width: width,
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.04, vertical: height * 0.015),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(width * 0.02),
                        border:
                            Border.all(width: 1, color: grey.withOpacity(0.4)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/Settings-adjust.svg",
                            color: primaryBlue,
                            height: height * 0.03,
                            width: height * 0.03,
                          ),
                          SizedBox(width: width * 0.03),
                          Text(
                            'Manual',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: textColor,
                                  height: 1.3,
                                  fontSize: height * 0.018,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

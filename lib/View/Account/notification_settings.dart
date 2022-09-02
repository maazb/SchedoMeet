import 'package:bit_planner/Helper/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({Key? key}) : super(key: key);

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  late double height;
  late double width;
  RxInt calendarMeetings = 0.obs;
  RxInt calendarTasks = 1.obs;
  RxBool homeNewMeetings = true.obs;
  RxBool homeNewMessages = true.obs;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        toolbarHeight: height * 0.1,
        automaticallyImplyLeading: false,
        titleSpacing: 0.0,
        backgroundColor: white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: white,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CupertinoButton(
                  padding: const EdgeInsets.all(0.0),
                  minSize: 0.0001,
                  onPressed: () {
                    Get.back();
                  },
                  child: Container(
                    padding: EdgeInsets.all(width * 0.028),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: grey.withOpacity(0.4), width: 1),
                        borderRadius: BorderRadius.circular(width * 5)),
                    child: Icon(
                      UniconsLine.arrow_left,
                      color: textColor,
                      size: height * 0.032,
                    ),
                  ),
                ),
                Text(
                  'Notification Settings',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: textColor,
                        height: 1.3,
                        fontSize: height * 0.026,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                CupertinoButton(
                  padding: const EdgeInsets.all(0.0),
                  minSize: 0.0001,
                  onPressed: null,
                  child: Container(
                    width: width * 0.12,
                    height: height * 0.01,
                    // padding: EdgeInsets.all(width * 0.028),
                    // decoration: BoxDecoration(
                    //     border:
                    //         Border.all(color: grey.withOpacity(0.4), width: 1),
                    //     borderRadius: BorderRadius.circular(width * 5)),
                    // child: Icon(
                    //   UniconsLine.plus,
                    //   color: textColor,
                    //   size: height * 0.032,
                  ),
                ),
              ],
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.03,
              ),
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         'Meetings calendar view',
              //         style: GoogleFonts.poppins(
              //           textStyle: TextStyle(
              //               color: textColor,
              //               height: 1.3,
              //               fontSize: height * 0.018,
              //               fontWeight: FontWeight.w400),
              //         ),
              //       ),
              //       CupertinoButton(
              //         padding: const EdgeInsets.all(0.0),
              //         minSize: 0.0001,
              //         onPressed: null,
              //         child: Container(),
              //       )
              //     ],
              //   ),
              // ),
              // SizedBox(height: height * 0.02),
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Obx(
              //         () => CupertinoButton(
              //           padding: EdgeInsets.all(0.0),
              //           minSize: 0.0001,
              //           onPressed: () {
              //             calendarMeetings.value = 0;
              //           },
              //           child: Container(
              //             padding: EdgeInsets.symmetric(
              //                 horizontal: width * 0.04,
              //                 vertical: height * 0.008),
              //             decoration: BoxDecoration(
              //               color: calendarMeetings.value == 0
              //                   ? primaryLight
              //                   : grey.withOpacity(0.1),
              //               borderRadius: BorderRadius.circular(width * 5),
              //             ),
              //             child: Row(
              //               children: [
              //                 Text(
              //                   'Weekly',
              //                   style: GoogleFonts.poppins(
              //                     textStyle: TextStyle(
              //                         color: calendarMeetings.value == 0
              //                             ? primaryBlue
              //                             : grey,
              //                         height: 1.3,
              //                         fontSize: width * 0.035,
              //                         fontWeight: FontWeight.w500),
              //                   ),
              //                 ),
              //                 SizedBox(
              //                   width: calendarMeetings.value == 0
              //                       ? width * 0.01
              //                       : 0,
              //                 ),
              //                 Container(
              //                   child: calendarMeetings.value == 0
              //                       ? Icon(
              //                           UniconsLine.check_circle,
              //                           color: primaryBlue,
              //                           size: height * 0.024,
              //                         )
              //                       : null,
              //                 )
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         width: width * 0.03,
              //       ),
              //       Obx(
              //         () => CupertinoButton(
              //           padding: EdgeInsets.all(0.0),
              //           minSize: 0.0001,
              //           onPressed: () {
              //             calendarMeetings.value = 1;
              //           },
              //           child: Container(
              //             padding: EdgeInsets.symmetric(
              //                 horizontal: width * 0.04,
              //                 vertical: height * 0.008),
              //             decoration: BoxDecoration(
              //               color: calendarMeetings.value == 1
              //                   ? primaryLight
              //                   : grey.withOpacity(0.1),
              //               borderRadius: BorderRadius.circular(width * 5),
              //             ),
              //             child: Row(
              //               children: [
              //                 Text(
              //                   'Monthly',
              //                   style: GoogleFonts.poppins(
              //                     textStyle: TextStyle(
              //                         color: calendarMeetings.value == 1
              //                             ? primaryBlue
              //                             : grey,
              //                         height: 1.3,
              //                         fontSize: width * 0.035,
              //                         fontWeight: FontWeight.w500),
              //                   ),
              //                 ),
              //                 SizedBox(
              //                   width: calendarMeetings.value == 1
              //                       ? width * 0.01
              //                       : 0,
              //                 ),
              //                 Container(
              //                   child: calendarMeetings.value == 1
              //                       ? Icon(
              //                           UniconsLine.check_circle,
              //                           color: primaryBlue,
              //                           size: height * 0.024,
              //                         )
              //                       : null,
              //                 )
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: height * 0.03,
              // ),
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         'Tasks calendar view',
              //         style: GoogleFonts.poppins(
              //           textStyle: TextStyle(
              //               color: textColor,
              //               height: 1.3,
              //               fontSize: height * 0.018,
              //               fontWeight: FontWeight.w400),
              //         ),
              //       ),
              //       CupertinoButton(
              //         padding: const EdgeInsets.all(0.0),
              //         minSize: 0.0001,
              //         onPressed: null,
              //         child: Container(),
              //       )
              //     ],
              //   ),
              // ),
              // SizedBox(height: height * 0.02),
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Obx(
              //         () => CupertinoButton(
              //           padding: EdgeInsets.all(0.0),
              //           minSize: 0.0001,
              //           onPressed: () {
              //             calendarTasks.value = 0;
              //           },
              //           child: Container(
              //             padding: EdgeInsets.symmetric(
              //                 horizontal: width * 0.04,
              //                 vertical: height * 0.008),
              //             decoration: BoxDecoration(
              //               color: calendarTasks.value == 0
              //                   ? primaryLight
              //                   : grey.withOpacity(0.1),
              //               borderRadius: BorderRadius.circular(width * 5),
              //             ),
              //             child: Row(
              //               children: [
              //                 Text(
              //                   'Weekly',
              //                   style: GoogleFonts.poppins(
              //                     textStyle: TextStyle(
              //                         color: calendarTasks.value == 0
              //                             ? primaryBlue
              //                             : grey,
              //                         height: 1.3,
              //                         fontSize: width * 0.035,
              //                         fontWeight: FontWeight.w500),
              //                   ),
              //                 ),
              //                 SizedBox(
              //                   width:
              //                       calendarTasks.value == 0 ? width * 0.01 : 0,
              //                 ),
              //                 Container(
              //                   child: calendarTasks.value == 0
              //                       ? Icon(
              //                           UniconsLine.check_circle,
              //                           color: primaryBlue,
              //                           size: height * 0.024,
              //                         )
              //                       : null,
              //                 )
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //       SizedBox(
              //         width: width * 0.03,
              //       ),
              //       Obx(
              //         () => CupertinoButton(
              //           padding: EdgeInsets.all(0.0),
              //           minSize: 0.0001,
              //           onPressed: () {
              //             calendarTasks.value = 1;
              //           },
              //           child: Container(
              //             padding: EdgeInsets.symmetric(
              //                 horizontal: width * 0.04,
              //                 vertical: height * 0.008),
              //             decoration: BoxDecoration(
              //               color: calendarTasks.value == 1
              //                   ? primaryLight
              //                   : grey.withOpacity(0.1),
              //               borderRadius: BorderRadius.circular(width * 5),
              //             ),
              //             child: Row(
              //               children: [
              //                 Text(
              //                   'Monthly',
              //                   style: GoogleFonts.poppins(
              //                     textStyle: TextStyle(
              //                         color: calendarTasks.value == 1
              //                             ? primaryBlue
              //                             : grey,
              //                         height: 1.3,
              //                         fontSize: width * 0.035,
              //                         fontWeight: FontWeight.w500),
              //                   ),
              //                 ),
              //                 SizedBox(
              //                   width:
              //                       calendarTasks.value == 1 ? width * 0.01 : 0,
              //                 ),
              //                 Container(
              //                   child: calendarTasks.value == 1
              //                       ? Icon(
              //                           UniconsLine.check_circle,
              //                           color: primaryBlue,
              //                           size: height * 0.024,
              //                         )
              //                       : null,
              //                 )
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(height: height * 0.02),
              Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'New message notifications',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: textColor,
                            height: 1.3,
                            fontSize: height * 0.018,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Obx(
                      () => Switch(
                          activeColor: primaryBlue,
                          value: homeNewMeetings.value,
                          onChanged: (v) {
                            homeNewMeetings.value = v;
                          }),
                    )
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'New meeting notification',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: textColor,
                            height: 1.3,
                            fontSize: height * 0.018,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Obx(
                      () => Switch(
                          activeColor: primaryBlue,
                          value: homeNewMessages.value,
                          onChanged: (v) {
                            homeNewMessages.value = v;
                          }),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

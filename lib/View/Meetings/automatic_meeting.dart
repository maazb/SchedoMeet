import 'package:bit_planner/Controller/meeting_controller.dart';
import 'package:bit_planner/Helper/common_widgets/snackbar_error.dart';
import 'package:bit_planner/View/Meetings/select_members.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:unicons/unicons.dart';
import 'package:intl/intl.dart';

import '../../Helper/values.dart';

class AutomaticMeeting extends StatefulWidget {
  const AutomaticMeeting({Key? key}) : super(key: key);

  @override
  State<AutomaticMeeting> createState() => _AutomaticMeetingState();
}

class _AutomaticMeetingState extends State<AutomaticMeeting> {
  late double height;
  late double width;
  FocusNode titleFocus = FocusNode();
  RxInt selectedCat = 0.obs;
  MeetingController _meetingController = Get.find();
  getData() async {
    _meetingController.addedUsers.value = loadDataController.userNameList.value
        .where((e) => loadDataController.userModel.value.added!.contains(e.id))
        .toList();

    _meetingController.endDate!.value = _meetingController.selectedDay!.value;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleFocus.requestFocus();

    getData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _meetingController.selectedAttendees.clear();
    _meetingController.txtAddDetail.clear();
    _meetingController.txtAddLink.clear();
    _meetingController.txtAddTitle.clear();
    _meetingController.selectedCategory.value = "meeting";
    _meetingController.loadingAddMeeting.value = false;
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
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
                          border: Border.all(
                              color: grey.withOpacity(0.4), width: 1),
                          borderRadius: BorderRadius.circular(width * 5)),
                      child: Icon(
                        UniconsLine.arrow_left,
                        color: textColor,
                        size: height * 0.032,
                      ),
                    ),
                  ),
                  Text(
                    'Automatic Meeting',
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
            child: Column(
          children: [
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Title',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: textColor,
                          height: 1.3,
                          fontSize: height * 0.022,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  CupertinoButton(
                    padding: const EdgeInsets.all(0.0),
                    minSize: 0.0001,
                    onPressed: null,
                    child: Container(),
                  )
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            Container(
              alignment: Alignment.center,
              width: width,
              height: height * 0.06,
              decoration: BoxDecoration(
                  border: Border.all(color: grey.withOpacity(0.4), width: 1),
                  borderRadius: BorderRadius.circular(width * 0.02)),
              margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: TextField(
                focusNode: titleFocus,
                controller: _meetingController.txtAddTitle,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      overflow: TextOverflow.fade,
                      color: textColor,
                      //height: 1.3,
                      fontSize: height * 0.018,
                      fontWeight: FontWeight.w400),
                ),
                cursorColor: primaryBlue,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: width * 0.04),
                    // errorBorder: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(width * 0.02),
                    //     borderSide: BorderSide(color: red, width: 1)),
                    // focusedBorder: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(width * 0.02),
                    //     borderSide: BorderSide(color: primaryBlue, width: 1)),
                    // enabledBorder: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(width * 0.02),
                    //     borderSide:
                    //         BorderSide(color: grey.withOpacity(0.4), width: 1)),
                    border: InputBorder.none
                    //  OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(width * 0.02),
                    //     borderSide: BorderSide(
                    //         color: grey.withOpacity(0.4), width: 1))
                    ),
              ),
            ),
            SizedBox(height: height * 0.03),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Detail',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: textColor,
                          height: 1.3,
                          fontSize: height * 0.022,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  CupertinoButton(
                    padding: const EdgeInsets.all(0.0),
                    minSize: 0.0001,
                    onPressed: null,
                    child: Container(),
                  )
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            Container(
              alignment: Alignment.center,
              width: width,
              padding: EdgeInsets.symmetric(vertical: height * 0.015),
              //height: height * 0.06,
              decoration: BoxDecoration(
                  border: Border.all(color: grey.withOpacity(0.4), width: 1),
                  borderRadius: BorderRadius.circular(width * 0.02)),
              margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: TextField(
                // focusNode: titleFocus,
                controller: _meetingController.txtAddDetail,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      overflow: TextOverflow.fade,
                      color: textColor,
                      //height: 1.3,
                      fontSize: height * 0.018,
                      fontWeight: FontWeight.w400),
                ),
                cursorColor: primaryBlue,
                maxLines: 5,
                minLines: 3,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: width * 0.04),
                    // errorBorder: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(width * 0.02),
                    //     borderSide: BorderSide(color: red, width: 1)),
                    // focusedBorder: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(width * 0.02),
                    //     borderSide: BorderSide(color: primaryBlue, width: 1)),
                    // enabledBorder: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(width * 0.02),
                    //     borderSide:
                    //         BorderSide(color: grey.withOpacity(0.4), width: 1)),
                    border: InputBorder.none
                    //  OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(width * 0.02),
                    //     borderSide: BorderSide(
                    //         color: grey.withOpacity(0.4), width: 1))
                    ),
              ),
            ),
            // SizedBox(
            //   height: height * 0.03,
            // ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: width * 0.05),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         'Category',
            //         style: GoogleFonts.poppins(
            //           textStyle: TextStyle(
            //               color: textColor,
            //               height: 1.3,
            //               fontSize: height * 0.022,
            //               fontWeight: FontWeight.w500),
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
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Obx(
            //         () => CupertinoButton(
            //           padding: EdgeInsets.all(0.0),
            //           minSize: 0.0001,
            //           onPressed: () {
            //             _meetingController.selectedCategory.value = "meeting";
            //           },
            //           child: Container(
            //             padding: EdgeInsets.symmetric(
            //                 horizontal: width * 0.04, vertical: height * 0.008),
            //             decoration: BoxDecoration(
            //               color: _meetingController.selectedCategory.value ==
            //                       "meeting"
            //                   ? primaryLight
            //                   : grey.withOpacity(0.1),
            //               borderRadius: BorderRadius.circular(width * 5),
            //             ),
            //             child: Row(
            //               children: [
            //                 Text(
            //                   'Meeting',
            //                   style: GoogleFonts.poppins(
            //                     textStyle: TextStyle(
            //                         color: _meetingController
            //                                     .selectedCategory.value ==
            //                                 "meeting"
            //                             ? primaryBlue
            //                             : grey,
            //                         height: 1.3,
            //                         fontSize: width * 0.035,
            //                         fontWeight: FontWeight.w500),
            //                   ),
            //                 ),
            //                 SizedBox(
            //                   width: selectedCat.value == 0 ? width * 0.01 : 0,
            //                 ),
            //                 Container(
            //                   child:
            //                       _meetingController.selectedCategory.value ==
            //                               "meeting"
            //                           ? Icon(
            //                               UniconsLine.check_circle,
            //                               color: primaryBlue,
            //                               size: height * 0.024,
            //                             )
            //                           : null,
            //                 )
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //       Obx(
            //         () => CupertinoButton(
            //           padding: EdgeInsets.all(0.0),
            //           minSize: 0.0001,
            //           onPressed: () {
            //             _meetingController.selectedCategory.value =
            //                 "conference";
            //           },
            //           child: Container(
            //             padding: EdgeInsets.symmetric(
            //                 horizontal: width * 0.04, vertical: height * 0.008),
            //             decoration: BoxDecoration(
            //               color: _meetingController.selectedCategory.value ==
            //                       "conference"
            //                   ? primaryLight
            //                   : grey.withOpacity(0.1),
            //               borderRadius: BorderRadius.circular(width * 5),
            //             ),
            //             child: Row(
            //               children: [
            //                 Text(
            //                   'Conference',
            //                   style: GoogleFonts.poppins(
            //                     textStyle: TextStyle(
            //                         color: _meetingController
            //                                     .selectedCategory.value ==
            //                                 "conference"
            //                             ? primaryBlue
            //                             : grey,
            //                         height: 1.3,
            //                         fontSize: width * 0.035,
            //                         fontWeight: FontWeight.w500),
            //                   ),
            //                 ),
            //                 SizedBox(
            //                   width:
            //                       _meetingController.selectedCategory.value ==
            //                               "conference"
            //                           ? width * 0.01
            //                           : 0,
            //                 ),
            //                 Container(
            //                   child:
            //                       _meetingController.selectedCategory.value ==
            //                               "conference"
            //                           ? Icon(
            //                               UniconsLine.check_circle,
            //                               color: primaryBlue,
            //                               size: height * 0.024,
            //                             )
            //                           : null,
            //                 )
            //               ],
            //             ),
            //           ),
            //         ),
            //       ),
            //       Obx(
            //         () => CupertinoButton(
            //           padding: EdgeInsets.all(0.0),
            //           minSize: 0.0001,
            //           onPressed: () {
            //             _meetingController.selectedCategory.value = "workshop";
            //           },
            //           child: Container(
            //             padding: EdgeInsets.symmetric(
            //                 horizontal: width * 0.04, vertical: height * 0.008),
            //             decoration: BoxDecoration(
            //               color: _meetingController.selectedCategory.value ==
            //                       "workshop"
            //                   ? primaryLight
            //                   : grey.withOpacity(0.1),
            //               borderRadius: BorderRadius.circular(width * 5),
            //             ),
            //             child: Row(
            //               children: [
            //                 Text(
            //                   'Workshop',
            //                   style: GoogleFonts.poppins(
            //                     textStyle: TextStyle(
            //                         color: _meetingController
            //                                     .selectedCategory.value ==
            //                                 "workshop"
            //                             ? primaryBlue
            //                             : grey,
            //                         height: 1.3,
            //                         fontSize: width * 0.035,
            //                         fontWeight: FontWeight.w500),
            //                   ),
            //                 ),
            //                 SizedBox(
            //                   width: selectedCat.value == 2 ? width * 0.01 : 0,
            //                 ),
            //                 Container(
            //                   child:
            //                       _meetingController.selectedCategory.value ==
            //                               "workshop"
            //                           ? Icon(
            //                               UniconsLine.check_circle,
            //                               color: primaryBlue,
            //                               size: height * 0.024,
            //                             )
            //                           : null,
            //                 )
            //               ],
            //             ),
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            SizedBox(height: height * 0.03),
            Obx(
              () => Container(
                child: _meetingController.selectedCategory.value == "meeting"
                    ? Column(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: width * 0.05),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Date',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: textColor,
                                        height: 1.3,
                                        fontSize: height * 0.022,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                CupertinoButton(
                                  padding: const EdgeInsets.all(0.0),
                                  minSize: 0.0001,
                                  onPressed: null,
                                  child: Container(),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: width * 0.05),
                            child: Row(
                              children: [
                                CupertinoButton(
                                  padding: EdgeInsets.all(0.0),
                                  minSize: 0.0001,
                                  onPressed: () async {
                                    _meetingController.selectedDay!.value =
                                        (await showDatePicker(
                                            context: context,
                                            initialDate: _meetingController
                                                .selectedDay!.value,
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime.now()
                                                .add(Duration(days: 365))))!;
                                  },
                                  child: Container(
                                      width: width * 0.5,
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.04,
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: grey.withOpacity(0.4)),
                                          borderRadius: BorderRadius.circular(
                                              width * 0.02)),
                                      height: height * 0.06,

                                      //width: width,
                                      margin:
                                          EdgeInsets.only(right: width * 0.02),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Obx(
                                              () => Text(
                                                DateFormat('dd MMM yyyy')
                                                    .format(_meetingController
                                                        .selectedDay!.value)
                                                    .toString(),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: textColor,
                                                      height: 1.5,
                                                      fontSize: height * 0.018,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            UniconsLine.calendar_alt,
                                            color: grey,
                                            size: height * 0.03,
                                          )
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: height * 0.03),
                          Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: width * 0.05),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Preferred Time range',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: textColor,
                                        height: 1.3,
                                        fontSize: height * 0.022,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                CupertinoButton(
                                  padding: const EdgeInsets.all(0.0),
                                  minSize: 0.0001,
                                  onPressed: null,
                                  child: Container(),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: width * 0.05),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CupertinoButton(
                                    padding: EdgeInsets.all(0.0),
                                    minSize: 0.0001,
                                    onPressed: () async {
                                      _meetingController.startTime!.value =
                                          (await showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now()))!;
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.04,
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1,
                                                color: grey.withOpacity(0.4)),
                                            borderRadius: BorderRadius.circular(
                                                width * 0.02)),
                                        height: height * 0.06,

                                        //width: width,
                                        margin: EdgeInsets.only(
                                            right: width * 0.02),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Obx(
                                                () => Text(
                                                  _meetingController
                                                      .startTime!.value
                                                      .format(context)
                                                      .toString(),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: textColor,
                                                        height: 1.5,
                                                        fontSize:
                                                            height * 0.018,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
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
                                Container(
                                  height: 1.5,
                                  width: 10,
                                  color: grey,
                                ),
                                Expanded(
                                  child: CupertinoButton(
                                    padding: EdgeInsets.all(0.0),
                                    minSize: 0.0001,
                                    onPressed: () async {
                                      _meetingController.endTime!.value =
                                          (await showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now()))!;
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.04,
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1,
                                                color: grey.withOpacity(0.4)),
                                            borderRadius: BorderRadius.circular(
                                                width * 0.02)),
                                        height: height * 0.06,

                                        //width: width,
                                        margin:
                                            EdgeInsets.only(left: width * 0.02),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Obx(
                                                () => Text(
                                                  _meetingController
                                                      .endTime!.value
                                                      .format(context)
                                                      .toString(),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: textColor,
                                                        height: 1.5,
                                                        fontSize:
                                                            height * 0.018,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
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
                              ],
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: width * 0.05),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Dates',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: textColor,
                                        height: 1.3,
                                        fontSize: height * 0.022,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                CupertinoButton(
                                  padding: const EdgeInsets.all(0.0),
                                  minSize: 0.0001,
                                  onPressed: null,
                                  child: Container(),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: width * 0.05),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CupertinoButton(
                                    padding: EdgeInsets.all(0.0),
                                    minSize: 0.0001,
                                    onPressed: () async {
                                      _meetingController.selectedDay!.value =
                                          (await showDatePicker(
                                              context: context,
                                              initialDate: _meetingController
                                                  .selectedDay!.value,
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime.now()
                                                  .add(Duration(days: 365))))!;
                                      _meetingController.endDate!.value =
                                          _meetingController.selectedDay!.value;
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.04,
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1,
                                                color: grey.withOpacity(0.4)),
                                            borderRadius: BorderRadius.circular(
                                                width * 0.02)),
                                        height: height * 0.06,

                                        //width: width,
                                        margin: EdgeInsets.only(
                                            right: width * 0.02),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Obx(
                                                () => Text(
                                                  DateFormat('dd MMM yyyy')
                                                      .format(_meetingController
                                                          .selectedDay!.value)
                                                      .toString(),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: textColor,
                                                        height: 1.5,
                                                        fontSize:
                                                            height * 0.018,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              UniconsLine.calendar_alt,
                                              color: grey,
                                              size: height * 0.03,
                                            )
                                          ],
                                        )),
                                  ),
                                ),
                                Container(
                                  height: 1.5,
                                  width: 10,
                                  color: grey,
                                ),
                                Expanded(
                                  child: CupertinoButton(
                                    padding: EdgeInsets.all(0.0),
                                    minSize: 0.0001,
                                    onPressed: () async {
                                      _meetingController.endDate!.value =
                                          (await showDatePicker(
                                              context: context,
                                              initialDate: _meetingController
                                                  .endDate!.value,
                                              firstDate: _meetingController
                                                  .selectedDay!.value,
                                              lastDate: DateTime.now()
                                                  .add(Duration(days: 365))))!;
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.04,
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1,
                                                color: grey.withOpacity(0.4)),
                                            borderRadius: BorderRadius.circular(
                                                width * 0.02)),
                                        height: height * 0.06,

                                        //width: width,
                                        margin:
                                            EdgeInsets.only(left: width * 0.02),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Obx(
                                                () => Text(
                                                  DateFormat('dd MMM yyyy')
                                                      .format(_meetingController
                                                          .endDate!.value)
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: textColor,
                                                        height: 1.5,
                                                        fontSize:
                                                            height * 0.018,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              UniconsLine.calendar_alt,
                                              color: grey,
                                              size: height * 0.03,
                                            )
                                          ],
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: height * 0.03),
                          Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: width * 0.05),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Timing',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: textColor,
                                        height: 1.3,
                                        fontSize: height * 0.022,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                CupertinoButton(
                                  padding: const EdgeInsets.all(0.0),
                                  minSize: 0.0001,
                                  onPressed: null,
                                  child: Container(),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: width * 0.05),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CupertinoButton(
                                    padding: EdgeInsets.all(0.0),
                                    minSize: 0.0001,
                                    onPressed: () async {
                                      _meetingController.startTime!.value =
                                          (await showTimePicker(
                                              context: context,
                                              initialTime: _meetingController
                                                  .startTime!.value))!;
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.04,
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1,
                                                color: grey.withOpacity(0.4)),
                                            borderRadius: BorderRadius.circular(
                                                width * 0.02)),
                                        height: height * 0.06,

                                        //width: width,
                                        margin: EdgeInsets.only(
                                            right: width * 0.02),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Obx(
                                                () => Text(
                                                  _meetingController
                                                      .startTime!.value
                                                      .format(context)
                                                      .toString(),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: textColor,
                                                        height: 1.5,
                                                        fontSize:
                                                            height * 0.018,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
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
                                Container(
                                  height: 1.5,
                                  width: 10,
                                  color: grey,
                                ),
                                Expanded(
                                  child: CupertinoButton(
                                    padding: EdgeInsets.all(0.0),
                                    minSize: 0.0001,
                                    onPressed: () async {
                                      _meetingController.endTime!.value =
                                          (await showTimePicker(
                                        context: context,
                                        initialTime:
                                            _meetingController.endTime!.value,
                                      ))!;
                                    },
                                    child: Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.04,
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1,
                                                color: grey.withOpacity(0.4)),
                                            borderRadius: BorderRadius.circular(
                                                width * 0.02)),
                                        height: height * 0.06,

                                        //width: width,
                                        margin:
                                            EdgeInsets.only(left: width * 0.02),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Obx(
                                                () => Text(
                                                  _meetingController
                                                      .endTime!.value
                                                      .format(context)
                                                      .toString(),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: textColor,
                                                        height: 1.5,
                                                        fontSize:
                                                            height * 0.018,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
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
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            SizedBox(height: height * 0.03),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Duration(Minutes)',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: textColor,
                          height: 1.3,
                          fontSize: height * 0.022,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  CupertinoButton(
                    padding: const EdgeInsets.all(0.0),
                    minSize: 0.0001,
                    onPressed: null,
                    child: Container(),
                  )
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            Container(
              alignment: Alignment.center,
              width: width,
              height: height * 0.06,
              decoration: BoxDecoration(
                  color: white,
                  border: Border.all(color: grey.withOpacity(0.4), width: 1),
                  borderRadius: BorderRadius.circular(width * 0.02)),
              margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              padding: EdgeInsets.only(top: height * 0.01),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: TextField(
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            overflow: TextOverflow.fade,
                            color: textColor,
                            //height: 1.3,
                            fontSize: height * 0.018,
                            fontWeight: FontWeight.w400),
                      ),
                      cursorColor: primaryBlue,
                      keyboardType: TextInputType.number,
                      controller: _meetingController.txtDuration,
                      maxLength: 3,
                      decoration: InputDecoration(
                          isDense: true,
                          counter: SizedBox.shrink(),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: width * 0.04),
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Meeting Link',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: textColor,
                          height: 1.3,
                          fontSize: height * 0.022,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Text(
                    '(Optional)',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: textColor,
                          height: 1.3,
                          fontSize: height * 0.016,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            Container(
              alignment: Alignment.center,
              width: width,
              height: height * 0.06,
              decoration: BoxDecoration(
                  border: Border.all(color: grey.withOpacity(0.4), width: 1),
                  borderRadius: BorderRadius.circular(width * 0.02)),
              margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: TextField(
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      overflow: TextOverflow.fade,
                      color: textColor,
                      //height: 1.3,
                      fontSize: height * 0.018,
                      fontWeight: FontWeight.w400),
                ),
                cursorColor: primaryBlue,
                controller: _meetingController.txtAddLink,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: width * 0.04),
                    // errorBorder: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(width * 0.02),
                    //     borderSide: BorderSide(color: red, width: 1)),
                    // focusedBorder: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(width * 0.02),
                    //     borderSide: BorderSide(color: primaryBlue, width: 1)),
                    // enabledBorder: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(width * 0.02),
                    //     borderSide:
                    //         BorderSide(color: grey.withOpacity(0.4), width: 1)),
                    border: InputBorder.none
                    //  OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(width * 0.02),
                    //     borderSide: BorderSide(
                    //         color: grey.withOpacity(0.4), width: 1))
                    ),
              ),
            ),
            SizedBox(height: height * 0.03),
            CupertinoButton(
              padding: EdgeInsets.all(0.0),
              minSize: 0.0001,
              onPressed: () {
                Get.to(() => SelectMembers());
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Attendees',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: textColor,
                            height: 1.3,
                            fontSize: height * 0.022,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Container(
                      height: width * 0.08,
                      width: width * 0.08,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width * 5),
                          border: Border.all(
                              color: grey.withOpacity(0.4), width: 1)),
                      child: Icon(
                        UniconsLine.plus,
                        size: width * 0.05,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Obx(
              () => ListView.builder(
                  itemCount: _meetingController.selectedAttendees.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        CupertinoButton(
                          padding: const EdgeInsets.all(0.0),
                          minSize: 0.0001,
                          onPressed: () {},
                          child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: width * 0.05),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: width * 0.13,
                                    width: width * 0.13,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(width * 5),
                                      child: CachedNetworkImage(
                                        imageUrl: _meetingController
                                                        .selectedAttendees[
                                                            index]
                                                        .image ==
                                                    "" ||
                                                _meetingController
                                                        .selectedAttendees[
                                                            index]
                                                        .image ==
                                                    null
                                            ? picPlaceHolder
                                            : _meetingController
                                                .selectedAttendees[index]
                                                .image!,
                                        fit: BoxFit.cover,
                                        height: height * 0.05,
                                        width: height * 0.05,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.04,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _meetingController
                                              .selectedAttendees[index].name!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: textColor,
                                                //height: 1.3,
                                                fontSize: height * 0.02,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Text(
                                          _meetingController
                                              .selectedAttendees[index].email!,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: grey,
                                                //height: 1.3,
                                                fontSize: height * 0.016,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // CupertinoButton(
                                  //   padding: const EdgeInsets.all(0.0),
                                  //   minSize: 0.0001,
                                  //   onPressed: null,
                                  //   child: Container(
                                  //     margin: EdgeInsets.only(
                                  //         left: width * 0.02),
                                  //     padding: EdgeInsets.symmetric(
                                  //         horizontal: width * 0.025,
                                  //         vertical: height * 0.008),
                                  //     decoration: BoxDecoration(
                                  //         color: primaryLight,
                                  //         borderRadius:
                                  //             BorderRadius.circular(
                                  //                 width * 5)),
                                  //     child: Text(
                                  //       _calendarController
                                  //           .eventList[index].time!,
                                  //       maxLines: 1,
                                  //       overflow: TextOverflow.ellipsis,
                                  //       style: GoogleFonts.poppins(
                                  //         textStyle: TextStyle(
                                  //             color: primaryBlue,
                                  //             //height: 1.3,
                                  //             fontSize: height * 0.015,
                                  //             fontWeight: FontWeight.w500),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // )
                                ],
                              )),
                        ),
                        SizedBox(
                          height: height * 0.022,
                        )
                      ],
                    );
                  }),
            ),
            SizedBox(height: height * 0.2),
          ],
        )),
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
                onPressed: () async {
                  if (_meetingController.txtAddTitle.text.isEmpty ||
                      _meetingController.txtAddDetail.text.isEmpty ||
                      // _meetingController.selectedAttendees.isEmpty ||
                      _meetingController.txtDuration.text.isEmpty) {
                    await showSnackbarError("Incomplete data",
                        "Title, Detail, Duration and Attendees must be entered.");
                  } else {
                    await _meetingController.addMeetingAuto();
                  }
                },
                child: Obx(
                  () => Container(
                    alignment: Alignment.center,
                    width: width * 0.9,
                    height: height * 0.07,
                    padding: EdgeInsets.symmetric(vertical: height * 0.005),
                    decoration: BoxDecoration(
                        color: primaryBlue,
                        borderRadius: BorderRadius.circular(width * 5)),
                    child: _meetingController.loadingAddMeeting.value
                        ? Container(
                            height: height * 0.03,
                            width: height * 0.03,
                            child: CircularProgressIndicator(
                              color: white,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            "Add Meeting",
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
              ),
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}

import 'package:bit_planner/Controller/meeting_controller.dart';
import 'package:bit_planner/View/Meetings/meeting_failure.dart';
import 'package:bit_planner/View/Meetings/meeting_success.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleFocus.requestFocus();
  }

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
                  'Add Meeting',
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
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
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
                    'Category',
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
              margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => CupertinoButton(
                      padding: EdgeInsets.all(0.0),
                      minSize: 0.0001,
                      onPressed: () {
                        selectedCat.value = 0;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.04, vertical: height * 0.008),
                        decoration: BoxDecoration(
                          color: selectedCat.value == 0
                              ? primaryLight
                              : grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(width * 5),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Meeting',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: selectedCat.value == 0
                                        ? primaryBlue
                                        : grey,
                                    height: 1.3,
                                    fontSize: width * 0.035,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: selectedCat.value == 0 ? width * 0.01 : 0,
                            ),
                            Container(
                              child: selectedCat.value == 0
                                  ? Icon(
                                      UniconsLine.check_circle,
                                      color: primaryBlue,
                                      size: height * 0.024,
                                    )
                                  : null,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => CupertinoButton(
                      padding: EdgeInsets.all(0.0),
                      minSize: 0.0001,
                      onPressed: () {
                        selectedCat.value = 1;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.04, vertical: height * 0.008),
                        decoration: BoxDecoration(
                          color: selectedCat.value == 1
                              ? primaryLight
                              : grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(width * 5),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Conference',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: selectedCat.value == 1
                                        ? primaryBlue
                                        : grey,
                                    height: 1.3,
                                    fontSize: width * 0.035,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: selectedCat.value == 1 ? width * 0.01 : 0,
                            ),
                            Container(
                              child: selectedCat.value == 1
                                  ? Icon(
                                      UniconsLine.check_circle,
                                      color: primaryBlue,
                                      size: height * 0.024,
                                    )
                                  : null,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => CupertinoButton(
                      padding: EdgeInsets.all(0.0),
                      minSize: 0.0001,
                      onPressed: () {
                        selectedCat.value = 2;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.04, vertical: height * 0.008),
                        decoration: BoxDecoration(
                          color: selectedCat.value == 2
                              ? primaryLight
                              : grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(width * 5),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Workshop',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: selectedCat.value == 2
                                        ? primaryBlue
                                        : grey,
                                    height: 1.3,
                                    fontSize: width * 0.035,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: selectedCat.value == 2 ? width * 0.01 : 0,
                            ),
                            Container(
                              child: selectedCat.value == 2
                                  ? Icon(
                                      UniconsLine.check_circle,
                                      color: primaryBlue,
                                      size: height * 0.024,
                                    )
                                  : null,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: height * 0.03),
            Obx(
              () => Container(
                child: selectedCat.value == 0
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
                                    _meetingController.startDate!.value =
                                        (await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime.now()
                                                .add(Duration(days: 365))))!;
                                  },
                                  child: Container(
                                      width: width * 0.45,
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
                                                        .startDate!.value)
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
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: width * 0.05),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Preferred time slots',
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
                            child: ListView.builder(
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
                                        margin: EdgeInsets.symmetric(
                                            horizontal: width * 0.05),
                                        child: CupertinoButton(
                                          padding: EdgeInsets.all(0.0),
                                          minSize: 0.0001,
                                          onPressed: () {
                                            if (_meetingController
                                                .selectedTimeSlots
                                                .contains(index)) {
                                              _meetingController
                                                  .selectedTimeSlots
                                                  .remove(index);
                                            } else {
                                              _meetingController
                                                  .selectedTimeSlots
                                                  .add(index);
                                            }
                                          },
                                          child: Obx(
                                            () => Container(
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: width * 0.04,
                                                ),
                                                decoration: BoxDecoration(
                                                    color: _meetingController
                                                            .selectedTimeSlots
                                                            .value
                                                            .contains(index)
                                                        ? primaryBlue
                                                        : white,
                                                    border: Border.all(
                                                        width: 1,
                                                        color: _meetingController
                                                                .selectedTimeSlots
                                                                .value
                                                                .contains(index)
                                                            ? primaryBlue
                                                            : grey.withOpacity(
                                                                0.4)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            width * 0.02)),
                                                height: height * 0.06,

                                                //width: width,

                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Obx(
                                                      () => Text(
                                                        _meetingController
                                                                .startTime!
                                                                .value
                                                                .format(context)
                                                                .toString() +
                                                            " - " +
                                                            _meetingController
                                                                .endTime!.value
                                                                .format(context)
                                                                .toString(),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style:
                                                            GoogleFonts.poppins(
                                                          textStyle: TextStyle(
                                                              color: _meetingController
                                                                      .selectedTimeSlots
                                                                      .contains(
                                                                          index)
                                                                  ? white
                                                                  : textColor,
                                                              height: 1.5,
                                                              fontSize: height *
                                                                  0.018,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      UniconsLine.clock,
                                                      color: _meetingController
                                                              .selectedTimeSlots
                                                              .value
                                                              .contains(index)
                                                          ? white
                                                          : grey,
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
                          SizedBox(height: height * 0.03),
                          Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: width * 0.05),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Duration (minutes)',
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
                            alignment: Alignment.center,
                            width: width,
                            height: height * 0.06,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: grey.withOpacity(0.4), width: 1),
                                borderRadius:
                                    BorderRadius.circular(width * 0.02)),
                            margin:
                                EdgeInsets.symmetric(horizontal: width * 0.05),
                            child: TextField(
                              focusNode: titleFocus,
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
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: width * 0.04),
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
                                  'Preferred dates',
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
                                      _meetingController.startDate!.value =
                                          (await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
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
                                                          .startDate!.value)
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
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
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
                                  'Duration',
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
                            alignment: Alignment.center,
                            width: width,
                            height: height * 0.06,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: grey.withOpacity(0.4), width: 1),
                                borderRadius:
                                    BorderRadius.circular(width * 0.02)),
                            margin:
                                EdgeInsets.symmetric(horizontal: width * 0.05),
                            child: TextField(
                              focusNode: titleFocus,
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
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: width * 0.04),
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
                        ],
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
                    'Add attendees',
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
              margin: EdgeInsets.symmetric(horizontal: width * 0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CupertinoButton(
                      padding: const EdgeInsets.all(0.0),
                      minSize: 0.0001,
                      onPressed: null,
                      child: SizedBox(
                          width: width * 0.25,
                          height: height * 0.05,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Align(
                                  widthFactor: 0.6,
                                  child: CircleAvatar(
                                    radius: width * 0.05,
                                    backgroundColor: Colors.white,
                                    child: index == 3
                                        ? CircleAvatar(
                                            radius: width * 0.045,
                                            backgroundColor: primaryBlue,
                                            child: Text(
                                              '+4',
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    color: white,
                                                    //height: 1.3,
                                                    fontSize: height * 0.018,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          )
                                        : CircleAvatar(
                                            radius: width * 0.045,

                                            backgroundImage: Image.asset(
                                                    "assets/images/profile2.jpg")
                                                .image, // Provide your custom image
                                          ),
                                  ),
                                );
                              }))),
                  SizedBox(width: width * 0.03),
                  CupertinoButton(
                    padding: EdgeInsets.all(0.0),
                    minSize: 0.0001,
                    onPressed: () {},
                    child: Container(
                      height: width * 0.1,
                      width: width * 0.1,
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
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.2,
            ),
          ],
        )),
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
                if (_meetingController.selectedTimeSlots.contains(3)) {
                  Get.to(() => MeetingFailure());
                } else {
                  Get.to(() => MeetingSuccess());
                }
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
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

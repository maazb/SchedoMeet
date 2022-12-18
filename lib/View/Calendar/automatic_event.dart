import 'package:bit_planner/Controller/calendar_controller.dart';
import 'package:bit_planner/Controller/meeting_controller.dart';
import 'package:bit_planner/Helper/common_widgets/snackbar_error.dart';
import 'package:bit_planner/View/Calendar/select_event_memebers.dart';
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

class AutomaticEvent extends StatefulWidget {
  const AutomaticEvent({Key? key}) : super(key: key);

  @override
  State<AutomaticEvent> createState() => _AutomaticEventState();
}

class _AutomaticEventState extends State<AutomaticEvent> {
  late double height;
  late double width;
  FocusNode titleFocus = FocusNode();
  RxInt selectedCat = 0.obs;
  CalendarController _eventController = Get.find();
  getData() async {
    _eventController.addedUsers.value = loadDataController.userNameList.value
        .where((e) => loadDataController.userModel.value.added!.contains(e.id))
        .toList();
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
    _eventController.selectedAttendees.clear();
    _eventController.txtAddDetail.clear();
    _eventController.txtAddTitle.clear();
    _eventController.txtDuration.clear();
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
                    'Automatic Event',
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
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      overflow: TextOverflow.fade,
                      color: textColor,
                      //height: 1.3,
                      fontSize: height * 0.018,
                      fontWeight: FontWeight.w400),
                ),
                cursorColor: primaryBlue,
                controller: _eventController.txtAddTitle,
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
                controller: _eventController.txtAddDetail,
                // focusNode: titleFocus,
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
            SizedBox(
              height: height * 0.03,
            ),
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(
                    () => CupertinoButton(
                      padding: EdgeInsets.all(0.0),
                      minSize: 0.0001,
                      onPressed: () {
                        _eventController.selectedCategory.value = "event";
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.04, vertical: height * 0.008),
                        decoration: BoxDecoration(
                          color:
                              _eventController.selectedCategory.value == "event"
                                  ? primaryLight
                                  : grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(width * 5),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Event',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: _eventController
                                                .selectedCategory.value ==
                                            "event"
                                        ? primaryBlue
                                        : grey,
                                    height: 1.3,
                                    fontSize: width * 0.035,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: _eventController.selectedCategory.value ==
                                      "event"
                                  ? width * 0.01
                                  : 0,
                            ),
                            Container(
                              child: _eventController.selectedCategory.value ==
                                      "event"
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
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Obx(
                    () => CupertinoButton(
                      padding: EdgeInsets.all(0.0),
                      minSize: 0.0001,
                      onPressed: () {
                        _eventController.selectedCategory.value = "task";
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.04, vertical: height * 0.008),
                        decoration: BoxDecoration(
                          color:
                              _eventController.selectedCategory.value == "task"
                                  ? primaryLight
                                  : grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(width * 5),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Task',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: _eventController
                                                .selectedCategory.value ==
                                            "task"
                                        ? primaryBlue
                                        : grey,
                                    height: 1.3,
                                    fontSize: width * 0.035,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              width: _eventController.selectedCategory.value ==
                                      "task"
                                  ? width * 0.01
                                  : 0,
                            ),
                            Container(
                              child: _eventController.selectedCategory.value ==
                                      "task"
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
                ],
              ),
            ),
            SizedBox(height: height * 0.03),
            Container(
                child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.05),
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
                  margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Row(
                    children: [
                      CupertinoButton(
                        padding: EdgeInsets.all(0.0),
                        minSize: 0.0001,
                        onPressed: () async {
                          _eventController.selectedDay!.value =
                              (await showDatePicker(
                                  context: context,
                                  initialDate:
                                      _eventController.selectedDay!.value,
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
                                    width: 1, color: grey.withOpacity(0.4)),
                                borderRadius:
                                    BorderRadius.circular(width * 0.02)),
                            height: height * 0.06,

                            //width: width,
                            margin: EdgeInsets.only(right: width * 0.02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Obx(
                                    () => Text(
                                      DateFormat('dd MMM yyyy')
                                          .format(_eventController
                                              .selectedDay!.value)
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
                  margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Preferred time range',
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
                  margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Row(
                    children: [
                      Expanded(
                        child: CupertinoButton(
                          padding: EdgeInsets.all(0.0),
                          minSize: 0.0001,
                          onPressed: () async {
                            _eventController.startTime!.value =
                                (await showTimePicker(
                                    context: context,
                                    initialTime:
                                        _eventController.startTime!.value))!;
                          },
                          child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                horizontal: width * 0.04,
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: grey.withOpacity(0.4)),
                                  borderRadius:
                                      BorderRadius.circular(width * 0.02)),
                              height: height * 0.06,

                              //width: width,
                              margin: EdgeInsets.only(right: width * 0.02),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Obx(
                                      () => Text(
                                        _eventController.startTime!.value
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
                            _eventController.endTime!.value =
                                (await showTimePicker(
                                    context: context,
                                    initialTime:
                                        _eventController.endTime!.value))!;
                          },
                          child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                horizontal: width * 0.04,
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: grey.withOpacity(0.4)),
                                  borderRadius:
                                      BorderRadius.circular(width * 0.02)),
                              height: height * 0.06,

                              //width: width,
                              margin: EdgeInsets.only(left: width * 0.02),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Obx(
                                      () => Text(
                                        _eventController.endTime!.value
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
            )),
            SizedBox(
              height: height * 0.03,
            ),
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
                      controller: _eventController.txtDuration,
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
            SizedBox(height: height * 0.03),
            CupertinoButton(
              padding: EdgeInsets.all(0.0),
              minSize: 0.0001,
              onPressed: () {
                Get.to(() => SelectEventMembers());
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
                  itemCount: _eventController.selectedAttendees.length,
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
                                        imageUrl: _eventController
                                                        .selectedAttendees[
                                                            index]
                                                        .image ==
                                                    "" ||
                                                _eventController
                                                        .selectedAttendees[
                                                            index]
                                                        .image ==
                                                    null
                                            ? picPlaceHolder
                                            : _eventController
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
                                          _eventController
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
                                          _eventController
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
                  if (_eventController.txtAddTitle.text.isEmpty ||
                      _eventController.txtAddDetail.text.isEmpty ||
                      _eventController.selectedAttendees.isEmpty ||
                      _eventController.txtDuration.text.isEmpty) {
                    await showSnackbarError("Incomplete data",
                        "Title, Detail, Duration and Attendees must be entered.");
                  } else {
                    await _eventController.addEventAuto();
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
                    child: _eventController.loadingAddEvent.value
                        ? Container(
                            height: height * 0.03,
                            width: height * 0.03,
                            child: CircularProgressIndicator(
                              color: white,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            "Add Event",
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

import 'dart:core';

import 'package:bit_planner/Controller/calendar_controller.dart';
import 'package:bit_planner/Helper/values.dart';
import 'package:bit_planner/View/Calendar/event_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:unicons/unicons.dart';
import 'package:intl/intl.dart';

import '../../Controller/navigation_controller.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late double height;
  late double width;
  final CalendarController _calendarController = Get.put(CalendarController());
  PageController _pageController = PageController();
  ScrollController _scrollController = ScrollController();
  NavigationController _navigationController = Get.find();

  getData() async {
    await _calendarController.getEvents();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: greyLight,
      appBar: AppBar(
        toolbarHeight: height * 0.1,
        automaticallyImplyLeading: false,
        titleSpacing: 0.0,
        backgroundColor: greyLight,
        elevation: 0,
        // systemOverlayStyle: SystemUiOverlayStyle(
        //   statusBarBrightness: Brightness.light,
        //   statusBarColor: greyLight,
        //   statusBarIconBrightness: Brightness.dark,
        // ),
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
                    _navigationController.persistentTabController.jumpToTab(0);
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
                  'Calendar',
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
                  onPressed: () {},
                  child: Container(
                    padding: EdgeInsets.all(width * 0.028),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: grey.withOpacity(0.4), width: 1),
                        borderRadius: BorderRadius.circular(width * 5)),
                    child: Icon(
                      UniconsLine.plus,
                      color: textColor,
                      size: height * 0.032,
                    ),
                  ),
                )
              ],
            )),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              margin: EdgeInsets.only(
                  right: width * 0.05, left: width * 0.05, top: 0),
              child: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: height * 0),
                          width: width,
                          //height: height * 0.055,
                          // decoration: BoxDecoration(
                          //   color: white,
                          //   borderRadius: BorderRadius.circular(width * 0.03),
                          //   // boxShadow: [
                          //   //   BoxShadow(
                          //   //       blurRadius: 20,
                          //   //       color: shadowgrey,
                          //   //       offset: const Offset(0, 1))
                          //   //]
                          // ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Obx(
                                  () => Text(
                                    DateFormat('MMMM yyyy')
                                        .format(_calendarController
                                            .focusedDay!.value)
                                        .toString(),
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: textColor,
                                          height: 1,
                                          fontSize: height * 0.024,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                              CupertinoButton(
                                padding: EdgeInsets.all(0.0),
                                minSize: width * 0.08,
                                onPressed: () {
                                  _pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeOut);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(height * 0.01),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: grey.withOpacity(0.4)),
                                      borderRadius:
                                          BorderRadius.circular(width * 5)),
                                  child: Icon(
                                    Icons.arrow_back_ios_sharp,
                                    color: textColor,
                                    size: height * 0.02,
                                  ),
                                ),
                              ),
                              SizedBox(width: width * 0.035),
                              CupertinoButton(
                                padding: EdgeInsets.all(0.0),
                                minSize: width * 0.08,
                                onPressed: () {
                                  _pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeOut);
                                  // int difference = _calendarController
                                  //     .focusedDay!.value
                                  //     .difference(DateTime.now()
                                  //         .add(Duration(days: 360)))
                                  //     .inDays;
                                  // // int val = (difference / 30).floor();
                                  // print(difference);
                                  // if (difference < 30) {
                                  //   _calendarController.focusedDay!.value =
                                  //       _calendarController.focusedDay!.value
                                  //           .add(Duration(days: 30));
                                  // }
                                },
                                child: Container(
                                  padding: EdgeInsets.all(height * 0.01),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: grey.withOpacity(0.4)),
                                      borderRadius:
                                          BorderRadius.circular(width * 5)),
                                  child: Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    color: textColor,
                                    size: height * 0.02,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(width * 0.03),
                        //boxShadow: [
                        //   BoxShadow(
                        //       blurRadius: 20,
                        //       color: shadowgrey,
                        //       offset: const Offset(0, 1))
                        // ]
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.02, vertical: height * 0.01),
                      child: Obx(
                        () => TableCalendar(
                          focusedDay: _calendarController.focusedDay!.value,
                          firstDay: DateTime.now()
                              .subtract(const Duration(days: 365)),
                          lastDay:
                              DateTime.now().add(const Duration(days: 365)),
                          calendarFormat: CalendarFormat.month,
                          startingDayOfWeek: StartingDayOfWeek.monday,
                          daysOfWeekHeight: height * 0.05,
                          rowHeight: height * 0.05,
                          headerVisible: false,
                          // eventLoader: (day) {
                          //   if (day.weekday == DateTime.sunday ||
                          //       day.weekday == DateTime.saturday) {
                          //     return [];
                          //   }
                          //   if (day.day == 25) {
                          //     return ['Absent'];
                          //   } else {
                          //     return ['Present'];
                          //   }
                          // },
                          // calendarBuilders: CalendarBuilders(
                          //   singleMarkerBuilder: (context, date, _) {
                          //     return Container(
                          //       decoration: BoxDecoration(
                          //           shape: BoxShape.circle,
                          //           color: primaryBlue,
                          //           border: Border.all(
                          //               color: white, width: 1)), //Change color
                          //       width: 6.0,
                          //       height: 6.0,
                          //       margin:
                          //           const EdgeInsets.symmetric(horizontal: 1.5),
                          //     );
                          //   },
                          // ),
                          headerStyle: HeaderStyle(
                            headerMargin:
                                EdgeInsets.only(bottom: height * 0.02),
                            titleTextStyle: GoogleFonts.poppins(
                              fontSize: height * 0.016,
                              color: textColor,
                              fontWeight: FontWeight.w400,
                            ),
                            formatButtonShowsNext: false,
                            formatButtonVisible: false,
                            titleCentered: true,
                          ),
                          daysOfWeekStyle: DaysOfWeekStyle(
                            weekdayStyle: GoogleFonts.poppins(
                              fontSize: height * 0.016,
                              color: textColor,
                              fontWeight: FontWeight.w400,
                            ),
                            weekendStyle: GoogleFonts.poppins(
                              fontSize: height * 0.016,
                              color: textColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          calendarStyle: CalendarStyle(
                            defaultTextStyle: GoogleFonts.poppins(
                              fontSize: height * 0.016,
                              color: textColor,
                              fontWeight: FontWeight.w400,
                            ),
                            weekendTextStyle: GoogleFonts.poppins(
                              fontSize: height * 0.016,
                              color: textColor,
                              fontWeight: FontWeight.w400,
                            ),
                            selectedTextStyle: GoogleFonts.poppins(
                              fontSize: height * 0.016,
                              color: white,
                              fontWeight: FontWeight.w400,
                            ),
                            todayTextStyle: GoogleFonts.poppins(
                              fontSize: height * 0.016,
                              color: textColor,
                              fontWeight: FontWeight.w400,
                            ),
                            disabledTextStyle: GoogleFonts.poppins(
                              fontSize: height * 0.016,
                              color: grey,
                              fontWeight: FontWeight.w400,
                            ),
                            rangeEndTextStyle: GoogleFonts.poppins(
                              fontSize: height * 0.016,
                              color: grey,
                              fontWeight: FontWeight.w400,
                            ),
                            outsideTextStyle: GoogleFonts.poppins(
                              fontSize: height * 0.016,
                              color: grey,
                              fontWeight: FontWeight.w400,
                            ),
                            selectedDecoration: BoxDecoration(
                              color: primaryBlue,
                              shape: BoxShape.circle,
                            ),
                            isTodayHighlighted: true,
                            todayDecoration: BoxDecoration(
                              border: Border.all(color: primaryBlue, width: 1),
                              shape: BoxShape.circle,
                            ),
                            markerDecoration: BoxDecoration(
                              color: grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                          selectedDayPredicate: (day) {
                            return isSameDay(
                                _calendarController.selectedDay!.value, day);
                          },
                          onDaySelected: (selectedDay, focusedDay) {
                            setState(() {
                              _calendarController.selectedDay!.value =
                                  selectedDay;
                              _calendarController.focusedDay!.value =
                                  selectedDay;
                            });
                            // update `_focusedDay` here as well
                          },
                          onCalendarCreated: (controller) =>
                              _pageController = controller,
                          onPageChanged: (focusedDay) => _calendarController
                              .focusedDay!.value = focusedDay,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              color: white,
              width: width,
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  // Container(
                  //   margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         'Meetings',
                  //         style: GoogleFonts.poppins(
                  //           textStyle: TextStyle(
                  //               color: textColor,
                  //               height: 1.3,
                  //               fontSize: height * 0.024,
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
                  // SizedBox(
                  //   height: height * 0.02,
                  // ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Schedule',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: textColor,
                                height: 1.3,
                                fontSize: height * 0.024,
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
                  ListView.builder(
                      itemCount: _calendarController.eventList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            CupertinoButton(
                              padding: const EdgeInsets.all(0.0),
                              minSize: 0.0001,
                              onPressed: () {
                                Get.to(() => EventDetail());
                              },
                              child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: width * 0.05),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      CupertinoButton(
                                        padding: const EdgeInsets.all(0.0),
                                        minSize: 0.0001,
                                        onPressed: null,
                                        child: Container(
                                            padding:
                                                EdgeInsets.all(width * 0.04),
                                            decoration: BoxDecoration(
                                                color: greyLight,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        width * 5)),
                                            child: _calendarController
                                                        .eventList[index]
                                                        .type! ==
                                                    "meeting"
                                                ? SvgPicture.asset(
                                                    "assets/icons/Video.svg",
                                                    color: textColor,
                                                    height: width * 0.06,
                                                  )
                                                : _calendarController
                                                            .eventList[index]
                                                            .type! ==
                                                        "event"
                                                    ? SvgPicture.asset(
                                                        "assets/icons/Calendar.svg",
                                                        color: textColor,
                                                        height: width * 0.06,
                                                      )
                                                    : _calendarController
                                                                .eventList[
                                                                    index]
                                                                .type! ==
                                                            "task"
                                                        ? SvgPicture.asset(
                                                            "assets/icons/Clipboard-alt.svg",
                                                            color: textColor,
                                                            height:
                                                                width * 0.06,
                                                          )
                                                        : SvgPicture.asset(
                                                            "assets/icons/Calendar.svg",
                                                            color: textColor,
                                                            height:
                                                                width * 0.06,
                                                          )),
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
                                              _calendarController
                                                  .eventList[index].name!,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    color: textColor,
                                                    //height: 1.3,
                                                    fontSize: height * 0.018,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Text(
                                              _calendarController
                                                  .eventList[index]
                                                  .description!,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    color: grey,
                                                    //height: 1.3,
                                                    fontSize: height * 0.016,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      CupertinoButton(
                                        padding: const EdgeInsets.all(0.0),
                                        minSize: 0.0001,
                                        onPressed: null,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: width * 0.02),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: width * 0.025,
                                              vertical: height * 0.008),
                                          decoration: BoxDecoration(
                                              color: primaryLight,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      width * 5)),
                                          child: Text(
                                            _calendarController
                                                .eventList[index].time!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: primaryBlue,
                                                  //height: 1.3,
                                                  fontSize: height * 0.015,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                            SizedBox(
                              height: height * 0.022,
                            )
                          ],
                        );
                      }),
                  // SizedBox(height: height * 0.1)
                ],
              ),
            )
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: CupertinoButton(
      //   padding: EdgeInsets.all(0.0),
      //   minSize: 0.0001,
      //   onPressed: () {},
      //   child: Container(
      //     decoration: BoxDecoration(boxShadow: [
      //       BoxShadow(
      //           color: grey.withOpacity(0.7),
      //           blurRadius: 10,
      //           spreadRadius: -8,
      //           offset: Offset(2, 4))
      //     ]),
      //     child: ScrollingFabAnimated(
      //         elevation: 0,
      //         animateIcon: false,
      //         duration: Duration(milliseconds: 150),
      //         width: width * 0.37,
      //         radius: width * 0.03,
      //         icon: Icon(
      //           UniconsLine.comment_plus,
      //           color: primaryLight,
      //         ),
      //         text: Text(
      //           "Add event",
      //           maxLines: 1,
      //           overflow: TextOverflow.ellipsis,
      //           style: GoogleFonts.poppins(
      //             textStyle: TextStyle(
      //                 color: primaryLight,
      //                 //height: 1.3,
      //                 fontSize: height * 0.018,
      //                 fontWeight: FontWeight.w500),
      //           ),
      //         ),
      //         color: primaryMedium,
      //         onPress: null,
      //         scrollController: _scrollController),
      //   ),
      // )
    );
  }
}

import 'package:bit_planner/Controller/meeting_controller.dart';
import 'package:bit_planner/Controller/navigation_controller.dart';
import 'package:bit_planner/Helper/values.dart';
import 'package:bit_planner/View/Meetings/add_meeting.dart';
import 'package:bit_planner/View/Meetings/meeting_detail.dart';
import 'package:bit_planner/View/Meetings/meeting_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:unicons/unicons.dart';
import 'package:intl/intl.dart';

class Meetings extends StatefulWidget {
  const Meetings({Key? key}) : super(key: key);

  @override
  State<Meetings> createState() => _MeetingsState();
}

class _MeetingsState extends State<Meetings> {
  getData() async {
    await _meetingController.loadMeetings();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  late double height;
  late double width;
  final MeetingController _meetingController = Get.put(MeetingController());
  PageController _pageController = PageController();
  ScrollController _scrollController = ScrollController();
  NavigationController _navigationController = Get.find();
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
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: greyLight,
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
                  'Meetings',
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
                  onPressed: () {
                    Get.bottomSheet(MeetingSheet(width: width, height: height));
                  },
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
            Container(
              margin: EdgeInsets.only(
                  right: width * 0.05, left: width * 0.05, top: height * 0.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: height * 0.01,
                      ),
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
                                      .format(
                                          _meetingController.focusedDay!.value)
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
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeOut);
                              },
                              child: Container(
                                padding: EdgeInsets.all(height * 0.01),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: grey.withOpacity(0.4)),
                                    borderRadius:
                                        BorderRadius.circular(width * 5)),
                                child: Icon(
                                  Icons.arrow_back_ios_sharp,
                                  color: textColor,
                                  size: height * 0.02,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.035,
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.all(0.0),
                              minSize: width * 0.08,
                              onPressed: () {
                                _pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeOut);
                              },
                              child: Container(
                                padding: EdgeInsets.all(height * 0.01),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: grey.withOpacity(0.4)),
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
                          focusedDay: _meetingController.focusedDay!.value,
                          firstDay: DateTime.now()
                              .subtract(const Duration(days: 365)),
                          lastDay:
                              DateTime.now().add(const Duration(days: 365)),
                          calendarFormat: CalendarFormat.week,
                          startingDayOfWeek: StartingDayOfWeek.monday,
                          daysOfWeekHeight: height * 0.05,
                          rowHeight: height * 0.05,
                          headerVisible: false,
                          eventLoader: (day) {
                            if (day.weekday == DateTime.sunday ||
                                day.weekday == DateTime.saturday) {
                              return [];
                            }
                            if (day.day == 25) {
                              return ['Absent'];
                            } else {
                              return ['Present'];
                            }
                          },
                          calendarBuilders: CalendarBuilders(
                            singleMarkerBuilder: (context, date, _) {
                              return Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: primaryBlue,
                                    border: Border.all(
                                        color: white, width: 1)), //Change color
                                width: 6.0,
                                height: 6.0,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 1.5),
                              );
                            },
                          ),
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
                                _meetingController.selectedDay!.value, day);
                          },
                          onDaySelected: (selectedDay, focusedDay) async {
                            setState(() {
                              _meetingController.selectedDay!.value =
                                  selectedDay;
                              _meetingController.focusedDay!.value =
                                  selectedDay;
                            });
                            await _meetingController.loadMeetings();
                            // update `_focusedDay` here as well
                          },
                          onCalendarCreated: (controller) =>
                              _pageController = controller,
                          onPageChanged: (focusedDay) =>
                              _meetingController.focusedDay!.value = focusedDay,
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
                    height: height * 0.03,
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
                  Obx(
                    () => Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: _meetingController.loadingMeetings.value
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: height * 0.1,
                                ),
                                Container(
                                  height: width * 0.5,
                                  width: width * 0.5,
                                  child: LottieBuilder.asset(
                                    "assets/animations/loading.json",
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.2,
                                ),
                              ],
                            )
                          : _meetingController.meetingList.isEmpty
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: width * 0.5,
                                      width: width * 0.5,
                                      child: LottieBuilder.asset(
                                        "assets/animations/empty.json",
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Text(
                                      "Nothing to show here",
                                      style: GoogleFonts.poppins(
                                          color: grey,
                                          fontSize: height * 0.018,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: height * 0.2,
                                    ),
                                  ],
                                )
                              : Obx(
                                  () => ListView.builder(
                                      itemCount:
                                          _meetingController.meetingList.length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(
                                          children: [
                                            CupertinoButton(
                                              padding:
                                                  const EdgeInsets.all(0.0),
                                              minSize: 0.0001,
                                              onPressed: () {
                                                Get.to(() => MeetingDetail(
                                                          meeting:
                                                              _meetingController
                                                                      .meetingList[
                                                                  index],
                                                        ))!
                                                    .then((value) =>
                                                        _meetingController
                                                            .loadMeetings());
                                              },
                                              child: Container(
                                                //height: height * 0.15,
                                                // margin: EdgeInsets.symmetric(
                                                //     horizontal: width * 0.05,
                                                //     vertical: height * 0.03),
                                                decoration: BoxDecoration(
                                                    color: yellowLight,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            width * 0.03)),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: width * 0.04,
                                                          top: height * 0.015,
                                                          bottom:
                                                              height * 0.005,
                                                          right: width * 0.02),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              _meetingController
                                                                  .meetingList[
                                                                      index]
                                                                  .title!,
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                textStyle:
                                                                    TextStyle(
                                                                        color:
                                                                            brown,
                                                                        //height: 1.3,
                                                                        fontSize:
                                                                            height *
                                                                                0.02,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                              ),
                                                            ),
                                                          ),
                                                          CupertinoButton(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(0.0),
                                                            minSize: 0.0001,
                                                            onPressed: () {},
                                                            child: Icon(
                                                              Icons
                                                                  .more_vert_outlined,
                                                              size:
                                                                  height * 0.03,
                                                              color: grey,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      child: _meetingController
                                                                      .meetingList[
                                                                          index]
                                                                      .meetingType ==
                                                                  "conference" ||
                                                              _meetingController
                                                                      .meetingList[
                                                                          index]
                                                                      .meetingType ==
                                                                  "workshop"
                                                          ? Container(
                                                              margin: EdgeInsets.only(
                                                                  left: width *
                                                                      0.04,
                                                                  right: width *
                                                                      0.04,
                                                                  bottom:
                                                                      height *
                                                                          0.005,
                                                                  top: height *
                                                                      0.005),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .symmetric(
                                                                      horizontal:
                                                                          width *
                                                                              0.015,
                                                                      vertical:
                                                                          height *
                                                                              0.005,
                                                                    ),
                                                                    decoration: BoxDecoration(
                                                                        color: brown.withOpacity(
                                                                            0.7),
                                                                        borderRadius:
                                                                            BorderRadius.circular(width *
                                                                                0.01)),
                                                                    child: Text(
                                                                      _meetingController
                                                                          .meetingList[
                                                                              index]
                                                                          .meetingType!
                                                                          .capitalizeFirst!,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      maxLines:
                                                                          1,
                                                                      style: GoogleFonts
                                                                          .poppins(
                                                                        textStyle: TextStyle(
                                                                            color:
                                                                                white,
                                                                            height:
                                                                                1.3,
                                                                            fontSize: height *
                                                                                0.014,
                                                                            fontWeight:
                                                                                FontWeight.w400),
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          : Container(),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: width * 0.04,
                                                          right: width * 0.04,
                                                          top: height * 0.005,
                                                          bottom:
                                                              height * 0.005),
                                                      child: Text(
                                                        _meetingController
                                                            .meetingList[index]
                                                            .detail!,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.left,
                                                        maxLines: 2,
                                                        style:
                                                            GoogleFonts.poppins(
                                                          textStyle: TextStyle(
                                                              color: grey,
                                                              height: 1.3,
                                                              fontSize: height *
                                                                  0.017,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: width * 0.04,
                                                          bottom:
                                                              height * 0.015,
                                                          top: height * 0.00,
                                                          right: width * 0.04),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            DateFormat("hh:mm a").format(
                                                                    _meetingController
                                                                        .meetingList[
                                                                            index]
                                                                        .startTime!) +
                                                                " - " +
                                                                DateFormat(
                                                                        "hh:mm a")
                                                                    .format(_meetingController
                                                                        .meetingList[
                                                                            index]
                                                                        .endTime!),
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                      color:
                                                                          brown,
                                                                      //height: 1.3,
                                                                      fontSize:
                                                                          height *
                                                                              0.019,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                            ),
                                                          ),
                                                          CupertinoButton(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(0.0),
                                                              minSize: 0.0001,
                                                              onPressed: () {},
                                                              child: SizedBox(
                                                                  width: width *
                                                                      0.14,
                                                                  height:
                                                                      height *
                                                                          0.04,
                                                                  child: ListView
                                                                      .builder(
                                                                          scrollDirection: Axis
                                                                              .horizontal,
                                                                          itemCount: _meetingController.meetingList[index].attendees!.length < 3
                                                                              ? _meetingController.meetingList[index].attendees!.length
                                                                              : 3,
                                                                          itemBuilder: (context, ind) {
                                                                            return Align(
                                                                              widthFactor: 0.6,
                                                                              child: CircleAvatar(
                                                                                radius: width * 0.032,
                                                                                backgroundColor: Colors.white,
                                                                                child: ind == 2
                                                                                    ? CircleAvatar(
                                                                                        radius: width * 0.028,
                                                                                        backgroundColor: primaryBlue,
                                                                                        child: Text(
                                                                                          '+' + (_meetingController.meetingList[index].attendees!.length - 2).toString(),
                                                                                          style: GoogleFonts.poppins(
                                                                                            textStyle: TextStyle(
                                                                                                color: white,
                                                                                                //height: 1.3,
                                                                                                fontSize: height * 0.012,
                                                                                                fontWeight: FontWeight.w400),
                                                                                          ),
                                                                                        ),
                                                                                      )
                                                                                    : CircleAvatar(
                                                                                        radius: width * 0.028,

                                                                                        backgroundImage: Image.network(loadDataController.userNameList.value.where((e) => _meetingController.meetingList[index].attendees!.contains(e.id)).toList()[ind].image! == "" ? picPlaceHolder.value : loadDataController.userNameList.value.where((e) => _meetingController.meetingList[index].attendees!.contains(e.id)).toList()[ind].image!).image, // Provide your custom image
                                                                                      ),
                                                                              ),
                                                                            );
                                                                          })))
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            )
                                          ],
                                        );
                                      }),
                                ),
                    ),
                  ),
                  // SizedBox(
                  //   height: height * 0.1,
                  // )
                ],
              ),
            ),
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
      //         width: width * 0.42,
      //         radius: width * 0.03,
      //         icon: Icon(
      //           UniconsLine.plus,
      //           color: primaryBlue,
      //         ),
      //         text: Text(
      //           "Add meeting",
      //           maxLines: 1,
      //           overflow: TextOverflow.ellipsis,
      //           style: GoogleFonts.poppins(
      //             textStyle: TextStyle(
      //                 color: primaryBlue,
      //                 //height: 1.3,
      //                 fontSize: width * 0.035,
      //                 fontWeight: FontWeight.w500),
      //           ),
      //         ),
      //         color: primaryLight,
      //         onPress: null,
      //         scrollController: _scrollController),
      //   ),
      // )
    );
  }
}

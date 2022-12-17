import 'package:bit_planner/Controller/home_controller.dart';
import 'package:bit_planner/Controller/messages_controller.dart';
import 'package:bit_planner/Helper/values.dart';
import 'package:bit_planner/View/Calendar/event_detail.dart';
import 'package:bit_planner/View/Home/notifications.dart';
import 'package:bit_planner/View/Meetings/meeting_detail.dart';
import 'package:bit_planner/View/Messages/chat_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:unicons/unicons.dart';

import '../../Controller/navigation_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late double height;
  late double width;
  final HomeController _homeController = Get.put(HomeController());
  NavigationController _navigationController = Get.find();

  getData() async {
    await _homeController.loadMeetings();
    await _homeController.loadEvents();
    print("length: " + _homeController.eventsList.length.toString());
    // await _messagesController
    //     .getChat()
    //     .then((value) async => _messagesController.searchList.value =
    //         _messagesController.chatList.where((p0) => true).toList())
    //     .then((value) async => await _messagesController.getChatDates());
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
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: greyLight,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.all(0.0),
                  minSize: 0.0001,
                  onPressed: () {
                    _navigationController.persistentTabController.jumpToTab(4);
                  },
                  child: SizedBox(
                    height: width * 0.12,
                    width: width * 0.12,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(width * 5),
                        child: CachedNetworkImage(
                          imageUrl: loadDataController.userModel.value.image ==
                                      "" ||
                                  loadDataController.userModel.value.image ==
                                      null
                              ? picPlaceHolder
                              : loadDataController.userModel.value.image!,
                          fit: BoxFit.cover,
                          height: width * 0.05,
                          width: width * 0.05,
                        )),
                  ),
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome!',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: grey,
                              height: 1.3,
                              fontSize: height * 0.016,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        loadDataController.userModel.value.name!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: textColor,
                              height: 1.3,
                              fontSize: height * 0.024,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                CupertinoButton(
                  padding: const EdgeInsets.all(0.0),
                  minSize: 0.0001,
                  onPressed: () {
                    Get.to(() => Notifications());
                  },
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(width * 0.028),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(width * 5)),
                        child: Icon(
                          UniconsLine.bell,
                          color: textColor,
                          size: height * 0.032,
                        ),
                      ),
                      // Positioned(
                      //     right: 0,
                      //     top: 0,
                      //     child: Container(
                      //       height: height * 0.024,
                      //       width: height * 0.024,
                      //       alignment: Alignment.center,
                      //       decoration: BoxDecoration(
                      //           color: red,
                      //           borderRadius: BorderRadius.circular(width * 5)),
                      //       child: Text(
                      //         '2',
                      //         style: GoogleFonts.poppins(
                      //           textStyle: TextStyle(
                      //               color: white,
                      //               //height: 1.3,
                      //               fontSize: height * 0.014,
                      //               fontWeight: FontWeight.w500),
                      //         ),
                      //       ),
                      //     ))
                    ],
                  ),
                )
              ],
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: height * 0.01),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: width * 0.05),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         'Unread messages',
            //         style: GoogleFonts.poppins(
            //           textStyle: TextStyle(
            //               color: grey,
            //               //height: 1.3,
            //               fontSize: height * 0.022,
            //               fontWeight: FontWeight.w400),
            //         ),
            //       ),
            //       CupertinoButton(
            //         padding: const EdgeInsets.all(0.0),
            //         minSize: width * 0.05,
            //         onPressed: () {},
            //         child: Icon(
            //           CupertinoIcons.multiply,
            //           size: height * 0.025,
            //           color: grey,
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            // SizedBox(height: height * 0.015),
            // SizedBox(
            //   height: height * 0.17,
            //   child: ListView.builder(
            //       itemCount: 5,
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (BuildContext context, int index) {
            //         return Row(
            //           children: [
            //             SizedBox(
            //               width: width * 0.05,
            //             ),
            //             CupertinoButton(
            //               padding: const EdgeInsets.all(0.0),
            //               minSize: 0.0001,
            //               onPressed: () {
            //                 Get.to(() => ChatScreen());
            //               },
            //               child: Container(
            //                 width: width * 0.6,
            //                 //height: height * 0.2,
            //                 decoration: BoxDecoration(
            //                     color: white,
            //                     borderRadius:
            //                         BorderRadius.circular(width * 0.03)),
            //                 child: Column(
            //                   children: [
            //                     Container(
            //                       alignment: Alignment.center,
            //                       margin: EdgeInsets.only(
            //                           left: width * 0.04,
            //                           right: width * 0.04,
            //                           top: height * 0.02),
            //                       height: height * 0.08,
            //                       width: width,
            //                       decoration: BoxDecoration(
            //                           color: primaryLight,
            //                           borderRadius: BorderRadius.only(
            //                               bottomRight: Radius.circular(
            //                                 width * 0.03,
            //                               ),
            //                               topLeft: Radius.circular(
            //                                 width * 0.03,
            //                               ),
            //                               topRight: Radius.circular(
            //                                 width * 0.03,
            //                               ))),
            //                       child: Container(
            //                         margin: EdgeInsets.symmetric(
            //                             horizontal: width * 0.03,
            //                             vertical: height * 0.01),
            //                         child: Text(
            //                           'I have sent you a summary of today\'s completed tasks on your email.',
            //                           overflow: TextOverflow.ellipsis,
            //                           maxLines: 2,
            //                           style: GoogleFonts.poppins(
            //                             textStyle: TextStyle(
            //                                 color: primaryBlue,
            //                                 height: 1.3,
            //                                 fontSize: height * 0.017,
            //                                 fontWeight: FontWeight.w400),
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                     Container(
            //                       margin: EdgeInsets.symmetric(
            //                           horizontal: width * 0.04,
            //                           vertical: height * 0.012),
            //                       child: Row(
            //                         children: [
            //                           SizedBox(
            //                             height: width * 0.09,
            //                             width: width * 0.09,
            //                             child: ClipRRect(
            //                               borderRadius:
            //                                   BorderRadius.circular(width * 5),
            //                               child: Image.asset(
            //                                 "assets/images/profile2.jpg",
            //                                 fit: BoxFit.cover,
            //                                 height: height * 0.05,
            //                                 width: height * 0.05,
            //                               ),
            //                             ),
            //                           ),
            //                           SizedBox(
            //                             width: width * 0.02,
            //                           ),
            //                           Expanded(
            //                             child: Column(
            //                               crossAxisAlignment:
            //                                   CrossAxisAlignment.start,
            //                               children: [
            //                                 Text(
            //                                   'John Marc',
            //                                   overflow: TextOverflow.ellipsis,
            //                                   maxLines: 1,
            //                                   style: GoogleFonts.poppins(
            //                                     textStyle: TextStyle(
            //                                         color: textColor,
            //                                         height: 1.3,
            //                                         fontSize: height * 0.019,
            //                                         fontWeight:
            //                                             FontWeight.w500),
            //                                   ),
            //                                 ),
            //                                 Text(
            //                                   '2h ago',
            //                                   overflow: TextOverflow.ellipsis,
            //                                   maxLines: 1,
            //                                   style: GoogleFonts.poppins(
            //                                     textStyle: TextStyle(
            //                                         color: textColor
            //                                             .withOpacity(0.4),
            //                                         height: 1.3,
            //                                         fontSize: height * 0.015,
            //                                         fontWeight:
            //                                             FontWeight.w500),
            //                                   ),
            //                                 ),
            //                               ],
            //                             ),
            //                           )
            //                         ],
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //               ),
            //             ),
            //             SizedBox(width: index == 4 ? width * 0.04 : 0)
            //           ],
            //         );
            //       }),
            // ),
            // SizedBox(height: height * 0.03),
            Container(
              width: width,
              //height: height,
              decoration: BoxDecoration(color: white),
              child: Column(
                children: [
                  // SizedBox(
                  //   height: height * 0.02,
                  // ),
                  Obx(
                    () => Container(
                      child: _homeController.unseenMeetingsList.isEmpty
                          ? Container(
                              child: SizedBox(
                                height: height * 0.02,
                              ),
                            )
                          : Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: width * 0.05),
                                    child: Text(
                                      'Meetings today',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: textColor,
                                            height: 1.3,
                                            fontSize: height * 0.024,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  Container(
                                      height: height * 0.2,
                                      child: Obx(
                                        () =>
                                            // _homeController.loadingNewMeetings.value
                                            //     ? Column(
                                            //         mainAxisAlignment: MainAxisAlignment.start,
                                            //         crossAxisAlignment: CrossAxisAlignment.center,
                                            //         children: [
                                            //           SizedBox(
                                            //             height: height * 0.02,
                                            //           ),
                                            //           Container(
                                            //             height: height * 0.16,
                                            //             child: LottieBuilder.asset(
                                            //               "assets/animations/loading.json",
                                            //             ),
                                            //           ),
                                            //         ],
                                            //       )
                                            // :
                                            ListView.builder(
                                                itemCount: _homeController
                                                    .unseenMeetingsList.length,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: ((context, index) {
                                                  return Container(
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          width: index == 0
                                                              ? width * 0.05
                                                              : 0,
                                                        ),
                                                        CupertinoButton(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0.0),
                                                          minSize: 0.0001,
                                                          onPressed: () {
                                                            Get.to(() =>
                                                                    MeetingDetail(
                                                                      meeting: _homeController
                                                                              .unseenMeetingsList[
                                                                          index],
                                                                    ))!
                                                                .then((value) =>
                                                                    {
                                                                      _homeController
                                                                          .loadMeetings()
                                                                    });
                                                          },
                                                          child: Container(
                                                            height:
                                                                height * 0.16,
                                                            width: width * 0.7,
                                                            //height: height * 0.15,
                                                            // margin: EdgeInsets.symmetric(
                                                            //     horizontal: width * 0.05, vertical: height * 0.03),
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    yellowLight,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(width *
                                                                            0.03)),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(
                                                                      left: width *
                                                                          0.04,
                                                                      top: height *
                                                                          0.015,
                                                                      bottom: height *
                                                                          0.005,
                                                                      right: width *
                                                                          0.04),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        '${_homeController.unseenMeetingsList[index].title}',
                                                                        style: GoogleFonts
                                                                            .poppins(
                                                                          textStyle: TextStyle(
                                                                              color: brown,
                                                                              //height: 1.3,
                                                                              fontSize: height * 0.02,
                                                                              fontWeight: FontWeight.w500),
                                                                        ),
                                                                      ),
                                                                      // CupertinoButton(
                                                                      //   padding:
                                                                      //       const EdgeInsets.all(0.0),
                                                                      //   minSize:
                                                                      //       width *
                                                                      //           0.05,
                                                                      //   onPressed:
                                                                      //       () {},
                                                                      //   child:
                                                                      //       Icon(
                                                                      //     CupertinoIcons
                                                                      //         .multiply,
                                                                      //     size: height *
                                                                      //         0.025,
                                                                      //     color:
                                                                      //         grey,
                                                                      //   ),
                                                                      // )
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          width *
                                                                              0.04,
                                                                      vertical:
                                                                          height *
                                                                              0.005),
                                                                  child: Text(
                                                                    '${_homeController.unseenMeetingsList[index].detail}',
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    maxLines: 2,
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle: TextStyle(
                                                                          color:
                                                                              grey,
                                                                          height:
                                                                              1.3,
                                                                          fontSize: height *
                                                                              0.017,
                                                                          fontWeight:
                                                                              FontWeight.w400),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets.only(
                                                                      left: width *
                                                                          0.04,
                                                                      bottom: height *
                                                                          0.015,
                                                                      top: height *
                                                                          0.00,
                                                                      right: width *
                                                                          0.04),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        DateFormat("hh:mm a").format(_homeController.unseenMeetingsList[index].startTime!) +
                                                                            " - " +
                                                                            DateFormat("hh:mm a").format(_homeController.unseenMeetingsList[index].endTime!),
                                                                        style: GoogleFonts
                                                                            .poppins(
                                                                          textStyle: TextStyle(
                                                                              color: brown,
                                                                              //height: 1.3,
                                                                              fontSize: height * 0.019,
                                                                              fontWeight: FontWeight.w500),
                                                                        ),
                                                                      ),
                                                                      CupertinoButton(
                                                                          padding: const EdgeInsets.all(
                                                                              0.0),
                                                                          minSize:
                                                                              0.0001,
                                                                          onPressed:
                                                                              () {},
                                                                          child: SizedBox(
                                                                              width: width * 0.14,
                                                                              height: height * 0.04,
                                                                              child: ListView.builder(
                                                                                  scrollDirection: Axis.horizontal,
                                                                                  itemCount: _homeController.meetingsList[index].attendees!.length < 3 ? _homeController.meetingsList[index].attendees!.length : 3,
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
                                                                                                  '+' + (_homeController.meetingsList[index].attendees!.length - 2).toString(),
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

                                                                                                backgroundImage: Image.network(loadDataController.userNameList.value.where((e) => _homeController.meetingsList[index].attendees!.contains(e.id)).toList()[ind].image! == "" ? picPlaceHolder : loadDataController.userNameList.value.where((e) => _homeController.meetingsList[index].attendees!.contains(e.id)).toList()[ind].image!).image, // Provide your custom image
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
                                                          width: width * 0.03,
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                })),
                                      )),
                                ],
                              ),
                            ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Your day',
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
                  Obx(
                    () => Container(
                      child: _homeController.loadingEvents.value
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
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
                          : _homeController.eventsList.isEmpty
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: width * 0.4,
                                      width: width * 0.4,
                                      child: LottieBuilder.asset(
                                        "assets/animations/empty.json",
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.2,
                                    ),
                                  ],
                                )
                              : Obx(
                                  () => ListView.builder(
                                      itemCount:
                                          _homeController.eventsList.length,
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
                                              minSize: width * 0.04,
                                              onPressed: () {
                                                Get.to(() => EventDetail(
                                                          event: _homeController
                                                                  .eventsList[
                                                              index],
                                                        ))!
                                                    .then((value) =>
                                                        _homeController
                                                            .loadEvents());
                                              },
                                              child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: width * 0.05),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      CupertinoButton(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0.0),
                                                        minSize: 0.0001,
                                                        onPressed: null,
                                                        child: Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    width *
                                                                        0.035),
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    greyLight,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(width *
                                                                            5)),
                                                            child: _homeController
                                                                        .eventsList[
                                                                            index]
                                                                        .eventType ==
                                                                    "event"
                                                                ? SvgPicture
                                                                    .asset(
                                                                    "assets/icons/Calendar.svg",
                                                                    color:
                                                                        textColor,
                                                                    height:
                                                                        width *
                                                                            0.06,
                                                                  )
                                                                : _homeController
                                                                            .eventsList[
                                                                                index]
                                                                            .eventType ==
                                                                        "task"
                                                                    ? SvgPicture
                                                                        .asset(
                                                                        "assets/icons/Clipboard-alt.svg",
                                                                        color:
                                                                            textColor,
                                                                        height: width *
                                                                            0.06,
                                                                      )
                                                                    : SvgPicture
                                                                        .asset(
                                                                        "assets/icons/Calendar.svg",
                                                                        color:
                                                                            textColor,
                                                                        height: width *
                                                                            0.06,
                                                                      )),
                                                      ),
                                                      SizedBox(
                                                        width: width * 0.04,
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              _homeController
                                                                  .eventsList[
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
                                                                            textColor,
                                                                        //height: 1.3,
                                                                        fontSize:
                                                                            height *
                                                                                0.018,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                              ),
                                                            ),
                                                            Text(
                                                              _homeController
                                                                  .eventsList[
                                                                      index]
                                                                  .detail!,
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                textStyle:
                                                                    TextStyle(
                                                                        color:
                                                                            grey,
                                                                        //height: 1.3,
                                                                        fontSize:
                                                                            height *
                                                                                0.016,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      CupertinoButton(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0.0),
                                                        minSize: 0.0001,
                                                        onPressed: null,
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: width *
                                                                      0.02),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      width *
                                                                          0.025,
                                                                  vertical:
                                                                      height *
                                                                          0.008),
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  primaryLight,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          width *
                                                                              5)),
                                                          child: Text(
                                                            DateFormat(
                                                                    "hh:mm a")
                                                                .format(_homeController
                                                                    .eventsList[
                                                                        index]
                                                                    .startTime!),
                                                            maxLines: 1,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  TextStyle(
                                                                      color:
                                                                          primaryBlue,
                                                                      //height: 1.3,
                                                                      fontSize:
                                                                          height *
                                                                              0.015,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
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
                                ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

import '../../Helper/values.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  late double height;
  late double width;
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
        //   statusBarColor: white,
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
                  'Notifications',
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
                Container(
                  width: width * 0.13,
                )
              ],
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: white,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Column(
                        children: [
                          CupertinoButton(
                              padding: EdgeInsets.all(0.0),
                              minSize: 0.0001,
                              onPressed: () {},
                              child: Container(
                                width: width,
                                child: Row(
                                  crossAxisAlignment: index == 1 || index == 3
                                      ? CrossAxisAlignment.start
                                      : CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            text: TextSpan(
                                                text: "Your meeting",
                                                style: index == 0 || index == 1
                                                    ? GoogleFonts.poppins(
                                                        fontSize:
                                                            height * 0.018,
                                                        color: textColor,
                                                        fontWeight:
                                                            FontWeight.w500)
                                                    : GoogleFonts.poppins(
                                                        fontSize:
                                                            height * 0.018,
                                                        color: textColor,
                                                        fontWeight:
                                                            FontWeight.w300),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text:
                                                        " \"Design Final Discussion\"",
                                                    style: index == 0 ||
                                                            index == 1
                                                        ? GoogleFonts.poppins(
                                                            fontSize:
                                                                height * 0.018,
                                                            color: primaryBlue,
                                                            fontWeight:
                                                                FontWeight.w500)
                                                        : GoogleFonts.poppins(
                                                            fontSize:
                                                                height * 0.018,
                                                            color: primaryBlue,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        " is due in 30 minutes.",
                                                    style: index == 0 ||
                                                            index == 1
                                                        ? GoogleFonts.poppins(
                                                            fontSize:
                                                                height * 0.018,
                                                            color: textColor,
                                                            fontWeight:
                                                                FontWeight.w500)
                                                        : GoogleFonts.poppins(
                                                            fontSize:
                                                                height * 0.018,
                                                            color: textColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w300),
                                                  ),
                                                ]),
                                          ),
                                          SizedBox(
                                            height: index == 1 || index == 3
                                                ? height * 0.01
                                                : 0,
                                          ),
                                          Container(
                                              child: index == 1 || index == 3
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        CupertinoButton(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                          minSize: 0.0001,
                                                          onPressed: () {},
                                                          child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        width *
                                                                            0.03,
                                                                    vertical:
                                                                        height *
                                                                            0.005),
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  primaryBlue,
                                                              border: Border.all(
                                                                  color:
                                                                      primaryBlue,
                                                                  width: 1),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          width *
                                                                              0.02),
                                                            ),
                                                            child: Text(
                                                              "Dismiss",
                                                              style: GoogleFonts.poppins(
                                                                  fontSize:
                                                                      height *
                                                                          0.018,
                                                                  color: white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: width * 0.02,
                                                        ),
                                                        CupertinoButton(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                          minSize: 0.0001,
                                                          onPressed: () {},
                                                          child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        width *
                                                                            0.03,
                                                                    vertical:
                                                                        height *
                                                                            0.005),
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  color: grey
                                                                      .withOpacity(
                                                                          0.4),
                                                                  width: 1),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          width *
                                                                              0.02),
                                                            ),
                                                            child: Text(
                                                              "Snooze",
                                                              style: GoogleFonts.poppins(
                                                                  fontSize:
                                                                      height *
                                                                          0.018,
                                                                  color: grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  : Container()),
                                          SizedBox(
                                            height: height * 0.01,
                                          ),
                                          Text(
                                            "12 Feb on 12:34 PM",
                                            style: index == 0 || index == 1
                                                ? GoogleFonts.poppins(
                                                    fontSize: height * 0.016,
                                                    color: grey,
                                                    fontWeight: FontWeight.w300)
                                                : GoogleFonts.poppins(
                                                    fontSize: height * 0.016,
                                                    color: grey,
                                                    fontWeight:
                                                        FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: height * 0.005),
                                      child: CupertinoButton(
                                        padding: const EdgeInsets.all(0.0),
                                        minSize: 0.0001,
                                        onPressed: null,
                                        child: Container(
                                            padding:
                                                EdgeInsets.all(width * 0.035),
                                            decoration: BoxDecoration(
                                                color: greyLight,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        width * 5)),
                                            child:
                                                // _homeController
                                                //             .eventList[index]
                                                //             .type! ==
                                                //         "meeting"
                                                //     ? SvgPicture.asset(
                                                //         "assets/icons/Video.svg",
                                                //         color: textColor,
                                                //         height: width * 0.06,
                                                //       )
                                                //     : _homeController
                                                //                 .eventList[index]
                                                //                 .type! ==
                                                //             "event"
                                                //         ? SvgPicture.asset(
                                                //             "assets/icons/Calendar.svg",
                                                //             color: textColor,
                                                //             height: width * 0.06,
                                                //           )
                                                //         : _homeController
                                                //                     .eventList[
                                                //                         index]
                                                //                     .type! ==
                                                //                 "task"
                                                //             ? SvgPicture.asset(
                                                //                 "assets/icons/Clipboard-alt.svg",
                                                //                 color: textColor,
                                                //                 height:
                                                //                     width * 0.06,
                                                //               )
                                                // :
                                                SvgPicture.asset(
                                              "assets/icons/Alarm.svg",
                                              color: textColor,
                                              height: width * 0.06,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: height * 0.015,
                          ),
                          Container(
                            height: 0.5,
                            width: width,
                            color: grey,
                          ),
                          SizedBox(
                            height: height * 0.015,
                          ),
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        alignment: Alignment.center,
        height: height * 0.05,
        decoration: BoxDecoration(
            color: white,
            gradient: LinearGradient(colors: [
              // white,
              // white,
              // white,
              // white,
              // white,
              // white,
              white,
              white,
              white.withOpacity(0.7),
              white.withOpacity(0.4),
              white.withOpacity(0)
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     SizedBox(height: height * 0.03),
        //     CupertinoButton(
        //       padding: EdgeInsets.all(0.0),
        //       minSize: 0.0001,
        //       onPressed: () {},
        //       child: Container(
        //         alignment: Alignment.center,
        //         width: width * 0.9,
        //         height: height * 0.07,
        //         padding: EdgeInsets.symmetric(vertical: height * 0.005),
        //         decoration: BoxDecoration(
        //             color: primaryBlue,
        //             borderRadius: BorderRadius.circular(width * 5)),
        //         child: Text(
        //           "Join Meeting",
        //           maxLines: 2,
        //           overflow: TextOverflow.ellipsis,
        //           style: GoogleFonts.poppins(
        //             textStyle: TextStyle(
        //                 color: white,
        //                 //height: 1.3,
        //                 fontSize: height * 0.018,
        //                 fontWeight: FontWeight.w500),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

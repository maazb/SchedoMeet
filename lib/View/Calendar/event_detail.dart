import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';
import 'package:intl/intl.dart';

import '../../Helper/values.dart';

class EventDetail extends StatefulWidget {
  const EventDetail({Key? key}) : super(key: key);

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
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
                  'Event Detail',
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
                      Icons.more_horiz_outlined,
                      color: textColor,
                      size: height * 0.032,
                    ),
                  ),
                )
              ],
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height * 0.01),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Visit to design studio',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: textColor,
                          height: 1.3,
                          fontSize: height * 0.032,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: height * 0.015),
                  Text(
                    'Quis consetetur ea diam kasd et no amet accusam consequat diam hendrerit ad justo kasd velit justo consetetur feugait. Qui lorem diam amet amet magna diam tempor dolore. Est in dolor nonumy ipsum rebum dolor nulla consequat nonumy diam in eos feugiat. Sit invidunt nonummy. Accusam invidunt ad et lorem vero amet. Justo nonumy erat praesent et eu dolore illum est est at in vel iusto gubergren diam et ipsum consetetur. Sea kasd est aliquyam. Clita augue accusam ullamcorper sadipscing ipsum dolore lorem sea. Nonumy et velit nonumy et elitr sit autem diam hendrerit eirmod clita dolores no invidunt stet enim facilisis justo. Sea dolores amet invidunt at ea gubergren at clita ipsum consetetur diam et assum et tempor feugiat.',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: grey,
                          height: 1.3,
                          fontSize: height * 0.018,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.025),
            Container(
              child: Column(
                children: [
                  // Container(
                  //   margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                  //   padding: EdgeInsets.symmetric(vertical: height * 0.01),
                  //   width: width,
                  //   height: height * 0.055,
                  //   decoration: BoxDecoration(
                  //     color: grey.withOpacity(0.05),
                  //     borderRadius: BorderRadius.only(
                  //         topLeft: Radius.circular(width * 0.03),
                  //         topRight: Radius.circular(width * 0.03)),
                  //   ),
                  //   child: Container(
                  //     margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Text(
                  //           'meeting type',
                  //           style: GoogleFonts.poppins(
                  //             textStyle: TextStyle(
                  //                 color: grey,
                  //                 //height: 1.3,
                  //                 fontSize: height * 0.016,
                  //                 fontWeight: FontWeight.w400),
                  //           ),
                  //         ),
                  //         SizedBox(width: width * 0.05),
                  //         Flexible(
                  //           child: Text(
                  //             'Conference',
                  //             maxLines: 1,
                  //             overflow: TextOverflow.ellipsis,
                  //             style: GoogleFonts.poppins(
                  //               textStyle: TextStyle(
                  //                   color: textColor,
                  //                   //height: 1.3,
                  //                   fontSize: height * 0.018,
                  //                   fontWeight: FontWeight.w500),
                  //             ),
                  //           ),
                  //         ),
                  //         // Container(
                  //         //   padding: EdgeInsets.symmetric(
                  //         //       horizontal: width * 0.02,
                  //         //       vertical: height * 0.005),
                  //         //   decoration: BoxDecoration(
                  //         //       color: yellowLight,
                  //         //       borderRadius:
                  //         //           BorderRadius.circular(width * 0.01)),
                  //         //   child: Text(
                  //         //     'Conference',
                  //         //     style: GoogleFonts.poppins(
                  //         //       textStyle: TextStyle(
                  //         //           color: brown,
                  //         //           //height: 1.3,
                  //         //           fontSize: height * 0.014,
                  //         //           fontWeight: FontWeight.w400),
                  //         //     ),
                  //         //   ),
                  //         // ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 3),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                    padding: EdgeInsets.symmetric(vertical: height * 0.01),
                    width: width,
                    height: height * 0.055,
                    decoration: BoxDecoration(
                      color: grey.withOpacity(0.05),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(width * 0.03),
                          topRight: Radius.circular(width * 0.03)),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'created by',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: grey,
                                  //height: 1.3,
                                  fontSize: height * 0.016,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(width: width * 0.05),
                          // SizedBox(
                          //   width: width * 0.2,
                          // ),

                          // SizedBox(
                          //   height: height * 0.03,
                          //   width: height * 0.03,
                          //   child: ClipRRect(
                          //     borderRadius: BorderRadius.circular(width * 5),
                          //     child: Image.asset(
                          //       "assets/images/profile2.jpg",
                          //       fit: BoxFit.cover,
                          //       height: height * 0.05,
                          //       width: height * 0.05,
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(width: width * 0.015),

                          Flexible(
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: height * 0.03,
                                    width: height * 0.03,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(width * 5),
                                      child: Image.asset(
                                        "assets/images/profile2.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: width * 0.015),
                                  Flexible(
                                    child: Text(
                                      'John Marc',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: textColor,
                                            //height: 1.3,
                                            fontSize: height * 0.018,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Container(
                          //   padding: EdgeInsets.symmetric(
                          //       horizontal: width * 0.02,
                          //       vertical: height * 0.005),
                          //   decoration: BoxDecoration(
                          //       color: yellowLight,
                          //       borderRadius:
                          //           BorderRadius.circular(width * 0.01)),
                          //   child: Text(
                          //     'Conference',
                          //     style: GoogleFonts.poppins(
                          //       textStyle: TextStyle(
                          //           color: brown,
                          //           //height: 1.3,
                          //           fontSize: height * 0.014,
                          //           fontWeight: FontWeight.w400),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 3),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                    padding: EdgeInsets.symmetric(vertical: height * 0.01),
                    width: width,
                    height: height * 0.055,
                    decoration: BoxDecoration(
                      color: grey.withOpacity(0.05),
                      // borderRadius: BorderRadius.only(
                      //     topLeft: Radius.circular(width * 0.03),
                      //     topRight: Radius.circular(width * 0.03)),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'attendees',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: grey,
                                  //height: 1.3,
                                  fontSize: height * 0.016,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(width: width * 0.05),
                          Flexible(
                            child: Text(
                              '13',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: textColor,
                                    //height: 1.3,
                                    fontSize: height * 0.018,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 3),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                    padding: EdgeInsets.symmetric(vertical: height * 0.01),
                    width: width,
                    height: height * 0.055,
                    decoration: BoxDecoration(
                      color: grey.withOpacity(0.05),
                      // borderRadius: BorderRadius.only(
                      //     topLeft: Radius.circular(width * 0.03),
                      //     topRight: Radius.circular(width * 0.03)),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'date (s)',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: grey,
                                  //height: 1.3,
                                  fontSize: height * 0.016,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(width: width * 0.05),
                          Flexible(
                            child: Text(
                              DateFormat('dd MMM yyyy')
                                  .format(DateTime.now())
                                  .toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: textColor,
                                    //height: 1.3,
                                    fontSize: height * 0.018,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                    padding: EdgeInsets.symmetric(vertical: height * 0.01),
                    width: width,
                    height: height * 0.055,
                    decoration: BoxDecoration(
                      color: grey.withOpacity(0.05),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(width * 0.03),
                          bottomRight: Radius.circular(width * 0.03)),
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'time',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: grey,
                                  //height: 1.3,
                                  fontSize: height * 0.016,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Flexible(
                            child: Text(
                              '12:00 PM',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: textColor,
                                    //height: 1.3,
                                    fontSize: height * 0.018,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
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
                  //   margin: EdgeInset
                  //s.symmetric(horizontal: width * 0.05),
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
                          'All attendees',
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
                      itemCount: 13,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: width * 0.13,
                                        width: width * 0.13,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(width * 5),
                                          child: Image.asset(
                                            "assets/images/profile4.jpg",
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
                                              "Zara Munro",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    color: textColor,
                                                    //height: 1.3,
                                                    fontSize: height * 0.02,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Text(
                                              "Marketing manager",
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
                  SizedBox(height: height * 0.05)
                ],
              ),
            )
          ],
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

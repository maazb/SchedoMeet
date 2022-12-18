import 'dart:async';

import 'package:bit_planner/Controller/meeting_controller.dart';
import 'package:bit_planner/Controller/messages_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:unicons/unicons.dart';

import '../../Helper/values.dart';

class SelectMembers extends StatefulWidget {
  const SelectMembers({Key? key}) : super(key: key);

  @override
  State<SelectMembers> createState() => _SelectMembersState();
}

class _SelectMembersState extends State<SelectMembers> {
  late double height;
  late double width;
  MeetingController _meetingController = Get.find();
  ScrollController sc = ScrollController();
  ScrollController sc1 = ScrollController();
  RxBool showSearch = false.obs;
  FocusNode searchFocus = FocusNode();
  late List<int> currentPos;
  // scrollDown() async {
  //   setState(() async {
  //     Future.delayed(Duration(milliseconds: 250), () {
  //       sc.jumpTo(sc.position.maxScrollExtent);
  //     }).then((value) => Future.delayed(Duration(milliseconds: 250), () {
  //           sc.jumpTo(sc.position.maxScrollExtent);
  //         }));
  //   });
  // }

  getData() async {}

  @override
  void initState() {
    // TODO: implement initState
    getData();
    // currentPos = List.filled(_messagesController.searchList.length, 0);
    //scrollDown();
    super.initState();
    // print("Length: " + _messagesController.searchList.length.toString());
    RxBool searchOpen = false.obs;
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
                  'Select Members',
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: greyLight,
                child: Column(
                  children: [
                    SizedBox(height: height * 0.01),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(width * 0.03)),
                      child: CupertinoSearchTextField(
                        backgroundColor: white,
                        borderRadius: BorderRadius.circular(width * 0.03),
                        padding: EdgeInsets.only(
                            top: height * 0.015,
                            bottom: height * 0.015,
                            right: width * 0.03,
                            left: width * 0.02),
                        suffixInsets: EdgeInsets.only(right: width * 0.03),
                        prefixIcon: Icon(
                          UniconsLine.search,
                          color: grey,
                        ),
                        prefixInsets: EdgeInsets.only(
                            top: height * 0.01,
                            bottom: height * 0.01,
                            left: width * 0.04),
                        placeholderStyle: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: grey,

                              //height: 1.3,
                              fontSize: height * 0.02,
                              fontWeight: FontWeight.w400),
                        ),
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: grey,

                              //height: 1.3,
                              fontSize: height * 0.02,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Container(
                      //alignment: Alignment.bottomCenter,
                      // child: _messagesController.searchList.length > 0
                      //     ?
                      child: Container(
                        child: Expanded(
                          child: Container(
                            color: white,
                            child: Obx(
                              () => ListView.builder(
                                  itemCount:
                                      _meetingController.addedUsers.length,
                                  // shrinkWrap: true,
                                  // physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            height:
                                                index == 0 ? height * 0.02 : 0),
                                        CupertinoButton(
                                          padding: const EdgeInsets.all(0.0),
                                          minSize: 0.0001,
                                          onPressed: () {
                                            if (_meetingController
                                                .selectedAttendees
                                                .contains(_meetingController
                                                    .addedUsers[index])) {
                                              _meetingController
                                                  .selectedAttendees
                                                  .remove(_meetingController
                                                      .addedUsers[index]);
                                            } else {
                                              _meetingController
                                                  .selectedAttendees
                                                  .add(_meetingController
                                                      .addedUsers[index]);
                                            }
                                            // if (_messagesController
                                            //     .selectedContacts
                                            //     .contains(index)) {
                                            //   _messagesController.selectedContacts
                                            //       .remove(index);
                                            // } else {
                                            //   _messagesController.selectedContacts
                                            //       .add(index);
                                            // }
                                          },
                                          child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: width * 0.05),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    height: width * 0.13,
                                                    width: width * 0.13,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              width * 5),
                                                      child: CachedNetworkImage(
                                                        imageUrl: _meetingController
                                                                        .addedUsers[
                                                                            index]
                                                                        .image ==
                                                                    "" ||
                                                                _meetingController
                                                                        .addedUsers[
                                                                            index]
                                                                        .image ==
                                                                    null
                                                            ? picPlaceHolder
                                                                .value
                                                            : _meetingController
                                                                .addedUsers[
                                                                    index]
                                                                .image!,
                                                        fit: BoxFit.cover,
                                                        height: height * 0.05,
                                                        width: height * 0.05,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.03,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    _meetingController
                                                                        .addedUsers[
                                                                            index]
                                                                        .name!,
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle: TextStyle(
                                                                          color: textColor,
                                                                          //height: 1.3,
                                                                          fontSize: height * 0.018,
                                                                          fontWeight: FontWeight.w500),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    _meetingController
                                                                        .addedUsers[
                                                                            index]
                                                                        .email!,
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: GoogleFonts
                                                                        .poppins(
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
                                                            Obx(
                                                              () => Container(
                                                                  child: _meetingController
                                                                          .selectedAttendees
                                                                          .contains(_meetingController.addedUsers[
                                                                              index])
                                                                      ? Container(
                                                                          margin: EdgeInsets.only(
                                                                              left: width *
                                                                                  0.02),
                                                                          alignment: Alignment
                                                                              .center,
                                                                          decoration: BoxDecoration(
                                                                              border: Border.all(color: primaryBlue, width: 1),
                                                                              color: primaryBlue,
                                                                              borderRadius: BorderRadius.circular(width * 5)),
                                                                          child: Icon(
                                                                            UniconsLine.check,
                                                                            color:
                                                                                white,
                                                                            size:
                                                                                width * 0.05,
                                                                          ))
                                                                      : Container(
                                                                          margin: EdgeInsets.only(left: width * 0.02),
                                                                          alignment: Alignment.center,
                                                                          decoration: BoxDecoration(border: Border.all(color: grey.withOpacity(0.4), width: 1), borderRadius: BorderRadius.circular(width * 5)),
                                                                          child: Icon(
                                                                            UniconsLine.check,
                                                                            color:
                                                                                grey.withOpacity(0.4),
                                                                            size:
                                                                                width * 0.05,
                                                                          ))),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
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
                        ),
                      ),
                      // : Container(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _navigationController {}

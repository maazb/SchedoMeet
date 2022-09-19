import 'package:bit_planner/Controller/messages_controller.dart';
import 'package:bit_planner/Helper/values.dart';
import 'package:bit_planner/View/Messages/chat_screen.dart';
import 'package:bit_planner/View/Messages/new_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

import '../../Controller/navigation_controller.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  late double height;
  late double width;

  ScrollController _scrollController = ScrollController();

  MessagesController _messagesController = Get.put(MessagesController());
  NavigationController _navigationController = Get.find();

  getData() async {
    await _messagesController.getChat().then((value) async =>
        _messagesController.searchList.value =
            _messagesController.chatList.where((p0) => true).toList());
  }

  @override
  void initState() {
    super.initState();
    getData();
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
                  'Messages',
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
                    Get.to(() => NewMessage());
                  },
                  child: Container(
                    padding: EdgeInsets.all(width * 0.028),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: grey.withOpacity(0.4), width: 1),
                        borderRadius: BorderRadius.circular(width * 5)),
                    child: Icon(
                      UniconsLine.comment_add,
                      color: textColor,
                      size: height * 0.032,
                    ),
                  ),
                )
              ],
            )),
      ),
      body: GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: SingleChildScrollView(
          controller: _scrollController,
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
                color: white,
                width: width,
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    ListView.builder(
                        itemCount: 10,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CupertinoButton(
                                padding: const EdgeInsets.all(0.0),
                                minSize: 0.0001,
                                onPressed: () {
                                  Get.to(() => ChatScreen());
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
                                            borderRadius: BorderRadius.circular(
                                                width * 5),
                                            child: Image.asset(
                                              "assets/images/profile2.jpg",
                                              fit: BoxFit.cover,
                                              // height: height * 0.05,
                                              // width: height * 0.05,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.03,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "John Marc",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                            color: textColor,
                                                            //height: 1.3,
                                                            fontSize:
                                                                height * 0.018,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    "4:52 PM",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.poppins(
                                                      textStyle: TextStyle(
                                                          color: grey,
                                                          //height: 1.3,
                                                          fontSize:
                                                              height * 0.015,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "I have sents you a summary of today's completed tasks on your email address, you may review them and respond as soon as possible.",
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style:
                                                          GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                            color: index == 0 ||
                                                                    index == 1
                                                                ? textColor
                                                                : grey,
                                                            //height: 1.3,
                                                            fontSize:
                                                                height * 0.016,
                                                            fontWeight: index ==
                                                                        0 ||
                                                                    index == 1
                                                                ? FontWeight
                                                                    .w500
                                                                : FontWeight
                                                                    .w400),
                                                      ),
                                                    ),
                                                  ),
                                                  CupertinoButton(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            0.0),
                                                    minSize: 0.0001,
                                                    onPressed: null,
                                                    child: Container(
                                                        child: index == 0 ||
                                                                index == 1
                                                            ? Container(
                                                                margin: EdgeInsets.only(
                                                                    left: width *
                                                                        0.02),
                                                                height: height *
                                                                    0.03,
                                                                width: height *
                                                                    0.03,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                decoration: BoxDecoration(
                                                                    color:
                                                                        primaryBlue,
                                                                    borderRadius:
                                                                        BorderRadius.circular(width *
                                                                            5)),
                                                                child: Text(
                                                                  "2",
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    textStyle: TextStyle(
                                                                        color: white,
                                                                        //height: 1.3,
                                                                        fontSize: height * 0.015,
                                                                        fontWeight: FontWeight.w500),
                                                                  ),
                                                                ),
                                                              )
                                                            : Container()),
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
                    // SizedBox(
                    //   height: height * 0.1,
                    // )
                  ],
                ),
              )
            ],
          ),
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
      //           color: primaryBlue,
      //         ),
      //         text: Text(
      //           "Start chat",
      //           maxLines: 1,
      //           overflow: TextOverflow.ellipsis,
      //           style: GoogleFonts.poppins(
      //             textStyle: TextStyle(
      //                 color: primaryBlue,
      //                 //height: 1.3,
      //                 fontSize: height * 0.018,
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

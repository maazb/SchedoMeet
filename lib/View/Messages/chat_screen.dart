import 'dart:async';

import 'package:bit_planner/Controller/messages_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:unicons/unicons.dart';

import '../../Helper/values.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late double height;
  late double width;
  MessagesController _messagesController = Get.find();
  ScrollController sc = ScrollController();
  ScrollController sc1 = ScrollController();
  RxBool showSearch = false.obs;
  FocusNode searchFocus = FocusNode();
  late List<int> currentPos;
  scrollDown() async {
    setState(() async {
      Future.delayed(Duration(milliseconds: 250), () {
        sc.jumpTo(sc.position.maxScrollExtent);
      }).then((value) => Future.delayed(Duration(milliseconds: 250), () {
            sc.jumpTo(sc.position.maxScrollExtent);
          }));
    });
  }

  getData() async {
    () => _messagesController.searchList.value =
        _messagesController.chatList.where((p0) => true).toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    // await getData();
    currentPos = List.filled(_messagesController.searchList.length, 0);
    scrollDown();
    super.initState();
    print("Length: " + _messagesController.searchList.length.toString());
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
        // systemOverlayStyle: SystemUiOverlayStyle(
        //   statusBarBrightness: Brightness.light,
        //   statusBarColor: white,
        //   statusBarIconBrightness: Brightness.dark,
        // ),
        title: Obx(
          () => Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: showSearch.value == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                        SizedBox(
                          width: width * 0.03,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: grey.withOpacity(0.4), width: 1),
                                borderRadius:
                                    BorderRadius.circular(width * 0.03)),
                            child: CupertinoSearchTextField(
                              autofocus: true,

                              focusNode: searchFocus,
                              controller: _messagesController.txtSearch,
                              onChanged: (String q) async {
                                await _messagesController.onSearch(q);
                              },
                              backgroundColor: greyLight,

                              borderRadius: BorderRadius.circular(width * 0.03),
                              padding: EdgeInsets.only(
                                  top: height * 0.015,
                                  bottom: height * 0.015,
                                  right: width * 0.03,
                                  left: width * 0.02),
                              suffixMode: OverlayVisibilityMode.always,
                              suffixIcon: Icon(
                                Icons.cancel_rounded,
                                color: textColor.withOpacity(0.5),
                              ),
                              onSuffixTap: () async {
                                _messagesController.searchList.value =
                                    _messagesController.chatList
                                        .where((p0) => true)
                                        .toList();
                                _messagesController.txtSearch.text = "";

                                showSearch.value = false;
                              },

                              suffixInsets: EdgeInsets.symmetric(
                                  horizontal: width * 0.04),
                              prefixInsets: EdgeInsets.symmetric(
                                  horizontal: width * 0.04),
                              prefixIcon: Icon(
                                UniconsLine.search,
                                color: grey,
                              ),
                              // prefixInsets: EdgeInsets.only(
                              //     top: height * 0.01,
                              //     bottom: height * 0.01,
                              //     left: width * 0.04),
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
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                        SizedBox(
                          width: width * 0.03,
                        ),
                        // CupertinoButton(
                        //   padding: EdgeInsets.all(0.0),
                        //   minSize: 0.0001,
                        //   onPressed: null,
                        //   child: SizedBox(
                        //     height: width * 0.08,
                        //     width: width * 0.08,
                        //     child: ClipRRect(
                        //       borderRadius: BorderRadius.circular(width * 5),
                        //       child: Image.asset(
                        //         "assets/images/profilewoman.jpg",
                        //         fit: BoxFit.cover,
                        //         height: height * 0.05,
                        //         width: height * 0.05,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   width: width * 0.03,
                        // ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Text(
                              //   'Welcome!',
                              //   maxLines: 1,
                              //   overflow: TextOverflow.ellipsis,
                              //   style: GoogleFonts.poppins(
                              //     textStyle: TextStyle(
                              //         color: grey,
                              //         height: 1.3,
                              //         fontSize: height * 0.016,
                              //         fontWeight: FontWeight.w500),
                              //   ),
                              // ),
                              Text(
                                'John Marc',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: textColor,
                                      height: 1.3,
                                      fontSize: height * 0.022,
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
                            showSearch.value = true;
                          },
                          child: Container(
                            padding: EdgeInsets.all(width * 0.032),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: grey.withOpacity(0.4), width: 1),
                                borderRadius: BorderRadius.circular(width * 5)),
                            child: Icon(
                              UniconsLine.search,
                              color: textColor,
                              size: height * 0.028,
                            ),
                          ),
                        )
                      ],
                    )),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: white,
                child: Column(
                  children: [
                    Container(
                      //alignment: Alignment.bottomCenter,
                      child: _messagesController.searchList.length > 0
                          ? Container(
                              child: Expanded(
                                child: Obx(
                                  () => ListView.builder(
                                      controller: sc,
                                      reverse: false,
                                      itemCount:
                                          _messagesController.searchList.length,
                                      itemBuilder: (context, index) {
                                        bool sending = false;
                                        return Align(
                                          child: Column(
                                            children: [
                                              Container(
                                                child: index == 0
                                                    ? Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            height:
                                                                height * 0.05,
                                                          ),
                                                          Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10,
                                                                    vertical:
                                                                        3),
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    primaryLight,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(width *
                                                                            2)),
                                                            child: Text(
                                                              DateFormat(
                                                                      'dd MMM yyyy')
                                                                  .format(DateTime.parse(_messagesController
                                                                      .searchList[
                                                                          index]
                                                                      .date
                                                                      .toString()))
                                                                  .toString(),
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                color:
                                                                    textColor,
                                                                fontSize:
                                                                    height *
                                                                        0.016,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                letterSpacing:
                                                                    0.2,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    : _messagesController
                                                                .searchList[
                                                                    index - 1]
                                                                .date!
                                                                .day !=
                                                            _messagesController
                                                                .searchList[
                                                                    index]
                                                                .date!
                                                                .day
                                                        ? Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                height: height *
                                                                    0.05,
                                                              ),
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            10,
                                                                        vertical:
                                                                            3),
                                                                decoration: BoxDecoration(
                                                                    color:
                                                                        primaryLight,
                                                                    borderRadius:
                                                                        BorderRadius.circular(width *
                                                                            2)),
                                                                child: Text(
                                                                  DateFormat(
                                                                          'dd MMM yyyy')
                                                                      .format(DateTime.parse(_messagesController
                                                                          .searchList[
                                                                              index]
                                                                          .date
                                                                          .toString()))
                                                                      .toString(),
                                                                  style: GoogleFonts
                                                                      .poppins(
                                                                    color:
                                                                        textColor,
                                                                    fontSize:
                                                                        height *
                                                                            0.016,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    letterSpacing:
                                                                        0.2,
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          )
                                                        : Container(),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: width * 0.05,
                                                    bottom: index ==
                                                            _messagesController
                                                                    .searchList
                                                                    .length -
                                                                1
                                                        ? height * 0.014
                                                        : _messagesController
                                                                    .searchList
                                                                    .elementAt(
                                                                        index +
                                                                            1)
                                                                    .date!
                                                                    .day !=
                                                                _messagesController
                                                                    .searchList
                                                                    .elementAt(
                                                                        index)
                                                                    .date!
                                                                    .day
                                                            ? height * 0.014
                                                            : height * 0.005,
                                                    right: width * 0.05,
                                                    top: index == 0
                                                        ? height * 0.014
                                                        : _messagesController
                                                                    .searchList
                                                                    .elementAt(
                                                                        index -
                                                                            1)
                                                                    .date!
                                                                    .day !=
                                                                _messagesController
                                                                    .searchList
                                                                    .elementAt(
                                                                        index)
                                                                    .date!
                                                                    .day
                                                            ? height * 0.014
                                                            : _messagesController
                                                                        .searchList
                                                                        .elementAt(index -
                                                                            1)
                                                                        .sender ==
                                                                    _messagesController
                                                                        .searchList
                                                                        .elementAt(
                                                                            index)
                                                                        .sender
                                                                ? height * 0.00
                                                                : height * 0.014),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      _messagesController
                                                                  .searchList
                                                                  .elementAt(
                                                                      index)
                                                                  .sender ==
                                                              true
                                                          ? MainAxisAlignment
                                                              .end
                                                          : MainAxisAlignment
                                                              .start,
                                                  children: [
                                                    Container(
                                                      width: width * 0.7,
                                                      decoration: BoxDecoration(
                                                        color: _messagesController
                                                                    .searchList
                                                                    .elementAt(
                                                                        index)
                                                                    .sender ==
                                                                true
                                                            ? primaryBlue
                                                            : greyLight,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft: _messagesController
                                                                          .searchList
                                                                          .elementAt(
                                                                              index)
                                                                          .sender ==
                                                                      false &&
                                                                  index == 0
                                                              ? Radius.circular(
                                                                  0)
                                                              : _messagesController.searchList.elementAt(index).sender ==
                                                                          false &&
                                                                      _messagesController.searchList.elementAt(index - 1).date!.day ==
                                                                          _messagesController.searchList
                                                                              .elementAt(
                                                                                  index)
                                                                              .date!
                                                                              .day &&
                                                                      _messagesController.searchList.elementAt(index - 1).sender ==
                                                                          _messagesController
                                                                              .searchList
                                                                              .elementAt(
                                                                                  index)
                                                                              .sender
                                                                  ? Radius.circular(
                                                                      20)
                                                                  : _messagesController
                                                                              .searchList
                                                                              .elementAt(index)
                                                                              .sender ==
                                                                          false
                                                                      ? Radius.circular(0)
                                                                      : Radius.circular(20),
                                                          topRight:
                                                              Radius.circular(
                                                                  20),
                                                          bottomRight: _messagesController
                                                                          .searchList
                                                                          .elementAt(
                                                                              index)
                                                                          .sender ==
                                                                      true &&
                                                                  index ==
                                                                      _messagesController
                                                                              .searchList
                                                                              .length -
                                                                          1
                                                              ? Radius.circular(
                                                                  0)
                                                              : _messagesController.searchList.elementAt(index).sender ==
                                                                          true &&
                                                                      _messagesController.searchList.elementAt(index + 1).date!.day ==
                                                                          _messagesController
                                                                              .searchList
                                                                              .elementAt(
                                                                                  index)
                                                                              .date!
                                                                              .day &&
                                                                      _messagesController.searchList.elementAt(index + 1).sender ==
                                                                          _messagesController
                                                                              .searchList
                                                                              .elementAt(index)
                                                                              .sender
                                                                  ? Radius.circular(20)
                                                                  : _messagesController.searchList.elementAt(index).sender == true
                                                                      ? Radius.circular(0)
                                                                      : Radius.circular(20),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  20),
                                                        ),
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Container(
                                                            child: Container(
                                                              padding: EdgeInsets
                                                                  .fromLTRB(
                                                                      width *
                                                                          0.04,
                                                                      10,
                                                                      width *
                                                                          0.04,
                                                                      10),
                                                              width:
                                                                  width * 0.8,
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  // Text(
                                                                  //   _messagesController.searchList.elementAt(index).senderName!,
                                                                  //   textAlign:
                                                                  //       TextAlign.start,
                                                                  //   maxLines:
                                                                  //       1,
                                                                  //   style:
                                                                  //       GoogleFonts.poppins(
                                                                  //     color: primaryBlue,
                                                                  //     fontSize: height * 0.016,
                                                                  //     fontWeight: FontWeight.w600,
                                                                  //     letterSpacing: 0.2,
                                                                  //   ),
                                                                  // ),
                                                                  SizedBox(
                                                                      height: height *
                                                                          0.005),
                                                                  Text(
                                                                    _messagesController
                                                                        .searchList
                                                                        .elementAt(
                                                                            index)
                                                                        .message!,
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      color: _messagesController.searchList.elementAt(index).sender ==
                                                                              true
                                                                          ? white
                                                                          : textColor,
                                                                      fontSize:
                                                                          height *
                                                                              0.016,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      letterSpacing:
                                                                          0.2,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Obx(
                                                            () => Container(
                                                              child: _messagesController
                                                                          .searchList[
                                                                              index]
                                                                          .haveImage ==
                                                                      true
                                                                  ? _messagesController
                                                                              .searchList[index]
                                                                              .images!
                                                                              .length >
                                                                          0
                                                                      ? Container(
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              Obx(
                                                                                () => CarouselSlider.builder(
                                                                                  itemCount: _messagesController.searchList[index].images!.length,
                                                                                  itemBuilder: (context, ind, i) {
                                                                                    return Stack(
                                                                                      children: [
                                                                                        Container(
                                                                                          width: width,
                                                                                          margin: EdgeInsets.symmetric(vertical: height * 0.01, horizontal: width * 0.005),
                                                                                          decoration: (BoxDecoration(
                                                                                            color: white.withOpacity(0),
                                                                                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(width * 0.03), bottomRight: Radius.circular(width * 0.03)),
                                                                                          )),
                                                                                          child: ClipRRect(
                                                                                            child: CachedNetworkImage(
                                                                                              imageUrl: _messagesController.searchList[index].images![ind],
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(width * 0.03),
                                                                                          ),
                                                                                        ),
                                                                                        // Positioned(
                                                                                        //     right: width * 0.03,
                                                                                        //     top: width * 0.04,
                                                                                        //     child: CupertinoButton(
                                                                                        //       onPressed: () {
                                                                                        //         imageUrl:
                                                                                        //         _messagesController.searchList[index].images!.remove(_messagesController.searchList[index].images![ind]);
                                                                                        //       },
                                                                                        //       padding: EdgeInsets.all(0),
                                                                                        //       minSize: width * 0.001,
                                                                                        //       child: Container(
                                                                                        //         decoration: BoxDecoration(color: primaryBlue, borderRadius: BorderRadius.circular(width * 2)),
                                                                                        //         child: SvgPicture.asset(
                                                                                        //           "assets/icons/cancel.svg",
                                                                                        //           color: white.withOpacity(1),
                                                                                        //           height: width * 0.06,
                                                                                        //           width: width * 0.06,
                                                                                        //         ),
                                                                                        //       ),
                                                                                        //     ))
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                  options: CarouselOptions(
                                                                                    initialPage: 0,
                                                                                    aspectRatio: 1.6,
                                                                                    viewportFraction: 0.92,
                                                                                    enableInfiniteScroll: false,
                                                                                    reverse: false,
                                                                                    autoPlay: false,
                                                                                    onPageChanged: (i, reason) {
                                                                                      setState(() {
                                                                                        currentPos[index] = i;
                                                                                      });
                                                                                      print(currentPos[index]);
                                                                                    },
                                                                                    enlargeCenterPage: false,
                                                                                    scrollDirection: Axis.horizontal,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Positioned(
                                                                                bottom: height * 0.03,
                                                                                left: 10,
                                                                                right: 10,
                                                                                child: Obx(
                                                                                  () => Center(
                                                                                    child: _messagesController.searchList[index].images!.length == 1
                                                                                        ? Container()
                                                                                        : AnimatedSmoothIndicator(
                                                                                            count: _messagesController.searchList[index].images!.length,
                                                                                            effect: ScrollingDotsEffect(
                                                                                              dotColor: grey,
                                                                                              activeDotColor: grey,
                                                                                              radius: 3,
                                                                                              spacing: 10,
                                                                                              dotHeight: 8,
                                                                                              dotWidth: 8,
                                                                                            ),
                                                                                            activeIndex: currentPos[index],
                                                                                          ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        )
                                                                      : Container()
                                                                  : Container(),
                                                            ),
                                                          ),
                                                          Container(
                                                            padding: EdgeInsets
                                                                .fromLTRB(0, 0,
                                                                    10, 5),
                                                            alignment: Alignment
                                                                .bottomRight,
                                                            child: Text(
                                                              _messagesController
                                                                              .searchList
                                                                              .elementAt(
                                                                                  index)
                                                                              .message ==
                                                                          'Sending' ||
                                                                      _messagesController
                                                                              .searchList
                                                                              .elementAt(
                                                                                  index)
                                                                              .message ==
                                                                          'Uploading'
                                                                  ? 'Sending...'
                                                                  : DateFormat(
                                                                          'dd MMM hh:mm a')
                                                                      .format(DateTime.parse(_messagesController
                                                                          .searchList
                                                                          .elementAt(
                                                                              index)
                                                                          .date
                                                                          .toString()))
                                                                      .toString(),
                                                              style: GoogleFonts.poppins(
                                                                  color: _messagesController
                                                                              .searchList
                                                                              .elementAt(
                                                                                  index)
                                                                              .sender ==
                                                                          true
                                                                      ? white
                                                                          .withOpacity(
                                                                              0.7)
                                                                      : grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize:
                                                                      height *
                                                                          0.014),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    // Container(
                                                    //   padding: EdgeInsets.all(5),
                                                    //   width: 30,
                                                    //   height: 30,
                                                    //   decoration: BoxDecoration(
                                                    //       color: white,
                                                    //       shape: BoxShape.circle,
                                                    //       boxShadow: [
                                                    //         BoxShadow(
                                                    //           color: grey.withOpacity(0.4),
                                                    //           blurRadius: 8,
                                                    //           offset: Offset(3, 10),
                                                    //         )
                                                    //       ]),
                                                    //   child: Icon(
                                                    //     Okaaik.account,
                                                    //     size: 15,
                                                    //     color: primaryBlue,
                                                    //   ),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                ),
                              ),
                            )
                          : Container(),
                    ),
                    // Container(
                    //   margin: EdgeInsets.fromLTRB(20, 20, 20, 40),
                    //   decoration: BoxDecoration(
                    //       color: white,
                    //       borderRadius: BorderRadius.circular(10),
                    //       boxShadow: [
                    //         BoxShadow(
                    //             color: grey.withOpacity(0.4), blurRadius: 8, offset: Offset(3, 10))
                    //       ]),
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       Container(
                    //         margin: EdgeInsets.only(left: 10),
                    //         width: width - 130,
                    //         child: TextField(
                    //           // controller: txtMessage,

                    //           keyboardType: TextInputType.text,
                    //           minLines: 1, //Normal textInputField will be displayed
                    //           maxLines: 3,
                    //           onTap: () {
                    //             //HapticFeedback.vibrate();
                    //           },
                    //           style: GoogleFonts.poppins(
                    //               color: textColor,
                    //               fontSize: 14,
                    //               //fontFamily: font,
                    //               fontWeight: FontWeight.w400),
                    //           decoration: InputDecoration(
                    //               hintText: 'Write a message',
                    //               border: InputBorder.none,
                    //               hintStyle: TextStyle(
                    //                 color: textColor,
                    //                 fontSize: 13,
                    //               )),
                    //           onChanged: (string) {},
                    //         ),
                    //       ),
                    //       Spacer(),
                    //       GestureDetector(
                    //         // onTap: () {
                    //         //   loadAssets().then((value) async {
                    //         //     if (images.isEmpty) {
                    //         //     } else {
                    //         //       var body = {
                    //         //         "chatId": 0,
                    //         //         "orderId": widget.orderID,
                    //         //         "userId": currentUser.userID,
                    //         //         "sentBy": true,
                    //         //         "vendorId": widget.vendorID,
                    //         //         "message": images[0],
                    //         //         "type": false,
                    //         //         "date": DateTime.now().toString(),
                    //         //         "status": 'Uploading'
                    //         //       };

                    //         //       setState(() {
                    //         //         _messagesController.searchList.add(body);
                    //         //         txtMessage.text = '';
                    //         //         Timer(Duration(milliseconds: 400),
                    //         //             () => sc.jumpTo(sc.position.maxScrollExtent));
                    //         //       });
                    //         //       await uploadImages().then((value) async {
                    //         //         body['message'] = uploadedImages[0]['path'];
                    //         //         //Comment later
                    //         //         body['status'] = 'Sent';

                    //         //         await postRequest(baseURL + 'api/chats/Postchat',
                    //         //                 body, '', context, width, null, '', false)
                    //         //             .then((value) {
                    //         //           if (value != null) {
                    //         //             setState(() {
                    //         //               body['status'] = 'Sent';
                    //         //             });
                    //         //           }
                    //         //         });
                    //         //       });
                    //         //     }
                    //         //   });
                    //         // },
                    //         child: Container(
                    //           height: 20,
                    //           width: 20,
                    //           margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                    //           child: Icon(CupertinoIcons.photo_on_rectangle,
                    //               color: textColor),
                    //         ),
                    //       ),
                    //       GestureDetector(
                    //         // onTap: () async {
                    //         //   if (txtMessage.text.length > 0) {
                    //         //     var body = {
                    //         //       "chatId": 0,
                    //         //       "orderId": widget.orderID,
                    //         //       "userId": currentUser.userID,
                    //         //       "sentBy": true,
                    //         //       "vendorId": widget.vendorID,
                    //         //       "message": txtMessage.text,
                    //         //       "type": true,
                    //         //       "date": DateTime.now().toString(),
                    //         //       "status": 'Sending'
                    //         //     };

                    //         //     setState(() {
                    //         //       _messagesController.searchList.add(body);
                    //         //       txtMessage.text = '';
                    //         //       Timer(Duration(milliseconds: 200),
                    //         //           () => sc.jumpTo(sc.position.maxScrollExtent));
                    //         //     });

                    //         //     await postRequest(baseURL + 'api/chats/Postchat',
                    //         //             body, '', context, width, null, '', false)
                    //         //         .then((value) {
                    //         //       if (value != null) {
                    //         //         setState(() {
                    //         //           body['status'] = 'Sent';
                    //         //         });
                    //         //       }
                    //         //     });
                    //         //   }
                    //         // },
                    //         child: Container(
                    //           height: 20,
                    //           width: 20,
                    //           margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    //           child: Icon(
                    //             Icons.send_rounded,
                    //             color: primaryBlue,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: height * 0.01),
              decoration: BoxDecoration(
                color: white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      alignment: Alignment.center,
                      width: width * 0.9,
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.005, horizontal: width * 0.03),
                      decoration: BoxDecoration(
                          color: grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(width * 0.07)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CupertinoButton(
                            padding: EdgeInsets.all(0.0),
                            minSize: 0.0001,
                            onPressed: () {},
                            child: Container(
                              child: Icon(
                                UniconsLine.paperclip,
                                color: grey,
                                size: height * 0.035,
                              ),
                            ),
                          ),
                          SizedBox(width: width * 0.02),
                          Container(
                            width: 1,
                            height: height * 0.04,
                            color: grey,
                          ),
                          SizedBox(width: width * 0.02),
                          Expanded(
                              child: TextFormField(
                            minLines: 1,
                            maxLines: 5,
                            onTap: () async {
                              _messagesController.searchList.value =
                                  _messagesController.chatList
                                      .where((p0) => true)
                                      .toList();
                              _messagesController.txtSearch.text = "";

                              showSearch.value = false;
                              await scrollDown();
                            },
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: textColor,

                                  //height: 1.3,
                                  fontSize: height * 0.018,
                                  fontWeight: FontWeight.w400),
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter message",
                              hintStyle: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: grey,

                                    //height: 1.3,
                                    fontSize: height * 0.018,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          )),
                          SizedBox(width: width * 0.02),
                          CupertinoButton(
                            padding: EdgeInsets.all(0.0),
                            minSize: 0.0001,
                            onPressed: () {},
                            child: Container(
                                decoration: BoxDecoration(
                                  color: primaryBlue,
                                  borderRadius:
                                      BorderRadius.circular(width * 5),
                                ),
                                padding: EdgeInsets.all(height * 0.01),
                                height: height * 0.05,
                                width: height * 0.05,
                                child: SvgPicture.asset(
                                  "assets/icons/Send.svg",
                                  color: white,
                                )),
                          )
                        ],
                      )),
                ],
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

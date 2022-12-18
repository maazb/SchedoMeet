import 'dart:async';

import 'package:bit_planner/Controller/account_controller.dart';
import 'package:bit_planner/Controller/messages_controller.dart';
import 'package:bit_planner/Helper/common_widgets/full_screen_loader.dart';
import 'package:bit_planner/View/Account/add_people.dart';
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

class People extends StatefulWidget {
  const People({Key? key}) : super(key: key);

  @override
  State<People> createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  AccountController _accountController = Get.find();
  late double height;
  late double width;

  ScrollController sc = ScrollController();
  ScrollController sc1 = ScrollController();
  RxBool showSearch = false.obs;
  FocusNode searchFocus = FocusNode();
  late List<int> currentPos;

  getData() async {
    _accountController.getRequests();
    loadDataController.loadUser();
    setState(() {});
    // () => _messagesController.searchList.value =
    //     _messagesController.chatList.where((p0) => true).toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
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

    return WillPopScope(
      onWillPop: () async {
        if (_accountController.loadingAcceptReq.value == true ||
            _accountController.loadingAcceptReq.value == true) {
          return false;
        } else {
          return true;
        }
      },
      child: Stack(
        children: [
          Scaffold(
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
                        'People',
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
                          Get.to(() => AddPeople());
                        },
                        child: Container(
                          padding: EdgeInsets.all(width * 0.028),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: grey.withOpacity(0.4), width: 1),
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
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: greyLight,
                      child: Column(
                        children: [
                          SizedBox(height: height * 0.01),
                          Container(
                            margin:
                                EdgeInsets.symmetric(horizontal: width * 0.05),
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius:
                                    BorderRadius.circular(width * 0.03)),
                            child: CupertinoSearchTextField(
                              backgroundColor: white,
                              borderRadius: BorderRadius.circular(width * 0.03),
                              padding: EdgeInsets.only(
                                  top: height * 0.015,
                                  bottom: height * 0.015,
                                  right: width * 0.03,
                                  left: width * 0.02),
                              suffixInsets:
                                  EdgeInsets.only(right: width * 0.03),
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
                          Obx(
                            () => Container(
                              //alignment: Alignment.bottomCenter,
                              child: _accountController.requestList.isEmpty
                                  ? Container()
                                  : Container(
                                      child: Container(
                                        color: white,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: width * 0.05),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Requests',
                                                    style: GoogleFonts.poppins(
                                                      textStyle: TextStyle(
                                                          color: textColor,
                                                          height: 1.3,
                                                          fontSize:
                                                              height * 0.024,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                  CupertinoButton(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            0.0),
                                                    minSize: 0.0001,
                                                    onPressed: null,
                                                    child: Container(),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Obx(
                                              () => ListView.builder(
                                                  itemCount: _accountController
                                                      .requestList.length,
                                                  shrinkWrap: true,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                            height: index == 0
                                                                ? height * 0.02
                                                                : 0),
                                                        CupertinoButton(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0.0),
                                                          minSize: 0.0001,
                                                          onPressed: () {},
                                                          child: Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          width *
                                                                              0.05),
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  SizedBox(
                                                                    height:
                                                                        width *
                                                                            0.13,
                                                                    width:
                                                                        width *
                                                                            0.13,
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(width *
                                                                              5),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        imageUrl: _accountController.requestList[index].image == "" ||
                                                                                _accountController.requestList[index].image == null
                                                                            ? picPlaceHolder.value
                                                                            : _accountController.requestList[index].image!,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        height: height *
                                                                            0.05,
                                                                        width: height *
                                                                            0.05,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        width *
                                                                            0.03,
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          children: [
                                                                            Expanded(
                                                                              child: Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    _accountController.requestList[index].name!,
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
                                                                                  Text(
                                                                                    _accountController.requestList[index].email!,
                                                                                    maxLines: 1,
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
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      CupertinoButton(
                                                                        padding:
                                                                            EdgeInsets.all(0.0),
                                                                        minSize:
                                                                            0.0001,
                                                                        onPressed:
                                                                            () {
                                                                          _accountController.denyRequest(
                                                                              loadDataController.userModel.value.id!,
                                                                              _accountController.requestList[index].id!);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(width * 0.02),
                                                                            color:
                                                                                greyMedium,
                                                                          ),
                                                                          padding: EdgeInsets.symmetric(
                                                                              horizontal: width * 0.03,
                                                                              vertical: height * 0.005),
                                                                          child:
                                                                              Text(
                                                                            "Deny",
                                                                            style: GoogleFonts.poppins(
                                                                                color: textColor,
                                                                                fontSize: height * 0.015,
                                                                                fontWeight: FontWeight.w400),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width: width *
                                                                            0.03,
                                                                      ),
                                                                      CupertinoButton(
                                                                        padding:
                                                                            EdgeInsets.all(0.0),
                                                                        minSize:
                                                                            0.0001,
                                                                        onPressed:
                                                                            () {
                                                                          _accountController.acceptRequest(
                                                                              loadDataController.userModel.value.id!,
                                                                              _accountController.requestList[index].id!);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(width * 0.02),
                                                                            color:
                                                                                primaryMedium,
                                                                          ),
                                                                          padding: EdgeInsets.symmetric(
                                                                              horizontal: width * 0.03,
                                                                              vertical: height * 0.005),
                                                                          child:
                                                                              Text(
                                                                            "Accept",
                                                                            style: GoogleFonts.poppins(
                                                                                color: white,
                                                                                fontSize: height * 0.015,
                                                                                fontWeight: FontWeight.w400),
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  )
                                                                ],
                                                              )),
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              height * 0.022,
                                                        )
                                                      ],
                                                    );
                                                  }),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                              // : Container(),
                            ),
                          ),
                          Container(
                            //alignment: Alignment.bottomCenter,
                            child:
                                //  _messagesController.searchList.length > 0
                                //     ?
                                Container(
                              child: Container(
                                color: white,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: width * 0.05),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Added',
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
                                    Obx(
                                      () => ListView.builder(
                                          itemCount: loadDataController
                                              .userNameList.length,
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                    height: index == 0
                                                        ? height * 0.02
                                                        : 0),
                                                Container(
                                                    child: loadDataController
                                                            .userModel
                                                            .value
                                                            .added!
                                                            .contains(
                                                                loadDataController
                                                                    .userNameList[
                                                                        index]
                                                                    .id)
                                                        ? CupertinoButton(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(0.0),
                                                            minSize: 0.0001,
                                                            onPressed: () {},
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                    margin: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            width *
                                                                                0.05),
                                                                    child: Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              width * 0.13,
                                                                          width:
                                                                              width * 0.13,
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(width * 5),
                                                                            child:
                                                                                CachedNetworkImage(
                                                                              imageUrl: loadDataController.userNameList[index].image == "" || loadDataController.userNameList[index].image == null ? picPlaceHolder.value : loadDataController.userNameList[index].image!,
                                                                              fit: BoxFit.cover,
                                                                              height: height * 0.05,
                                                                              width: height * 0.05,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              width * 0.03,
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Row(
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          loadDataController.userNameList[index].name!,
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
                                                                                        Text(
                                                                                          loadDataController.userNameList[index].email!,
                                                                                          maxLines: 1,
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
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            CupertinoButton(
                                                                              padding: EdgeInsets.all(0.0),
                                                                              minSize: 0.0001,
                                                                              onPressed: () {
                                                                                _accountController.removePeople(loadDataController.userModel.value.id!, loadDataController.userNameList[index].id!).then((value) => {
                                                                                      setState(() {})
                                                                                    });
                                                                              },
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(width * 0.02),
                                                                                  color: red,
                                                                                ),
                                                                                padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.005),
                                                                                child: Text(
                                                                                  "Remove",
                                                                                  style: GoogleFonts.poppins(color: white, fontSize: height * 0.015, fontWeight: FontWeight.w400),
                                                                                ),
                                                                              ),
                                                                            )
                                                                          ],
                                                                        )
                                                                      ],
                                                                    )),
                                                                SizedBox(
                                                                  height:
                                                                      height *
                                                                          0.022,
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        : Container()),
                                              ],
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // : Container(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          ),
          Obx(
            () => Positioned(
                child: _accountController.loadingAcceptReq.value == true
                    ? FullScreenLoader()
                    : Container()),
          )
        ],
      ),
    );
  }
}

class _navigationController {}

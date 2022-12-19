import 'dart:async';

import 'package:bit_planner/Controller/account_controller.dart';
import 'package:bit_planner/Controller/messages_controller.dart';
import 'package:bit_planner/Helper/common_widgets/full_screen_loader.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:unicons/unicons.dart';

import '../../Helper/values.dart';

class AddPeople extends StatefulWidget {
  const AddPeople({Key? key}) : super(key: key);

  @override
  State<AddPeople> createState() => _AddPeopleState();
}

class _AddPeopleState extends State<AddPeople> {
  late double height;
  late double width;
  AccountController _accountController = Get.find();

  ScrollController sc = ScrollController();
  ScrollController sc1 = ScrollController();
  RxBool showSearch = false.obs;
  FocusNode searchFocus = FocusNode();

  getData() async {
    // () => _messagesController.searchList.value =
    //     _messagesController.chatList.where((p0) => true).toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    // await getData();
    // currentPos = List.filled(_messagesController.searchList.length, 0);
    // scrollDown();
    // super.initState();
    // print("Length: " + _messagesController.searchList.length.toString());
    // RxBool searchOpen = false.obs;
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
                        'Find People',
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
                              placeholder: "Search by name or email",
                              backgroundColor: white,
                              borderRadius: BorderRadius.circular(width * 0.03),
                              controller: _accountController.txtSearchUser,
                              padding: EdgeInsets.only(
                                  top: height * 0.015,
                                  bottom: height * 0.015,
                                  right: width * 0.03,
                                  left: width * 0.02),
                              suffixInsets:
                                  EdgeInsets.only(right: width * 0.03),
                              onSuffixTap: () {
                                _accountController.txtSearchUser.clear();
                                _accountController.searchPeopleList.clear();
                              },
                              onSubmitted: (value) {
                                _accountController.searchUsers();
                              },
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
                            child: Container(
                              child: Container(
                                color: white,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    Obx(
                                      () => Container(
                                        width: width,
                                        height: height * 0.8,
                                        color: white,
                                        child: _accountController
                                                .loadingSearch.value
                                            ? Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
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
                                            : _accountController
                                                    .searchPeopleList.isEmpty
                                                ? Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        height: height * 0.1,
                                                      ),
                                                      Container(
                                                        height: width * 0.5,
                                                        width: width * 0.5,
                                                        child:
                                                            LottieBuilder.asset(
                                                          "assets/animations/empty.json",
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.01,
                                                      ),
                                                      Text(
                                                        "Nothing to show here",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                color: grey,
                                                                fontSize:
                                                                    height *
                                                                        0.018,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.2,
                                                      ),
                                                    ],
                                                  )
                                                : Obx(
                                                    () => ListView.builder(
                                                        itemCount:
                                                            _accountController
                                                                .searchPeopleList
                                                                .length,
                                                        shrinkWrap: true,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                  height: index ==
                                                                          0
                                                                      ? height *
                                                                          0.02
                                                                      : 0),
                                                              Obx(
                                                                () => _accountController
                                                                            .searchPeopleList[
                                                                                index]
                                                                            .id ==
                                                                        loadDataController
                                                                            .userModel
                                                                            .value
                                                                            .id
                                                                    ? Container()
                                                                    : CupertinoButton(
                                                                        padding:
                                                                            const EdgeInsets.all(0.0),
                                                                        minSize:
                                                                            0.0001,
                                                                        onPressed:
                                                                            () {},
                                                                        child: Container(
                                                                            margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                                                                            child: Row(
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                SizedBox(
                                                                                  height: width * 0.13,
                                                                                  width: width * 0.13,
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(width * 5),
                                                                                    child: CachedNetworkImage(
                                                                                      imageUrl: _accountController.searchPeopleList[index].image == "" || _accountController.searchPeopleList[index].image == null ? picPlaceHolder.value : _accountController.searchPeopleList[index].image!,
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
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Column(
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  _accountController.searchPeopleList[index].name!,
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
                                                                                                  _accountController.searchPeopleList[index].email!,
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
                                                                                _accountController.requestList.any((element) => element.id == _accountController.searchPeopleList[index].id)
                                                                                    ? Row(
                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                        children: [
                                                                                          CupertinoButton(
                                                                                            padding: EdgeInsets.all(0.0),
                                                                                            minSize: 0.0001,
                                                                                            onPressed: () {
                                                                                              _accountController.denyRequest(loadDataController.userModel.value.id!, _accountController.searchPeopleList[index].id!).then((value) => _accountController.searchUsers());
                                                                                            },
                                                                                            child: Container(
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(width * 0.02),
                                                                                                color: greyMedium,
                                                                                              ),
                                                                                              padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.005),
                                                                                              child: Text(
                                                                                                "Deny",
                                                                                                style: GoogleFonts.poppins(color: textColor, fontSize: height * 0.015, fontWeight: FontWeight.w400),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          SizedBox(
                                                                                            width: width * 0.03,
                                                                                          ),
                                                                                          CupertinoButton(
                                                                                            padding: EdgeInsets.all(0.0),
                                                                                            minSize: 0.0001,
                                                                                            onPressed: () {
                                                                                              _accountController.acceptRequest(loadDataController.userModel.value.id!, _accountController.searchPeopleList[index].id!).then((value) => _accountController.searchUsers());
                                                                                            },
                                                                                            child: Container(
                                                                                              decoration: BoxDecoration(
                                                                                                borderRadius: BorderRadius.circular(width * 0.02),
                                                                                                color: primaryMedium,
                                                                                              ),
                                                                                              padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.005),
                                                                                              child: Text(
                                                                                                "Accept",
                                                                                                style: GoogleFonts.poppins(color: white, fontSize: height * 0.015, fontWeight: FontWeight.w400),
                                                                                              ),
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                      )
                                                                                    : loadDataController.userModel.value.added!.contains(_accountController.searchPeopleList[index].id)
                                                                                        ? Row(
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              CupertinoButton(
                                                                                                padding: EdgeInsets.all(0.0),
                                                                                                minSize: 0.0001,
                                                                                                onPressed: () {
                                                                                                  _accountController.removePeople(loadDataController.userModel.value.id!, _accountController.searchPeopleList[index].id!).then((value) => _accountController.searchUsers());
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
                                                                                        : loadDataController.userModel.value.requested!.contains(_accountController.searchPeopleList[index].id)
                                                                                            ? Row(
                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                children: [
                                                                                                  CupertinoButton(
                                                                                                    padding: EdgeInsets.all(0.0),
                                                                                                    minSize: 0.0001,
                                                                                                    onPressed: () {
                                                                                                      _accountController.removeRequest(loadDataController.userModel.value.id!, _accountController.searchPeopleList[index].id!).then((value) => _accountController.searchUsers());
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(
                                                                                                        borderRadius: BorderRadius.circular(width * 0.02),
                                                                                                        color: yellowLight,
                                                                                                      ),
                                                                                                      padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.005),
                                                                                                      child: Text(
                                                                                                        "Remove Request",
                                                                                                        style: GoogleFonts.poppins(color: brown, fontSize: height * 0.015, fontWeight: FontWeight.w400),
                                                                                                      ),
                                                                                                    ),
                                                                                                  )
                                                                                                ],
                                                                                              )
                                                                                            : Row(
                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                children: [
                                                                                                  CupertinoButton(
                                                                                                    padding: EdgeInsets.all(0.0),
                                                                                                    minSize: 0.0001,
                                                                                                    onPressed: () {
                                                                                                      _accountController.addRequest(loadDataController.userModel.value.id!, _accountController.searchPeopleList[index].id!).then((value) => _accountController.searchUsers());
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(
                                                                                                        borderRadius: BorderRadius.circular(width * 0.02),
                                                                                                        color: primaryMedium,
                                                                                                      ),
                                                                                                      padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.005),
                                                                                                      child: Text(
                                                                                                        "Add",
                                                                                                        style: GoogleFonts.poppins(color: white, fontSize: height * 0.015, fontWeight: FontWeight.w400),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              )
                                                                              ],
                                                                            )),
                                                                      ),
                                                              ),
                                                              Obx(
                                                                () => SizedBox(
                                                                  height: _accountController
                                                                              .searchPeopleList[
                                                                                  index]
                                                                              .id ==
                                                                          loadDataController
                                                                              .userModel
                                                                              .value
                                                                              .id
                                                                      ? 0
                                                                      : height *
                                                                          0.022,
                                                                ),
                                                              )
                                                            ],
                                                          );
                                                        }),
                                                  ),
                                      ),
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

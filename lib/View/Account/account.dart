import 'package:bit_planner/Controller/account_controller.dart';
import 'package:bit_planner/Helper/values.dart';
import 'package:bit_planner/View/Account/about_us.dart';
import 'package:bit_planner/View/Account/people.dart';
import 'package:bit_planner/View/Account/app_settings.dart';
import 'package:bit_planner/View/Account/change_credentials.dart';
import 'package:bit_planner/View/Account/change_password.dart';
import 'package:bit_planner/View/Account/settings.dart';
import 'package:bit_planner/View/Account/privacy_policy.dart';
import 'package:bit_planner/View/Startup/welcome.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

import '../../Controller/navigation_controller.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  late double height;
  late double width;
  AccountController _accountController = Get.put(AccountController());
  NavigationController _navigationController = Get.find();

  getData() async {
    _accountController.getEvents();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarContrastEnforced: true,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
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
                  'Account',
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
                  onPressed: null,
                  child: Container(
                    width: width * 0.12,
                    height: height * 0.01,
                    // padding: EdgeInsets.all(width * 0.028),
                    // decoration: BoxDecoration(
                    //     border:
                    //         Border.all(color: grey.withOpacity(0.4), width: 1),
                    //     borderRadius: BorderRadius.circular(width * 5)),
                    // child: Icon(
                    //   UniconsLine.plus,
                    //   color: textColor,
                    //   size: height * 0.032,
                  ),
                ),
              ],
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width * 0.7,
                  child: Column(
                    children: [
                      SizedBox(
                        height: width * 0.25,
                        width: width * 0.25,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(width * 5),
                          child: CachedNetworkImage(
                            imageUrl: loadDataController
                                            .userModel.value.image ==
                                        "" ||
                                    loadDataController.userModel.value.image ==
                                        null
                                ? picPlaceHolder
                                : loadDataController.userModel.value.image!,
                            fit: BoxFit.cover,
                            height: height * 0.05,
                            width: height * 0.05,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.008,
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
                      Text(
                        loadDataController.userModel.value.email!,
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
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.03),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * 0.2,
                    child: CupertinoButton(
                      padding: EdgeInsets.all(0.0),
                      minSize: 0.0001,
                      onPressed: () {
                        Get.to(() => ChangeCredentials());
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(width * 0.028),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: grey.withOpacity(0.4), width: 1),
                                borderRadius: BorderRadius.circular(width * 5)),
                            child: Icon(
                              UniconsLine.user,
                              color: textColor,
                              size: width * 0.064,
                            ),
                          ),
                          SizedBox(height: height * 0.005),
                          Text(
                            'Information',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: grey,
                                  //height: 1.3,
                                  fontSize: height * 0.015,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.2,
                    child: CupertinoButton(
                      padding: EdgeInsets.all(0.0),
                      minSize: 0.0001,
                      onPressed: () {
                        Get.to(() => ChangePassword());
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(width * 0.028),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: grey.withOpacity(0.4), width: 1),
                                borderRadius: BorderRadius.circular(width * 5)),
                            child: Icon(
                              UniconsLine.lock_alt,
                              color: textColor,
                              size: width * 0.064,
                            ),
                          ),
                          SizedBox(height: height * 0.005),
                          Text(
                            'Password',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: grey,
                                  //height: 1.3,
                                  fontSize: height * 0.015,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.2,
                    child: CupertinoButton(
                      padding: EdgeInsets.all(0.0),
                      minSize: 0.0001,
                      onPressed: () {
                        Get.to(() => People());
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(width * 0.028),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: grey.withOpacity(0.4), width: 1),
                                borderRadius: BorderRadius.circular(width * 5)),
                            child: Icon(
                              UniconsLine.users_alt,
                              color: textColor,
                              size: width * 0.064,
                            ),
                          ),
                          SizedBox(height: height * 0.005),
                          Text(
                            'People',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: grey,
                                  //height: 1.3,
                                  fontSize: height * 0.015,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.2,
                    child: CupertinoButton(
                      padding: EdgeInsets.all(0.0),
                      minSize: 0.0001,
                      onPressed: () {
                        Get.to(() => Settings());
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(width * 0.028),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: grey.withOpacity(0.4), width: 1),
                                borderRadius: BorderRadius.circular(width * 5)),
                            child: Icon(
                              UniconsLine.setting,
                              color: textColor,
                              size: width * 0.064,
                            ),
                          ),
                          SizedBox(height: height * 0.005),
                          Text(
                            'Settings',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: grey,
                                  //height: 1.3,
                                  fontSize: height * 0.015,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
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
                  // Container(
                  //   margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         'Settings',
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
                  SizedBox(
                    height: height * 0.02,
                  ),
                  ListView.builder(
                      itemCount: _accountController.settingsList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            CupertinoButton(
                              padding: const EdgeInsets.all(0.0),
                              minSize: 0.0001,
                              onPressed: () {
                                if (index == 0) {
                                  Get.to(() => PrivacyPolicy());
                                }
                                if (index == 1) {
                                  Get.to(() => AboutUs());
                                }
                                if (index == 2) {
                                  Get.offAll(() => Welcome());
                                }
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
                                            child: SvgPicture.asset(
                                              _accountController
                                                  .settingsList[index].icon!,
                                              color: textColor,
                                              height: width * 0.06,
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
                                              _accountController
                                                  .settingsList[index].name!,
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
                                          ],
                                        ),
                                      ),
                                      CupertinoButton(
                                        padding: const EdgeInsets.all(0.0),
                                        minSize: 0.0001,
                                        onPressed: null,
                                        child: Container(
                                          child: Icon(
                                            CupertinoIcons.forward,
                                            color: textColor,
                                            size: width * 0.06,
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
    );
  }
}

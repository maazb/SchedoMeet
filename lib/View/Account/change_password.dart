import 'package:bit_planner/Controller/account_controller.dart';
import 'package:bit_planner/Helper/common_widgets/error_list.dart';
import 'package:bit_planner/Helper/values.dart';
import 'package:bit_planner/View/Startup/register.dart';
import 'package:bit_planner/View/bottom_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  AccountController _accountController = Get.find();
  late double height;
  late double width;
  RxBool obscureOldPassword = true.obs;
  RxBool obscureNewPassword = true.obs;
  RxBool obscureConfirmPassword = true.obs;
  RxList<String> errors = RxList<String>();
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
        //   statusBarColor: greyLight,
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
                  '',
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
                    width: width * 0.035,
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
        child: Container(
          child: Column(
            children: [
              SizedBox(height: height * 0.05),
              Container(
                  width: width,
                  child: Text(
                    'Change password',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          decoration: TextDecoration.none,
                          color: textColor,
                          height: 1.3,
                          fontSize: height * 0.026,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                  width: width * 0.9,
                  child: Text(
                    'Please enter your current and new passwords.',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          decoration: TextDecoration.none,
                          color: grey,
                          height: 1.3,
                          fontSize: height * 0.018,
                          fontWeight: FontWeight.w400),
                    ),
                  )),
              SizedBox(
                height: height * 0.06,
              ),
              // Container(
              //   alignment: Alignment.center,
              //   width: width,
              //   height: height * 0.07,
              //   decoration: BoxDecoration(
              //       color: white,
              //       //border: Border.all(color: grey.withOpacity(0.4), width: 1),
              //       borderRadius: BorderRadius.circular(width * 0.02)),
              //   margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              //   child: TextField(
              //     style: GoogleFonts.poppins(
              //       textStyle: TextStyle(
              //           overflow: TextOverflow.fade,
              //           color: textColor,
              //           //height: 1.3,
              //           fontSize: height * 0.018,
              //           fontWeight: FontWeight.w400),
              //     ),
              //     cursorColor: primaryBlue,
              //     keyboardType: TextInputType.emailAddress,
              //     decoration: InputDecoration(
              //         hintText: "Email id",
              //         contentPadding:
              //             EdgeInsets.symmetric(horizontal: width * 0.04),
              //         // errorBorder: OutlineInputBorder(
              //         //     borderRadius: BorderRadius.circular(width * 0.02),
              //         //     borderSide: BorderSide(color: red, width: 1)),
              //         // focusedBorder: OutlineInputBorder(
              //         //     borderRadius: BorderRadius.circular(width * 0.02),
              //         //     borderSide: BorderSide(color: primaryBlue, width: 1)),
              //         // enabledBorder: OutlineInputBorder(
              //         //     borderRadius: BorderRadius.circular(width * 0.02),
              //         //     borderSide:
              //         //         BorderSide(color: grey.withOpacity(0.4), width: 1)),
              //         border: InputBorder.none
              //         //  OutlineInputBorder(
              //         //     borderRadius: BorderRadius.circular(width * 0.02),
              //         //     borderSide: BorderSide(
              //         //         color: grey.withOpacity(0.4), width: 1))
              //         ),
              //   ),
              // ),
              // SizedBox(
              //   height: height * 0.02,
              // ),
              Container(
                alignment: Alignment.center,
                width: width,
                height: height * 0.07,
                decoration: BoxDecoration(
                    color: white,
                    //border: Border.all(color: grey.withOpacity(0.4), width: 1),
                    borderRadius: BorderRadius.circular(width * 0.02)),
                margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Row(
                  children: [
                    Expanded(
                      child: Obx(
                        () => TextField(
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                overflow: TextOverflow.fade,
                                color: textColor,
                                //height: 1.3,
                                fontSize: height * 0.018,
                                fontWeight: FontWeight.w400),
                          ),
                          cursorColor: primaryBlue,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: obscureOldPassword.value,
                          controller: _accountController.txtPassword,
                          onChanged: (value) {
                            if (_accountController.txtPassword.text.isEmpty) {
                              errors.add(_accountController.noOldPass);
                            } else {
                              errors.remove(_accountController.noOldPass);
                            }
                          },
                          decoration: InputDecoration(
                              hintText: "Current Password",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: width * 0.04),
                              // errorBorder: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(width * 0.02),
                              //     borderSide: BorderSide(color: red, width: 1)),
                              // focusedBorder: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(width * 0.02),
                              //     borderSide: BorderSide(color: primaryBlue, width: 1)),
                              // enabledBorder: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(width * 0.02),
                              //     borderSide:
                              //         BorderSide(color: grey.withOpacity(0.4), width: 1)),
                              border: InputBorder.none
                              //  OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(width * 0.02),
                              //     borderSide: BorderSide(
                              //         color: grey.withOpacity(0.4), width: 1))
                              ),
                        ),
                      ),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.all(0.0),
                      minSize: 0.0001,
                      onPressed: () {
                        if (obscureOldPassword.value) {
                          obscureOldPassword.value = false;
                        } else {
                          obscureOldPassword.value = true;
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                        child: Icon(
                          UniconsLine.eye_slash,
                          color: grey,
                          size: height * 0.03,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                alignment: Alignment.center,
                width: width,
                height: height * 0.07,
                decoration: BoxDecoration(
                    color: white,
                    //border: Border.all(color: grey.withOpacity(0.4), width: 1),
                    borderRadius: BorderRadius.circular(width * 0.02)),
                margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Row(
                  children: [
                    Expanded(
                      child: Obx(
                        () => TextField(
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                overflow: TextOverflow.fade,
                                color: textColor,
                                //height: 1.3,
                                fontSize: height * 0.018,
                                fontWeight: FontWeight.w400),
                          ),
                          cursorColor: primaryBlue,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: obscureNewPassword.value,
                          controller: _accountController.txtNewPassword,
                          onChanged: (value) {
                            if (_accountController
                                .txtNewPassword.text.isEmpty) {
                              errors.add(_accountController.noNewPass);
                            } else {
                              errors.remove(_accountController.noNewPass);
                            }
                          },
                          decoration: InputDecoration(
                              hintText: "New Password",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: width * 0.04),
                              // errorBorder: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(width * 0.02),
                              //     borderSide: BorderSide(color: red, width: 1)),
                              // focusedBorder: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(width * 0.02),
                              //     borderSide: BorderSide(color: primaryBlue, width: 1)),
                              // enabledBorder: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(width * 0.02),
                              //     borderSide:
                              //         BorderSide(color: grey.withOpacity(0.4), width: 1)),
                              border: InputBorder.none
                              //  OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(width * 0.02),
                              //     borderSide: BorderSide(
                              //         color: grey.withOpacity(0.4), width: 1))
                              ),
                        ),
                      ),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.all(0.0),
                      minSize: 0.0001,
                      onPressed: () {
                        if (obscureNewPassword.value) {
                          obscureNewPassword.value = false;
                        } else {
                          obscureNewPassword.value = true;
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                        child: Icon(
                          UniconsLine.eye_slash,
                          color: grey,
                          size: height * 0.03,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                alignment: Alignment.center,
                width: width,
                height: height * 0.07,
                decoration: BoxDecoration(
                    color: white,
                    //border: Border.all(color: grey.withOpacity(0.4), width: 1),
                    borderRadius: BorderRadius.circular(width * 0.02)),
                margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: Row(
                  children: [
                    Expanded(
                      child: Obx(
                        () => TextField(
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                overflow: TextOverflow.fade,
                                color: textColor,
                                //height: 1.3,
                                fontSize: height * 0.018,
                                fontWeight: FontWeight.w400),
                          ),
                          cursorColor: primaryBlue,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: obscureConfirmPassword.value,
                          controller: _accountController.txtConfirmPassword,
                          onChanged: (value) {
                            errors.clear();
                          },
                          decoration: InputDecoration(
                              hintText: "Confirm Password",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: width * 0.04),
                              // errorBorder: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(width * 0.02),
                              //     borderSide: BorderSide(color: red, width: 1)),
                              // focusedBorder: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(width * 0.02),
                              //     borderSide: BorderSide(color: primaryBlue, width: 1)),
                              // enabledBorder: OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(width * 0.02),
                              //     borderSide:
                              //         BorderSide(color: grey.withOpacity(0.4), width: 1)),
                              border: InputBorder.none
                              //  OutlineInputBorder(
                              //     borderRadius: BorderRadius.circular(width * 0.02),
                              //     borderSide: BorderSide(
                              //         color: grey.withOpacity(0.4), width: 1))
                              ),
                        ),
                      ),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.all(0.0),
                      minSize: 0.0001,
                      onPressed: () {
                        if (obscureConfirmPassword.value) {
                          obscureConfirmPassword.value = false;
                        } else {
                          obscureConfirmPassword.value = true;
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                        child: Icon(
                          UniconsLine.eye_slash,
                          color: grey,
                          size: height * 0.03,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // SizedBox(
              //   height: height * 0.03,
              // ),
              // CupertinoButton(
              //   padding: EdgeInsets.all(0.0),
              //   minSize: 0.0001,
              //   onPressed: () {},
              //   child: Container(
              //       width: width,
              //       margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              //       child: Text(
              //         'Password Recovery',
              //         maxLines: 1,
              //         overflow: TextOverflow.ellipsis,
              //         textAlign: TextAlign.end,
              //         style: GoogleFonts.poppins(
              //           textStyle: TextStyle(
              //               decoration: TextDecoration.none,
              //               color: grey,
              //               height: 1.3,
              //               fontSize: height * 0.018,
              //               fontWeight: FontWeight.w500),
              //         ),
              //       )),
              // ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: ErrorList(
                  errors: errors,
                  darkMode: false,
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              CupertinoButton(
                padding: EdgeInsets.all(0.0),
                minSize: 0.0001,
                onPressed: () async {
                  errors.clear();
                  if (_accountController.txtPassword.text.isEmpty ||
                      _accountController.txtNewPassword.text.isEmpty ||
                      _accountController.txtNewPassword.text !=
                          _accountController.txtConfirmPassword.text ||
                      _accountController.txtNewPassword.text.length < 6) {
                    if (_accountController.txtPassword.text.isEmpty) {
                      errors.add(_accountController.noOldPass);
                    }
                    if (_accountController.txtNewPassword.text.isEmpty) {
                      errors.add(_accountController.noNewPass);
                    } else if (_accountController.txtNewPassword.text !=
                        _accountController.txtConfirmPassword.text) {
                      errors.add(_accountController.noPassMatch);
                    }

                    if (_accountController.txtNewPassword.text.length < 6) {
                      errors.add(_accountController.shortPass);
                    }
                  } else {
                    errors.clear();
                    await _accountController.updatePassowrd();
                  }
                },
                child: Container(
                    alignment: Alignment.center,
                    width: width,
                    height: height * 0.07,
                    decoration: BoxDecoration(
                        color: primaryBlue,
                        //border: Border.all(color: grey.withOpacity(0.4), width: 1),
                        borderRadius: BorderRadius.circular(width * 0.02)),
                    margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Obx(
                      (() => Center(
                            child:
                                _accountController.loadingUpdatePassword.value
                                    ? Container(
                                        height: height * 0.03,
                                        width: height * 0.03,
                                        child: CircularProgressIndicator(
                                          color: white,
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : Text(
                                        'Continue',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              decoration: TextDecoration.none,
                                              color: white,
                                              height: 1.3,
                                              fontSize: height * 0.018,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                          )),
                    )),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   height: height * 0.06,
      //   child: Column(
      //     children: [
      //       Center(
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 Text(
      //                   'Not a member?',
      //                   maxLines: 1,
      //                   overflow: TextOverflow.ellipsis,
      //                   textAlign: TextAlign.end,
      //                   style: GoogleFonts.poppins(
      //                     textStyle: TextStyle(
      //                         decoration: TextDecoration.none,
      //                         color: grey,
      //                         height: 1.3,
      //                         fontSize: height * 0.018,
      //                         fontWeight: FontWeight.w500),
      //                   ),
      //                 ),
      //                 SizedBox(
      //                   width: width * 0.02,
      //                 ),
      //                 CupertinoButton(
      //                   padding: EdgeInsets.all(0.0),
      //                   minSize: 0.0001,
      //                   onPressed: () {
      //                     Get.to(() => Register());
      //                   },
      //                   child: Text(
      //                     'Sign up',
      //                     maxLines: 1,
      //                     overflow: TextOverflow.ellipsis,
      //                     textAlign: TextAlign.end,
      //                     style: GoogleFonts.poppins(
      //                       textStyle: TextStyle(
      //                           decoration: TextDecoration.none,
      //                           color: primaryMedium,
      //                           height: 1.3,
      //                           fontSize: height * 0.018,
      //                           fontWeight: FontWeight.w500),
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             )
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

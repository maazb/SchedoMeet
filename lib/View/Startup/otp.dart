import 'package:bit_planner/Controller/login_register_controller.dart';
import 'package:bit_planner/Helper/common_widgets/error_list.dart';
import 'package:bit_planner/Helper/common_widgets/snackbar_error.dart';
import 'package:bit_planner/Helper/values.dart';
import 'package:bit_planner/View/Startup/new_password.dart';
import 'package:bit_planner/View/Startup/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:unicons/unicons.dart';

class OTP extends StatefulWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  LoginRegisterController _loginRegisterController = Get.find();
  Rx<int> remainingTime = 90.obs;
  late double height;
  late double width;

  RxList<String> errorsOTP = RxList<String>();

  getData() {
    remainingTime.value =
        DateTime.now().add(Duration(seconds: 90)).millisecondsSinceEpoch;
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
    _loginRegisterController.receivedOTP.value = "0000000000";
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
              Center(
                child: Container(
                  height: height * 0.38,
                  width: height * 0.38,
                  child: LottieBuilder.asset(
                    "assets/animations/verify.json",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                  width: width,
                  child: Text(
                    'Verify Pin Code',
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
                    'A four digit pin is sent to your email, please enter it below:',
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
              Container(
                  margin:
                      EdgeInsets.only(left: width * 0.12, right: width * 0.12),
                  child: PinCodeTextField(
                    autoFocus: true,
                    cursorColor: primaryBlue,

                    appContext: context,
                    // controller: _loginRegisterController.txtOTP,
                    enablePinAutofill: true,
                    pastedTextStyle: TextStyle(
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 4,
                    animationType: AnimationType.fade,
                    validator: (v) {
                      return null;
                    },

                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(width * 0.02),
                      fieldHeight: width * 0.15,
                      fieldWidth: width * 0.15,
                      activeFillColor: white,
                      borderWidth: 0.000000000000000000000001,
                      errorBorderColor: Colors.red,
                      inactiveColor: white,
                      selectedFillColor: white,
                      inactiveFillColor: white,
                      activeColor: white,
                      selectedColor: white,
                    ),
                    autoDisposeControllers: false,
                    animationDuration: Duration(milliseconds: 200),
                    textStyle: GoogleFonts.poppins(
                        color: textColor,
                        fontSize: height * 0.028,
                        fontWeight: FontWeight.w400),
                    backgroundColor: greyLight,
                    enableActiveFill: true,
                    controller: _loginRegisterController.txtOTP,
                    keyboardType: TextInputType.number,

                    onCompleted: (v) async {},
                    onChanged: (value) {
                      errorsOTP.remove(_loginRegisterController.noPin);
                      if (_loginRegisterController.txtOTP.text.isEmpty) {
                        errorsOTP.add(_loginRegisterController.noPin);
                      } else {
                        errorsOTP.remove(_loginRegisterController.noPin);
                      }
                    },
                    beforeTextPaste: (text) {
                      return false;
                    },
                  )),
              // SizedBox(
              //   height: height * 0.02,
              // ),
              // Container(
              //   alignment: Alignment.center,
              //   width: width,
              //   height: height * 0.07,
              //   decoration: BoxDecoration(
              //       color: white,
              //       //border: Border.all(color: grey.withOpacity(0.4), width: 1),
              //       borderRadius: BorderRadius.circular(width * 0.02)),
              //   margin: EdgeInsets.symmetric(horizontal: width * 0.05),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: TextField(
              //           style: GoogleFonts.poppins(
              //             textStyle: TextStyle(
              //                 overflow: TextOverflow.fade,
              //                 color: textColor,
              //                 //height: 1.3,
              //                 fontSize: height * 0.018,
              //                 fontWeight: FontWeight.w400),
              //           ),
              //           cursorColor: primaryBlue,

              //           decoration: InputDecoration(
              //               hintText: "Password",
              //               contentPadding:
              //                   EdgeInsets.symmetric(horizontal: width * 0.04),
              //               // errorBorder: OutlineInputBorder(
              //               //     borderRadius: BorderRadius.circular(width * 0.02),
              //               //     borderSide: BorderSide(color: red, width: 1)),
              //               // focusedBorder: OutlineInputBorder(
              //               //     borderRadius: BorderRadius.circular(width * 0.02),
              //               //     borderSide: BorderSide(color: primaryBlue, width: 1)),
              //               // enabledBorder: OutlineInputBorder(
              //               //     borderRadius: BorderRadius.circular(width * 0.02),
              //               //     borderSide:
              //               //         BorderSide(color: grey.withOpacity(0.4), width: 1)),
              //               border: InputBorder.none
              //               //  OutlineInputBorder(
              //               //     borderRadius: BorderRadius.circular(width * 0.02),
              //               //     borderSide: BorderSide(
              //               //         color: grey.withOpacity(0.4), width: 1))
              //               ),
              //         ),
              //       ),
              //       CupertinoButton(
              //         padding: EdgeInsets.all(0.0),
              //         minSize: 0.0001,
              //         onPressed: () {},
              //         child: Container(
              //           padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              //           child: Icon(
              //             UniconsLine.eye_slash,
              //             color: grey,
              //             size: height * 0.03,
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
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
                height: height * 0.02,
              ),
              Obx(
                () => Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CountdownTimer(
                      endTime: remainingTime.value,
                      widgetBuilder: (context, time) {
                        return (time == null)
                            ? Container(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Did not get the code?',
                                          //textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                color: grey,
                                                fontSize: height * 0.018,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        TextButton(
                                            onPressed: () async {
                                              // _loginController.txtOtp.value
                                              //     .clear();
                                              // _loginController.resendOTP();
                                              // // _loginController.duration =
                                              // // _loginController.duration * 2;
                                              _loginRegisterController
                                                  .sendOTP();
                                              remainingTime.value = DateTime
                                                      .now()
                                                  .add(Duration(seconds: 120))
                                                  .millisecondsSinceEpoch;
                                            },
                                            style: ButtonStyle(
                                                overlayColor:
                                                    MaterialStateProperty.all(
                                                        white.withOpacity(
                                                            0.15))),
                                            child: Text(
                                              'Resend OTP',
                                              //textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    // decoration: TextDecoration
                                                    //     .underline,
                                                    color: primaryBlue,
                                                    fontSize: height * 0.018,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : Text(
                                (time.min ?? 0) < 9 && (time.sec ?? 0) < 9
                                    ? '0${time.min ?? 00} : 0${time.sec ?? 00}'
                                    : (time.min ?? 0) < 9
                                        ? '0${time.min ?? 00} : ${time.sec ?? 00}'
                                        : (time.sec ?? 0) < 9
                                            ? '${time.min ?? 00} : 0${time.sec ?? 00}'
                                            : '${time.min ?? 00} : ${time.sec ?? 00}',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: grey,
                                      fontSize: height * 0.018,
                                      fontWeight: FontWeight.w400),
                                ));
                      },
                      textStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: white,
                            fontSize: height * 0.018,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                )),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: ErrorList(errors: errorsOTP, darkMode: false)),
              SizedBox(
                height: height * 0.01,
              ),
              CupertinoButton(
                padding: EdgeInsets.all(0.0),
                minSize: 0.0001,
                onPressed: () {
                  if (_loginRegisterController.txtOTP.text ==
                      _loginRegisterController.receivedOTP.value) {
                    loadDataController.email =
                        _loginRegisterController.txtEmailForgot.text;
                    Get.offAll(() => NewPassword());
                  } else {
                    showSnackbarError("Error",
                        "Wrong OTP entered, authentication unsuccesful");
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
                    child: Center(
                      child: Text(
                        'Verify',
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

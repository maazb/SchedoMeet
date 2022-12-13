import 'package:bit_planner/Controller/login_register_controller.dart';
import 'package:bit_planner/Helper/common_widgets/error_list.dart';
import 'package:bit_planner/Helper/values.dart';
import 'package:bit_planner/View/Startup/forgot_password.dart';
import 'package:bit_planner/View/Startup/register.dart';
import 'package:bit_planner/View/bottom_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginRegisterController _loginRegisterController =
      Get.put(LoginRegisterController());
  RxBool obscurePass = true.obs;
  late double height;
  late double width;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: greyLight,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: white,
      statusBarIconBrightness: Brightness.dark,
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
                    'Hello again!',
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
                    'Welcome back, you have been missed.',
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
                alignment: Alignment.center,
                width: width,
                height: height * 0.07,
                decoration: BoxDecoration(
                    color: white,
                    //border: Border.all(color: grey.withOpacity(0.4), width: 1),
                    borderRadius: BorderRadius.circular(width * 0.02)),
                margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: TextField(
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        overflow: TextOverflow.fade,
                        color: textColor,
                        //height: 1.3,
                        fontSize: height * 0.018,
                        fontWeight: FontWeight.w400),
                  ),
                  onChanged: ((value) {
                    if (_loginRegisterController.txtEmailLogin.text.isEmpty) {
                      _loginRegisterController.errors
                          .add(_loginRegisterController.noEmail);
                    } else {
                      _loginRegisterController.errors
                          .remove(_loginRegisterController.noEmail);
                    }
                  }),
                  controller: _loginRegisterController.txtEmailLogin,
                  cursorColor: primaryBlue,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Email id",
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: width * 0.04),
                      border: InputBorder.none),
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
                          controller: _loginRegisterController.txtPasswordLogin,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: obscurePass.value,
                          onChanged: (value) {
                            if (_loginRegisterController
                                .txtPasswordLogin.text.isEmpty) {
                              _loginRegisterController.errors
                                  .add(_loginRegisterController.noPass);
                            } else {
                              _loginRegisterController.errors
                                  .remove(_loginRegisterController.noPass);
                            }
                          },
                          decoration: InputDecoration(
                              hintText: "Password",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: width * 0.04),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.all(0.0),
                      minSize: 0.0001,
                      onPressed: () {
                        if (obscurePass.value) {
                          obscurePass.value = false;
                        } else {
                          obscurePass.value = true;
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
                height: height * 0.03,
              ),
              CupertinoButton(
                padding: EdgeInsets.all(0.0),
                minSize: 0.0001,
                onPressed: () {
                  Get.to(() => ForgotPassword());
                },
                child: Container(
                    width: width,
                    margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                    child: Text(
                      'Password Recovery',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            decoration: TextDecoration.none,
                            color: grey,
                            height: 1.3,
                            fontSize: height * 0.018,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                child: ErrorList(
                    errors: _loginRegisterController.errors, darkMode: false),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              CupertinoButton(
                padding: EdgeInsets.all(0.0),
                minSize: 0.0001,
                onPressed: () async {
                  _loginRegisterController.errors.clear();
                  if (_loginRegisterController.txtEmailLogin.text.isEmpty ||
                      _loginRegisterController.txtPasswordLogin.text.isEmpty) {
                    if (_loginRegisterController.txtEmailLogin.text.isEmpty) {
                      _loginRegisterController.errors
                          .add(_loginRegisterController.noEmail);
                    }
                    if (_loginRegisterController
                        .txtPasswordLogin.text.isEmpty) {
                      _loginRegisterController.errors
                          .add(_loginRegisterController.noPass);
                    }
                  } else {
                    await _loginRegisterController.login(null, null);
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
                      () => Center(
                        child: _loginRegisterController.loading.value
                            ? Container(
                                height: height * 0.03,
                                width: height * 0.03,
                                child: CircularProgressIndicator(
                                  color: white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                'Login',
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
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: height * 0.06,
        child: Column(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              decoration: TextDecoration.none,
                              color: grey,
                              height: 1.3,
                              fontSize: height * 0.018,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.all(0.0),
                        minSize: 0.0001,
                        onPressed: () {
                          _loginRegisterController.errors.clear();
                          Get.to(() => Register());
                        },
                        child: Text(
                          'Sign up',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.end,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                decoration: TextDecoration.none,
                                color: primaryMedium,
                                height: 1.3,
                                fontSize: height * 0.018,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

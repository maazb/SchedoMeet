import 'package:bit_planner/Controller/login_register_controller.dart';
import 'package:bit_planner/Helper/common_widgets/error_list.dart';
import 'package:bit_planner/Helper/services.dart';
import 'package:bit_planner/Helper/values.dart';
import 'package:bit_planner/View/bottom_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  LoginRegisterController _loginRegisterController = Get.find();
  RxBool obscurePass = true.obs;
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
                    'Welcome!',
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
                    'Please enter your credentials to sign up.',
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
                  cursorColor: primaryBlue,
                  keyboardType: TextInputType.name,
                  controller: _loginRegisterController.txtName,
                  onChanged: (value) {
                    if (_loginRegisterController.txtName.text.isEmpty) {
                      _loginRegisterController.errors
                          .add(_loginRegisterController.noName);
                    } else {
                      _loginRegisterController.errors
                          .remove(_loginRegisterController.noName);
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "Name",
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
                child: TextField(
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        overflow: TextOverflow.fade,
                        color: textColor,
                        //height: 1.3,
                        fontSize: height * 0.018,
                        fontWeight: FontWeight.w400),
                  ),
                  onChanged: (value) {
                    if (_loginRegisterController.txtEmail.text.isEmpty) {
                      _loginRegisterController.errors
                          .add(_loginRegisterController.noEmail);
                    } else {
                      _loginRegisterController.errors
                          .remove(_loginRegisterController.noEmail);
                    }
                  },
                  cursorColor: primaryBlue,
                  keyboardType: TextInputType.emailAddress,
                  controller: _loginRegisterController.txtEmail,
                  decoration: InputDecoration(
                      hintText: "Email address",
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
                padding: EdgeInsets.only(top: height * 0.01),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: TextField(
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              overflow: TextOverflow.fade,
                              color: textColor,
                              //height: 1.3,
                              fontSize: height * 0.018,
                              fontWeight: FontWeight.w400),
                        ),
                        cursorColor: primaryBlue,
                        keyboardType: TextInputType.phone,
                        controller: _loginRegisterController.txtContact,
                        onChanged: (value) {
                          if (_loginRegisterController
                              .txtContact.text.isEmpty) {
                            _loginRegisterController.errors
                                .add(_loginRegisterController.noContact);
                          } else {
                            _loginRegisterController.errors
                                .remove(_loginRegisterController.noContact);
                          }
                        },
                        maxLength: 11,
                        decoration: InputDecoration(
                            isDense: true,
                            counter: SizedBox.shrink(),
                            hintText: "Contact no. (XXXX XXXXXXX)",
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: width * 0.04),
                            border: InputBorder.none),
                      ),
                    ),
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
                          obscureText: obscurePass.value,
                          controller: _loginRegisterController.txtPassword,
                          onChanged: (value) {
                            if (_loginRegisterController
                                .txtPassword.text.isEmpty) {
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
                height: height * 0.01,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.04),
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
                  if (_loginRegisterController.txtName.text.isEmpty ||
                      _loginRegisterController.txtEmail.text.isEmpty ||
                      _loginRegisterController.txtContact.text.isEmpty ||
                      _loginRegisterController.txtPassword.text.isEmpty ||
                      _loginRegisterController.txtPassword.text.length < 6 ||
                      !isEmail(_loginRegisterController.txtEmail.text) ||
                      !isPhone(_loginRegisterController.txtContact.text)) {
                    if (_loginRegisterController.txtName.text.isEmpty) {
                      _loginRegisterController.errors
                          .add(_loginRegisterController.noName);
                    }
                    if (_loginRegisterController.txtEmail.text.isEmpty) {
                      _loginRegisterController.errors
                          .add(_loginRegisterController.noEmail);
                    } else if (!isEmail(
                        _loginRegisterController.txtEmail.text)) {
                      _loginRegisterController.errors
                          .add(_loginRegisterController.invalidEmail);
                    }
                    if (_loginRegisterController.txtContact.text.isEmpty) {
                      _loginRegisterController.errors
                          .add(_loginRegisterController.noContact);
                    } else if (!isPhone(
                        _loginRegisterController.txtContact.text)) {
                      _loginRegisterController.errors
                          .add(_loginRegisterController.invalidContact);
                    }

                    if (_loginRegisterController.txtPassword.text.isEmpty) {
                      _loginRegisterController.errors
                          .add(_loginRegisterController.noPass);
                    } else if (_loginRegisterController
                            .txtPassword.text.length <
                        6) {
                      _loginRegisterController.errors
                          .add(_loginRegisterController.shortPass);
                    }
                  } else {
                    await _loginRegisterController.register();
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
                        child: _loginRegisterController.loadingRegister.value
                            ? Container(
                                height: height * 0.03,
                                width: height * 0.03,
                                child: CircularProgressIndicator(
                                  color: white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                'Sign up',
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
                        'Already a member?',
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
                          Get.back();
                        },
                        child: Text(
                          'Login',
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

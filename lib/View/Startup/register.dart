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
                  decoration: InputDecoration(
                      hintText: "Name",
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: width * 0.04),
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
                  cursorColor: primaryBlue,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Email address",
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: width * 0.04),
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
                  cursorColor: primaryBlue,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      hintText: "Contact no.",
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: width * 0.04),

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
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: width * 0.04),
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
                    CupertinoButton(
                      padding: EdgeInsets.all(0.0),
                      minSize: 0.0001,
                      onPressed: () {},
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
                height: height * 0.04,
              ),
              CupertinoButton(
                padding: EdgeInsets.all(0.0),
                minSize: 0.0001,
                onPressed: () {
                  Get.offAll(BottomNavigator());
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

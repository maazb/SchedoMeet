import 'package:bit_planner/Helper/values.dart';
import 'package:bit_planner/View/bottom_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:unicons/unicons.dart';

class ChangeCredentials extends StatefulWidget {
  const ChangeCredentials({Key? key}) : super(key: key);

  @override
  State<ChangeCredentials> createState() => _ChangeCredentialsState();
}

class _ChangeCredentialsState extends State<ChangeCredentials> {
  late double height;
  late double width;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    txtName.text = "Zoey Ann";
    txtEmail.text = "zoeyann@example.com";
    txtPhone.text = "+923455432123";
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
              SizedBox(height: height * 0.03),
              Container(
                  width: width,
                  child: Text(
                    'Your Information',
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
                    'Please enter your credentials to update.',
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
                height: height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.all(0.0),
                    minSize: 0.0001,
                    onPressed: () async {
                      await MultiImagePicker.pickImages(maxImages: 1);
                    },
                    child: Container(
                      width: width * 0.7,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                height: width * 0.25,
                                width: width * 0.25,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(width * 5),
                                  child: Image.asset(
                                    "assets/images/profile3.jpg",
                                    fit: BoxFit.cover,
                                    height: height * 0.05,
                                    width: height * 0.05,
                                  ),
                                ),
                              ),
                              Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    height: width * 0.08,
                                    width: width * 0.08,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: grey.withOpacity(0.5),
                                              blurRadius: 10,
                                              spreadRadius: 0.2,
                                              offset: Offset(2, 4)),
                                        ],
                                        color: white,
                                        borderRadius:
                                            BorderRadius.circular(width * 100)),
                                    child: Center(
                                      child: Icon(
                                        UniconsLine.pen,
                                        color: primaryBlue,
                                        size: width * 0.05,
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                          // SizedBox(
                          //   height: height * 0.008,
                          // ),
                          // Text(
                          //   'Zoey Ann',
                          //   maxLines: 1,
                          //   overflow: TextOverflow.ellipsis,
                          //   style: GoogleFonts.poppins(
                          //     textStyle: TextStyle(
                          //         color: textColor,
                          //         height: 1.3,
                          //         fontSize: height * 0.024,
                          //         fontWeight: FontWeight.w500),
                          //   ),
                          // ),
                          // Text(
                          //   'zoeyann@example.com',
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.04,
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
                  controller: txtName,
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
                  controller: txtEmail,
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
                  controller: txtPhone,
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
              //           keyboardType: TextInputType.visiblePassword,
              //           obscureText: true,
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
                height: height * 0.04,
              ),
              CupertinoButton(
                padding: EdgeInsets.all(0.0),
                minSize: 0.0001,
                onPressed: () {
                  Get.back();
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
                        'Update',
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
      //                   'Already a member?',
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
      //                     Get.back();
      //                   },
      //                   child: Text(
      //                     'Login',
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

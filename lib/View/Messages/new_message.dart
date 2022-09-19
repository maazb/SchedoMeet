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

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
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
                  'New Message',
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
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: greyLight,
                child: Column(
                  children: [
                    SizedBox(height: height * 0.01),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(width * 0.03)),
                      child: CupertinoSearchTextField(
                        backgroundColor: white,
                        borderRadius: BorderRadius.circular(width * 0.03),
                        padding: EdgeInsets.only(
                            top: height * 0.015,
                            bottom: height * 0.015,
                            right: width * 0.03,
                            left: width * 0.02),
                        suffixInsets: EdgeInsets.only(right: width * 0.03),
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
                      child: _messagesController.searchList.length > 0
                          ? Container(
                              child: Expanded(
                                child: Container(
                                  color: white,
                                  child: ListView.builder(
                                      itemCount: 10,
                                      // shrinkWrap: true,
                                      // physics: const NeverScrollableScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                                height: index == 0
                                                    ? height * 0.02
                                                    : 0),
                                            CupertinoButton(
                                              padding:
                                                  const EdgeInsets.all(0.0),
                                              minSize: 0.0001,
                                              onPressed: () {
                                                if (_messagesController
                                                    .selectedContacts
                                                    .contains(index)) {
                                                  _messagesController
                                                      .selectedContacts
                                                      .remove(index);
                                                } else {
                                                  _messagesController
                                                      .selectedContacts
                                                      .add(index);
                                                }
                                              },
                                              child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: width * 0.05),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        height: width * 0.13,
                                                        width: width * 0.13,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      width *
                                                                          5),
                                                          child: Image.asset(
                                                            "assets/images/profile2.jpg",
                                                            fit: BoxFit.cover,
                                                            // height: height * 0.05,
                                                            // width: height * 0.05,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: width * 0.03,
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    "John Marc",
                                                                    maxLines: 1,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      textStyle: TextStyle(
                                                                          color: textColor,
                                                                          //height: 1.3,
                                                                          fontSize: height * 0.018,
                                                                          fontWeight: FontWeight.w500),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Obx(
                                                                  () => Container(
                                                                      child: _messagesController.selectedContacts.contains(index)
                                                                          ? Container(
                                                                              margin: EdgeInsets.only(left: width * 0.02),
                                                                              alignment: Alignment.center,
                                                                              decoration: BoxDecoration(border: Border.all(color: primaryBlue, width: 1), color: primaryBlue, borderRadius: BorderRadius.circular(width * 5)),
                                                                              child: Icon(
                                                                                UniconsLine.check,
                                                                                color: white,
                                                                                size: width * 0.05,
                                                                              ))
                                                                          : Container(
                                                                              margin: EdgeInsets.only(left: width * 0.02),
                                                                              alignment: Alignment.center,
                                                                              decoration: BoxDecoration(border: Border.all(color: grey.withOpacity(0.4), width: 1), borderRadius: BorderRadius.circular(width * 5)),
                                                                              child: Icon(
                                                                                UniconsLine.check,
                                                                                color: grey.withOpacity(0.4),
                                                                                size: width * 0.05,
                                                                              ))),
                                                                )

                                                                // Text(
                                                                //   "",
                                                                //   maxLines: 1,
                                                                //   overflow:
                                                                //       TextOverflow.ellipsis,
                                                                //   style: GoogleFonts.poppins(
                                                                //     textStyle: TextStyle(
                                                                //         color: grey,
                                                                //         //height: 1.3,
                                                                //         fontSize:
                                                                //             height * 0.015,
                                                                //         fontWeight:
                                                                //             FontWeight.w400),
                                                                //   ),
                                                                // ),
                                                              ],
                                                            ),
                                                            // Row(
                                                            //   children: [
                                                            //     Expanded(
                                                            //       child: Text(
                                                            //         "I have sents you a summary of today's completed tasks on your email address, you may review them and respond as soon as possible.",
                                                            //         maxLines: 2,
                                                            //         overflow:
                                                            //             TextOverflow.ellipsis,
                                                            //         style:
                                                            //             GoogleFonts.poppins(
                                                            //           textStyle: TextStyle(
                                                            //               color: index == 0 ||
                                                            //                       index == 1
                                                            //                   ? textColor
                                                            //                   : grey,
                                                            //               //height: 1.3,
                                                            //               fontSize:
                                                            //                   height * 0.016,
                                                            //               fontWeight: index ==
                                                            //                           0 ||
                                                            //                       index == 1
                                                            //                   ? FontWeight
                                                            //                       .w500
                                                            //                   : FontWeight
                                                            //                       .w400),
                                                            //         ),
                                                            //       ),
                                                            //     ),
                                                            //     CupertinoButton(
                                                            //       padding:
                                                            //           const EdgeInsets.all(
                                                            //               0.0),
                                                            //       minSize: 0.0001,
                                                            //       onPressed: null,
                                                            //       child: Container(
                                                            //           child: index == 0 ||
                                                            //                   index == 1
                                                            //               ? Container(
                                                            //                   margin: EdgeInsets.only(
                                                            //                       left: width *
                                                            //                           0.02),
                                                            //                   height: height *
                                                            //                       0.03,
                                                            //                   width: height *
                                                            //                       0.03,
                                                            //                   alignment:
                                                            //                       Alignment
                                                            //                           .center,
                                                            //                   decoration: BoxDecoration(
                                                            //                       color:
                                                            //                           primaryBlue,
                                                            //                       borderRadius:
                                                            //                           BorderRadius.circular(width *
                                                            //                               5)),
                                                            //                   child: Text(
                                                            //                     "2",
                                                            //                     maxLines: 1,
                                                            //                     overflow:
                                                            //                         TextOverflow
                                                            //                             .ellipsis,
                                                            //                     style: GoogleFonts
                                                            //                         .poppins(
                                                            //                       textStyle: TextStyle(
                                                            //                           color: white,
                                                            //                           //height: 1.3,
                                                            //                           fontSize: height * 0.015,
                                                            //                           fontWeight: FontWeight.w500),
                                                            //                     ),
                                                            //                   ),
                                                            //                 )
                                                            //               : Container()),
                                                            //     )
                                                            //   ],
                                                            // ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                            SizedBox(
                                              height: height * 0.022,
                                            )
                                          ],
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

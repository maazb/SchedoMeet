import 'package:bit_planner/Helper/values.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: greyLight,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: width * 0.12,
                  width: width * 0.12,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(width * 5),
                    child: Image.asset(
                      "assets/images/profilewoman.jpg",
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
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome!',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: textColor.withOpacity(0.4),
                                height: 1.3,
                                fontSize: height * 0.016,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          'Maria Spectre',
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
                      ],
                    ),
                  ),
                ),
                CupertinoButton(
                  padding: EdgeInsets.all(0.0),
                  minSize: 0.0001,
                  onPressed: () {},
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(width * 0.03),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(width * 5)),
                        child: Icon(
                          CupertinoIcons.bell_fill,
                          color: textColor,
                          size: height * 0.03,
                        ),
                      ),
                      Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.01,
                                vertical: height * 0.0005),
                            decoration: BoxDecoration(
                                color: red,
                                borderRadius: BorderRadius.circular(width * 5)),
                            child: Text(
                              '2',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: white,
                                    //height: 1.3,
                                    fontSize: height * 0.012,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            )),
      ),
      body: Container(
          child: Column(
        children: [
          SizedBox(height: height * 0.01),
          Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Unread messages',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: textColor.withOpacity(0.4),
                        //height: 1.3,
                        fontSize: height * 0.021,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                CupertinoButton(
                  padding: EdgeInsets.all(0.0),
                  minSize: 0.0001,
                  onPressed: () {},
                  child: Container(
                    child: Icon(
                      CupertinoIcons.multiply,
                      size: height * 0.03,
                      color: textColor.withOpacity(0.4),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: height * 0.015),
          Container(
            height: height * 0.192,
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      SizedBox(
                        width: width * 0.05,
                      ),
                      Container(
                        width: width * 0.6,
                        //height: height * 0.2,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(width * 0.03)),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(
                                  left: width * 0.04,
                                  right: width * 0.04,
                                  top: height * 0.02),
                              height: height * 0.1,
                              width: width,
                              decoration: BoxDecoration(
                                  color: primaryLight,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(
                                        width * 0.03,
                                      ),
                                      topLeft: Radius.circular(
                                        width * 0.03,
                                      ),
                                      topRight: Radius.circular(
                                        width * 0.03,
                                      ))),
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: width * 0.03,
                                    vertical: height * 0.01),
                                child: Text(
                                  'I have sent you a summary of today\'s completed tasks on your email.',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: primaryBlue,
                                        height: 1.3,
                                        fontSize: height * 0.018,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: width * 0.04,
                                  vertical: height * 0.012),
                              child: Row(
                                children: [
                                  Container(
                                    height: width * 0.09,
                                    width: width * 0.09,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(width * 5),
                                      child: Image.asset(
                                        "assets/images/profile2.jpg",
                                        fit: BoxFit.cover,
                                        height: height * 0.05,
                                        width: height * 0.05,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  Container(
                                    child: Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Maya Aly',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: textColor,
                                                  height: 1.3,
                                                  fontSize: height * 0.019,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Text(
                                            '2h ago',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  color: textColor
                                                      .withOpacity(0.4),
                                                  height: 1.3,
                                                  fontSize: height * 0.015,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: index == 4 ? width * 0.04 : 0)
                    ],
                  );
                }),
          )
        ],
      )),
    );
  }
}

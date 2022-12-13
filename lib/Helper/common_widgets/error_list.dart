import 'package:bit_planner/Helper/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorList extends StatefulWidget {
  RxList<String> errors;
  bool? darkMode = false;
  ErrorList({Key? key, required this.errors, required this.darkMode})
      : super(key: key);

  @override
  State<ErrorList> createState() => _ErrorListState();
}

class _ErrorListState extends State<ErrorList> {
  late double height;
  late double width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(vertical: height * 0.01),
        // margin: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: ListView.builder(
            itemCount: widget.errors.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: ((context, index) {
              return Container(
                child: Column(
                  children: [
                    Container(
                      child: index == 0
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CupertinoButton(
                                  padding: EdgeInsets.all(0.0),
                                  minSize: 0.0001,
                                  onPressed: () {
                                    widget.errors.clear();
                                  },
                                  child: Container(
                                    child: Icon(
                                      CupertinoIcons.multiply,
                                      color: grey,
                                      size: height * 0.025,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Container(),
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cancel_outlined,
                          color: widget.darkMode == false
                              ? Colors.red
                              : Colors.red[200],
                          size: height * 0.017,
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Expanded(
                          child: Text(widget.errors[index],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: GoogleFonts.poppins(
                                  color: widget.darkMode == false
                                      ? textColor
                                      : white,
                                  fontSize: height * 0.016,
                                  fontWeight: FontWeight.w400)

                              // \GoogleFonts.poppins(
                              //     fontSize: height * 0.016,
                              //     color:
                              //         widget.darkMode == false ? textColor : white,
                              //     fontWeight: FontWeight.w400),
                              ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            })),
      ),
    );
  }
}

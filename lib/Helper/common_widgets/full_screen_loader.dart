import 'dart:ui';

import 'package:bit_planner/Helper/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class FullScreenLoader extends StatefulWidget {
  const FullScreenLoader({Key? key}) : super(key: key);

  @override
  State<FullScreenLoader> createState() => _FullScreenLoaderState();
}

class _FullScreenLoaderState extends State<FullScreenLoader> {
  late double height;
  late double width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Container(
      height: height,
      width: width,
      child: Container(
        color: textColor.withOpacity(0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              height: width * 0.3,
              width: width * 0.3,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(width * 0.03)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: width * 0.1,
                      width: width * 0.1,
                      child: CircularProgressIndicator(
                        color: primaryBlue,
                        strokeWidth: 3.5,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text(
                      "Please wait",
                      maxLines: 1,
                      style: GoogleFonts.poppins(
                          fontSize: width * 0.026,
                          decoration: TextDecoration.none,
                          color: grey,
                          fontWeight: FontWeight.w500),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

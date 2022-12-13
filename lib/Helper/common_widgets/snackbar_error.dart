import 'package:bit_planner/Helper/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

showSnackbarError(String title, String message) {
  Get.snackbar(
    'Error',
    'Please enter email and password to continue.',
    snackPosition: SnackPosition.TOP,
    titleText: Text(
      title,
      style: GoogleFonts.gothicA1(
        textStyle: TextStyle(
            color: Colors.red, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    messageText: Text(
      message,
      style: GoogleFonts.gothicA1(
        textStyle: TextStyle(
            color: textColor, fontSize: 14, fontWeight: FontWeight.w600),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../values.dart';

showSnackbarNeutral(String title, String message) {
  Get.snackbar(
    'Error',
    'Please enter email and password to continue.',
    snackPosition: SnackPosition.TOP,
    duration: Duration(seconds: 4),
    titleText: Text(
      title,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
            color: primaryBlue, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    ),
    messageText: Text(
      message,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
            color: textColor, fontSize: 14, fontWeight: FontWeight.w600),
      ),
    ),
  );
}

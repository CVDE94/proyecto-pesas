import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> messengerkey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String message) {
    final snackBar = SnackBar(
      content: Text(message, style: GoogleFonts.roboto()),
    );
    messengerkey.currentState!.showSnackBar(snackBar);
  }
}

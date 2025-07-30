import 'package:distinct_assignment/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showCustomToast({
  required String message,
  Toast toastLength = Toast.LENGTH_SHORT,
  ToastGravity gravity = ToastGravity.SNACKBAR,
  int timeInSecForIosWeb = 3,
  double fontSize = 12.0,
  Color backgroundColor = kblack,
  Color textColor = kwhite,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: toastLength,
    gravity: gravity,
    timeInSecForIosWeb: timeInSecForIosWeb,
    fontSize: fontSize,
    backgroundColor: backgroundColor,
    textColor: textColor,
    webBgColor: "linear-gradient(to right,#ff0000)",
    webPosition: "center",
  );
}

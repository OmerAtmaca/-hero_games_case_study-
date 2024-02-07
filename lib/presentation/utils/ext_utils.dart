import 'package:flutter/material.dart';

extension MediaQueryExt on BuildContext {
  double screenWidth() => MediaQuery.of(this).size.width;

  double screenHeight() => MediaQuery.of(this).size.height;

  double topPadding() => MediaQuery.of(this).padding.top;

  double screenWidthOneQuarter() => MediaQuery.of(this).size.width / 4;

  double bottomSafeAreaHeight() => MediaQuery.of(this).padding.bottom;
}

extension StringExt on String {
  bool isValidEmail() => RegExp(
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
      ).hasMatch(this);

  bool isValidPhoneNumber() =>
      RegExp(r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)')
          .hasMatch(this);

  bool isValidUnmaskedPhoneNumber() {
    debugPrint(this);
    debugPrint(
        "${RegExp(r'(^[\+]?[0-9]{3}[0-9]{3}[0-9]{4,6}$)').hasMatch(this)}");
    return RegExp(
      r'(^[\+]?[0-9]{3}[0-9]{3}[0-9]{4,6}$)',
    ).hasMatch(this);
  }

  String getUnmaskedPhone() => replaceAll("(", "")
      .replaceAll(")", "")
      .replaceAll(" ", "")
      .replaceAll("-", "");

  String clearEmptyChars() => replaceAll(" ", "");

  String extractYear() {
    if (length < 5) {
      throw ArgumentError('date string must be at least 5 characters long');
    }
    final String yearStr = split("/")[1];
    final int yearValue = int.parse(yearStr);
    return (2000 + yearValue).toString();
  }

  String extractMonth() {
    if (length < 5) {
      throw ArgumentError('date string must be at least 5 characters long');
    }
    final String monthStr = split("/")[0];
    return "${int.parse(monthStr)}";
  }

  String toBearer() => "Bearer $this";

  String? getFileExtension() {
    try {
      return ".${split('.').last}";
    } catch (e) {
      return null;
    }
  }
}

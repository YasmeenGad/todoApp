import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/shared/styles/colors.dart';

class MyThemeData {
  static ThemeData customlightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: bgColorlight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        unselectedItemColor: Color(0xFFC8C9CB),
        backgroundColor: lightColor,
        elevation: 5),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.poppins(
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
        color: lightColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: primaryColor,
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: greyColor,
      ),
    ),
  );

  static ThemeData customdarkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: bgColordark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 5,
      backgroundColor: bgNavdark,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: primaryColor,
      unselectedItemColor: lightColor,
    ),
    textTheme: TextTheme(
      bodyMedium: GoogleFonts.poppins(
        fontSize: 17.sp,
        fontWeight: FontWeight.w500,
        color: primaryColor,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
        color: bgColordark,
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: lightColor,
      ),
    ),
  );
}

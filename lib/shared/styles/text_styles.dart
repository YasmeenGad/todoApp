import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/shared/styles/colors.dart';

ThemeData texttheme = ThemeData(
    textTheme: TextTheme(
        bodyLarge: GoogleFonts.poppins().copyWith(
            color: lightColor, fontSize: 22.sp, fontWeight: FontWeight.w700)));

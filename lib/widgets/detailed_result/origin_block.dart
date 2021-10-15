import 'package:clean_dictionary/constants/app_colors.dart';
import 'package:clean_dictionary/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Widget originBlock(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppConstants.detailedPage_Origin.toUpperCase(),
          style: GoogleFonts.poppins(
            color: AppColors.appBlack,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        Text(
          AppConstants.loremIpsum,
          style: GoogleFonts.poppins(
            color: AppColors.appBlack,
            fontWeight: FontWeight.w300,
            fontSize: 12.sp,
          ),
        ),
        SizedBox(height: 24.0),
      ],
    ),
  );
}

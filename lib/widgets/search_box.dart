import 'package:clean_dictionary/constants/app_colors.dart';
import 'package:clean_dictionary/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Widget searchBox(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    decoration: BoxDecoration(
      color: AppColors.appLightGrey,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.search_rounded,
          color: AppColors.appGrey,
        ),
        SizedBox(width: 8.0),
        Text(
          AppConstants.searchPage_SearchBoxHint,
          style: GoogleFonts.poppins(
            color: AppColors.appGrey,
            fontSize: 12.sp,
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    ),
  );
}

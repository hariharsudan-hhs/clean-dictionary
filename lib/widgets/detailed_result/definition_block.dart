import 'package:clean_dictionary/constants/app_colors.dart';
import 'package:clean_dictionary/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Widget definitionBlock(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppConstants.detailedPage_Definitions.toUpperCase(),
          style: GoogleFonts.poppins(
            color: AppColors.appBlack,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "1",
              style: GoogleFonts.poppins(
                color: AppColors.appBlack,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 8.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppConstants.resultDefault,
                  style: GoogleFonts.poppins(
                    color: AppColors.appBlack,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  AppConstants.resultDefault,
                  style: GoogleFonts.poppins(
                    color: AppColors.appGrey,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Text(
                      "1",
                      style: GoogleFonts.poppins(
                        color: AppColors.appBlack,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Text(
                      "2",
                      style: GoogleFonts.poppins(
                        color: AppColors.appBlack,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
              ],
            ),
          ],
        ),
        SizedBox(height: 32.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "2",
              style: GoogleFonts.poppins(
                color: AppColors.appBlack,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 8.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppConstants.resultDefault,
                  style: GoogleFonts.poppins(
                    color: AppColors.appBlack,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  AppConstants.resultDefault,
                  style: GoogleFonts.poppins(
                    color: AppColors.appGrey,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Text(
                      "1",
                      style: GoogleFonts.poppins(
                        color: AppColors.appBlack,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Text(
                      "2",
                      style: GoogleFonts.poppins(
                        color: AppColors.appBlack,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

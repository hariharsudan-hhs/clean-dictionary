import 'package:clean_dictionary/constants/app_colors.dart';
import 'package:clean_dictionary/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Widget meaningsBlock(BuildContext context) {
  final List<String> sampleData = ["woman", "adult female", "female", "girl"];

  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppConstants.detailedPage_Synonyms.toUpperCase(),
          style: GoogleFonts.poppins(
            color: AppColors.appBlack,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        ListView.builder(
            physics: new NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: sampleData.length,
            itemBuilder: (context, item) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
                child: Text(
                  sampleData[item],
                  style: GoogleFonts.poppins(
                    color: AppColors.appBlack,
                    fontWeight: FontWeight.w300,
                    fontSize: 12.sp,
                  ),
                ),
              );
            }),
      ],
    ),
  );
}

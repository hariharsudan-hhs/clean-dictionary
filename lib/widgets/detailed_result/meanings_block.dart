import 'package:clean_dictionary/constants/app_colors.dart';
import 'package:clean_dictionary/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Widget meaningsBlock(BuildContext context, String title, List<String> content) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: GoogleFonts.montserrat(
            color: AppColors.appBlack,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            height: 1.4,
          ),
        ),
        SizedBox(height: 12.0),
        (content.length != 0)
            ? ListView.builder(
                physics: new NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: content.length > 4 ? 4 : content.length,
                itemBuilder: (context, item) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
                    child: Text(
                      content[item].isNotEmpty ? content[item] : "",
                      style: GoogleFonts.montserrat(
                        color: AppColors.appBlack,
                        fontWeight: FontWeight.w300,
                        fontSize: 12.sp,
                        height: 1.4,
                      ),
                    ),
                  );
                })
            : Text(
                AppConstants.detailedPage_EmptyResult,
                style: GoogleFonts.montserrat(
                  color: AppColors.appBlack,
                  fontWeight: FontWeight.w300,
                  fontSize: 12.sp,
                  height: 1.4,
                ),
              ),
      ],
    ),
  );
}

import 'package:clean_dictionary/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Widget originBlock(BuildContext context, String origin) {
  return Container(
    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppConstants.detailedPage_Origin.toUpperCase(),
          style: GoogleFonts.montserrat(
            color: Theme.of(context).primaryColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            height: 1.4,
          ),
        ),
        SizedBox(height: 16.0),
        Text(
          origin.isNotEmpty ? origin : AppConstants.detailedPage_EmptyResult,
          style: GoogleFonts.montserrat(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w300,
            fontSize: 12.sp,
            height: 1.4,
          ),
        ),
        SizedBox(height: 32.0),
      ],
    ),
  );
}

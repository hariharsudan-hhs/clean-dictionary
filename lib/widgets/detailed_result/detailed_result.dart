import 'package:clean_dictionary/constants/app_colors.dart';
import 'package:clean_dictionary/constants/app_constants.dart';
import 'package:clean_dictionary/widgets/detailed_result/definition_block.dart';
import 'package:clean_dictionary/widgets/detailed_result/meanings_block.dart';
import 'package:clean_dictionary/widgets/detailed_result/origin_block.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Widget detailedResult(BuildContext context) {
  return SingleChildScrollView(
    physics: new BouncingScrollPhysics(),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.0),
              Text(
                AppConstants.resultDefault,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.appBlack,
                ),
              ),
              SizedBox(height: 4.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "[" + AppConstants.resultDefault + "]",
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w200,
                      color: AppColors.appBlack,
                    ),
                  ),
                  IconButton(
                    padding: const EdgeInsets.only(top: 8.0),
                    onPressed: null,
                    icon: Icon(
                      Icons.volume_up,
                      color: AppColors.appBlack,
                      size: 24.0,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 40.0),
        definitionBlock(context),
        SizedBox(height: 40.0),
        Container(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  meaningsBlock(context),
                  SizedBox(width: 8.0),
                  meaningsBlock(context),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 40.0),
        originBlock(context),
      ],
    ),
  );
}

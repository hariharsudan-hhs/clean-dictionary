import 'package:clean_dictionary/constants/app_colors.dart';
import 'package:clean_dictionary/constants/app_constants.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Widget simpleResult(BuildContext context, String word, String phonetic, String partOfSpeech, String definition) {
  return Padding(
    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
    child: Container(
      child: DelayedDisplay(
        delay: Duration(milliseconds: 300),
        fadingDuration: Duration(milliseconds: 300),
        slidingBeginOffset: const Offset(0.0, 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    word.isNotEmpty ? word : AppConstants.resultDefault,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.appBlack,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "[" + (phonetic.isNotEmpty ? phonetic : AppConstants.resultDefault) + "]",
                        style: GoogleFonts.notoSerif(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w200,
                          color: AppColors.appBlack,
                        ),
                      ),
                      IconButton(
                        padding: const EdgeInsets.only(top: 4.0),
                        onPressed: null,
                        icon: Icon(
                          Icons.volume_up,
                          color: AppColors.appBlack,
                          size: 28.0,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 24.0),
                ],
              ),
            ),
            Flexible(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 24.h,
                  child: SingleChildScrollView(
                    physics: new BouncingScrollPhysics(),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8.0,
                              bottom: 8.0,
                            ),
                            child: Text(
                              partOfSpeech.isNotEmpty ? partOfSpeech : AppConstants.resultDefault,
                              style: GoogleFonts.montserrat(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.normal,
                                color: AppColors.appGrey,
                                height: 1.4,
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 2.0,
                            color: AppColors.appLightGrey,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 8.0,
                              bottom: 8.0,
                            ),
                            child: Text(
                              definition.isNotEmpty ? definition : AppConstants.loremIpsum,
                              style: GoogleFonts.montserrat(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.normal,
                                color: AppColors.appGrey,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

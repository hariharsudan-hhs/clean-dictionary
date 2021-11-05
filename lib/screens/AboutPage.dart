import 'package:clean_dictionary/constants/app_colors.dart';
import 'package:clean_dictionary/constants/app_constants.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                child: Text(
                  AppConstants.navClose,
                  style: kNavTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        child: Container(
          child: DelayedDisplay(
            delay: Duration(milliseconds: 300),
            fadingDuration: Duration(milliseconds: 300),
            slidingBeginOffset: const Offset(0.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppConstants.aboutPage_MainText_1,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 36.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        AppConstants.aboutPage_MainText_2,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 48.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 24.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: RichText(
                          text: TextSpan(
                            text: AppConstants.aboutPage_by + " ",
                            style: GoogleFonts.montserrat(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal,
                              color: AppColors.appGrey,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: AppConstants.aboutPage_hhs,
                                style: GoogleFonts.montserrat(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 80.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppConstants.appVersion,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.normal,
                            color: AppColors.appGrey,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            showLicensePage(
                                context: context,
                                // applicationIcon: Image.asset(name)
                                applicationName: "Clean Dictionary",
                                applicationVersion: "1.0");
                          },
                          child: Text(
                            AppConstants.aboutPage_viewLicenses,
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.normal,
                              color: AppColors.appGrey,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

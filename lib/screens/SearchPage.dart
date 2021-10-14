import 'package:clean_dictionary/constants/app_colors.dart';
import 'package:clean_dictionary/constants/app_constants.dart';
import 'package:clean_dictionary/screens/AboutPage.dart';
import 'package:clean_dictionary/screens/SimpleResultPage.dart';
import 'package:clean_dictionary/widgets/search_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SearchPage extends StatelessWidget {
  final List<String> sampleRecent = ["Ambitious", "Gambling", "Human", "Problem"];

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
            onTap: () => Get.to(() => AboutPage()),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                child: Text(
                  AppConstants.navAbout,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppConstants.searchPage_MainHeading,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Container(
                    height: 64.0,
                    child: InkWell(
                      onTap: () => Get.to(() => SimpleResultPage()),
                      child: searchBox(context),
                    ),
                  )
                ],
              ),
              SizedBox(height: 6.h),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppConstants.searchPage_SubHeading,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Expanded(
                      child: ListView.builder(
                          itemCount: sampleRecent.length,
                          itemBuilder: (context, item) {
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
                              child: Text(
                                sampleRecent[item],
                                style: GoogleFonts.poppins(
                                  color: AppColors.appGrey,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

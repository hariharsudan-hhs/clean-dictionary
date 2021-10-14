import 'package:clean_dictionary/constants/app_colors.dart';
import 'package:clean_dictionary/constants/app_constants.dart';
import 'package:clean_dictionary/screens/AboutPage.dart';
import 'package:clean_dictionary/screens/DetailedResultPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SimpleResultPage extends StatelessWidget {
  void handlePopUpClick(String value) {
    print(value);
    switch (value) {
      case AppConstants.popupSwitchToDetailedView:
        Get.off(() => DetailedResultPage());
        break;
      case AppConstants.popupSwitchToDarkMode:
        break;
      case AppConstants.popupShare:
        break;
      case AppConstants.popupAbout:
        Get.to(() => AboutPage());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leadingWidth: 100.0,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppConstants.navBack,
                style: kNavTextStyle,
              ),
            ),
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(
              Icons.more_vert,
              color: AppColors.appBlack,
              size: 28.0,
            ),
            onSelected: handlePopUpClick,
            itemBuilder: (BuildContext context) {
              return {
                AppConstants.popupSwitchToDetailedView,
                AppConstants.popupSwitchToDarkMode,
                AppConstants.popupShare,
                AppConstants.popupAbout,
              }.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(
                    choice,
                    style: GoogleFonts.poppins(
                      color: AppColors.appBlack,
                    ),
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppConstants.resultDefault,
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
                          "[" + AppConstants.resultDefault + "]",
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 20.sp,
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
                            size: 28.0,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 24.0),
                  ],
                ),
              ),
              Container(
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
                            AppConstants.resultDefault,
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal,
                              color: AppColors.appGrey,
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
                            AppConstants.loremIpsum,
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal,
                              color: AppColors.appGrey,
                            ),
                          ),
                        ),
                      ],
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
}

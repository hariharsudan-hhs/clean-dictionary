import 'package:clean_dictionary/constants/app_colors.dart';
import 'package:clean_dictionary/constants/app_constants.dart';
import 'package:clean_dictionary/screens/SimpleResultPage.dart';
import 'package:clean_dictionary/widgets/definition_block.dart';
import 'package:clean_dictionary/widgets/meanings_block.dart';
import 'package:clean_dictionary/widgets/origin_block.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'AboutPage.dart';

class DetailedResultPage extends StatelessWidget {
  final List<String> sampleData = ["woman", "adult female", "female", "girl"];

  void handlePopUpClick(String value) {
    print(value);
    switch (value) {
      case AppConstants.popupSwitchToSimpleView:
        Get.to(() => SimpleResultPage());
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
                AppConstants.popupSwitchToSimpleView,
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
      body: SingleChildScrollView(
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
      ),
    );
  }
}

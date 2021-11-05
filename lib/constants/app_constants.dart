import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'app_colors.dart';

class AppConstants {
  //app
  static const String appName = "Clean Dictionary";
  static const String appVersion = "Version 1.0";

  //api endpoint
  static const String apiEndpoint = "https://api.dictionaryapi.dev/api/v2/entries/en/";

  //about page constants
  static const String aboutPage_MainText_1 = "This is a";
  static const String aboutPage_MainText_2 = "Dictionary.";
  static const String aboutPage_by = "By";
  static const String aboutPage_hhs = "HHS";

  //search page constants
  static const String searchPage_MainHeading = "Dictionary.";
  static const String searchPage_SubHeading = "Recent";
  static const String searchPage_SearchBoxHint = "search here";
  static const String searchPage_SearchButtonText = "Search";

  //detailed page constants
  static const String detailedPage_Definitions = "Definitions";
  static const String detailedPage_Synonyms = "Synonyms";
  static const String detailedPage_Antonyms = "Antonyms";
  static const String detailedPage_Origin = "Origin";
  static const String detailedPage_EmptyResult = "-";

  //result default constants
  static const String resultDefault = "loading..";
  static const String loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis efficitur, diam eget euismod tempus, metus purus tempus felis, in elementum arcu libero et velit.";

  //error page constants
  static const String error_Word = "Word";
  static const String error_Unavailable = "Unavailable!";
  static const String error_ConfirmationHeading = "Please make sure you're searching for a valid word.";
  static const String error_Service = "Service";
  static const String error_InternetConfirmation = "Please make sure you're connected to the Internet.";
  static const String error_tapTotRefresh = "Tap to refresh";

  //no internet page constants
  static const String noInternetPage_MainHeading = "Service Unavailable";
  static const String noInternetPage_SubHeading = "Please make sure you are connected to the Internet.";
  static const String noInternetPage_Refresh = "Tap here to refresh";

  //navigational constants
  static const String navClose = "Close";
  static const String navAbout = "About";
  static const String navBack = "Back";
  static const String navMore = "More";

  //three pointer popup constants
  static const String popupSwitchToDetailedView = "Switch to Detailed View";
  static const String popupSwitchToSimpleView = "Switch to Simple View";
  static const String popupSwitchToLightMode = "Switch to Light Mode";
  static const String popupSwitchToDarkMode = "Switch to Dark Mode";
  static const String popupShare = "Share";
  static const String popupAbout = "About";
}

final TextStyle kNavTextStyle = GoogleFonts.montserrat(
  fontSize: 10.sp,
  fontWeight: FontWeight.normal,
  color: AppColors.appBlack,
);

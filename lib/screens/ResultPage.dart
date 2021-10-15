import 'package:clean_dictionary/constants/app_colors.dart';
import 'package:clean_dictionary/constants/app_constants.dart';
import 'package:clean_dictionary/screens/AboutPage.dart';
import 'package:clean_dictionary/widgets/detailed_result/detailed_result.dart';
import 'package:clean_dictionary/widgets/simple_result/simple_result.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool _isSimple = true;

  void handlePopUpClick(String value) {
    print(value);
    switch (value) {
      case AppConstants.popupSwitchToDetailedView:
        setState(() {
          _isSimple = false;
        });
        break;
      case AppConstants.popupSwitchToDarkMode:
        break;
      case AppConstants.popupShare:
        break;
      case AppConstants.popupAbout:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AboutPage()),
        );
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
          onTap: () => Navigator.pop(context),
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
      body: _isSimple ? simpleResult(context) : detailedResult(context),
    );
  }
}

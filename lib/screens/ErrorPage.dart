import 'package:clean_dictionary/constants/app_constants.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ErrorPage extends StatelessWidget {
  final statusCode;

  ErrorPage({this.statusCode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        // backgroundColor: Colors.white,
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
                  style: GoogleFonts.montserrat(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
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
                        statusCode == "500" ? AppConstants.error_Service : AppConstants.error_Word,
                        style: GoogleFonts.playfairDisplay(
                          color: Theme.of(context).primaryColor,
                          fontSize: 36.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // SizedBox(height: 24.0),
                      Text(
                        AppConstants.error_Unavailable,
                        style: GoogleFonts.playfairDisplay(
                          color: Theme.of(context).primaryColor,
                          fontSize: 36.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 24.0),
                      Text(
                        statusCode == "500" ? AppConstants.error_InternetConfirmation : AppConstants.error_ConfirmationHeading,
                        style: GoogleFonts.montserrat(
                          color: Theme.of(context).accentColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 32.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

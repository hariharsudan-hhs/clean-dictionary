import 'package:clean_dictionary/constants/app_constants.dart';
import 'package:clean_dictionary/widgets/history.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class RecentsPage extends StatefulWidget {
  final List<String> recentHistory;

  RecentsPage({required this.recentHistory});

  @override
  State<RecentsPage> createState() => _RecentsPageState();
}

class _RecentsPageState extends State<RecentsPage> {
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(
        "Cancel",
        style: GoogleFonts.montserrat(
          fontSize: 10.sp,
          fontWeight: FontWeight.normal,
          color: Theme.of(context).primaryColor,
          height: 1.4,
        ),
      ),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Theme.of(context).canvasColor),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget clearAllButton = TextButton(
      child: Text(
        "Clear All",
        style: GoogleFonts.montserrat(
          fontSize: 10.sp,
          fontWeight: FontWeight.normal,
          color: Theme.of(context).primaryColor,
          height: 1.4,
        ),
      ),
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Theme.of(context).canvasColor),
      ),
      onPressed: () {
        clearAll(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Clean Dictionary",
        style: GoogleFonts.montserrat(
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
          height: 1.4,
        ),
      ),
      content: Text(
        "Are you sure you want to clear all recent searches?",
        style: GoogleFonts.montserrat(
          fontSize: 10.sp,
          fontWeight: FontWeight.normal,
          color: Theme.of(context).primaryColor,
          height: 1.4,
        ),
      ),
      actions: [
        cancelButton,
        clearAllButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void clearAll(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    showAlertDialog(context);
    await prefs.clear();
    print(prefs.getStringList("history").toString());
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        // backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
        leadingWidth: 100.0,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () => Navigator.of(context).popUntil((route) => route.isFirst),
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppConstants.navBack,
                style: GoogleFonts.montserrat(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              showAlertDialog(context);
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                child: Text(
                  AppConstants.navClearAll,
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
      body: Container(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
        child: DelayedDisplay(
          delay: Duration(milliseconds: 300),
          fadingDuration: Duration(milliseconds: 300),
          slidingBeginOffset: const Offset(0.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppConstants.searchPage_SubHeading,
                style: GoogleFonts.playfairDisplay(
                  color: Theme.of(context).primaryColor,
                  fontSize: 36.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24.0),
              history(context, widget.recentHistory, widget.recentHistory.length, true),
            ],
          ),
        ),
      ),
    );
  }
}

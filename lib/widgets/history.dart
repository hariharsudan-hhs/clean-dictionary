import 'package:clean_dictionary/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Widget history(BuildContext context, List<String> recentHistory) {
  print(recentHistory.toString());
  return Expanded(
    child: recentHistory.length > 0
        ? ListView.builder(
            physics: new NeverScrollableScrollPhysics(),
            itemCount: recentHistory.length > 5 ? 5 : recentHistory.length,
            itemBuilder: (context, item) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
                child: Text(
                  recentHistory[item],
                  style: GoogleFonts.montserrat(
                    color: Theme.of(context).accentColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.normal,
                    height: 1.4,
                  ),
                ),
              );
            })
        : Text(
            AppConstants.searchPage_EmptyRecents,
            style: GoogleFonts.montserrat(
              fontSize: 12.sp,
              fontWeight: FontWeight.normal,
              color: Theme.of(context).accentColor,
              height: 1.4,
            ),
          ),
  );
}

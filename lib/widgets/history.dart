import 'package:clean_dictionary/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Widget history(BuildContext context, List<String> recentHistory, int count, bool scrollProperty) {
  var reversedList = recentHistory.reversed.toList();
  return Expanded(
    child: recentHistory.length > 0
        ? ListView.separated(
            physics: scrollProperty ? new BouncingScrollPhysics() : new NeverScrollableScrollPhysics(),
            itemCount: count,
            itemBuilder: (context, item) {
              return Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                child: Text(
                  reversedList[item],
                  style: GoogleFonts.montserrat(
                    color: Theme.of(context).accentColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.normal,
                    height: 1.4,
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => Divider(height: 28.0),
          )
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

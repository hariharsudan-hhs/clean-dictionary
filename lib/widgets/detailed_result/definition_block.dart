import 'package:clean_dictionary/constants/app_constants.dart';
import 'package:clean_dictionary/models/result_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Widget definitionBlock(BuildContext context, List<Definitions> definitions) {
  return Container(
    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppConstants.detailedPage_Definitions.toUpperCase(),
          style: GoogleFonts.montserrat(
            color: Theme.of(context).primaryColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.0),
        ListView.builder(
            physics: new NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: definitions.length > 2 ? 2 : definitions.length,
            itemBuilder: (context, mainItem) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (mainItem + 1).toString() + ".",
                    style: GoogleFonts.montserrat(
                      color: Theme.of(context).primaryColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        definitions[mainItem].definition != null
                            ? Text(
                                definitions[mainItem].definition,
                                style: GoogleFonts.montserrat(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w300,
                                  height: 1.4,
                                ),
                              )
                            : Container(),
                        definitions[mainItem].definition != null ? SizedBox(height: 16.0) : Container(),
                        definitions[mainItem].example != null
                            ? Text(
                                "\"" + definitions[mainItem].example + "\"",
                                style: GoogleFonts.montserrat(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w300,
                                  height: 1.4,
                                ),
                              )
                            : Container(),
                        definitions[mainItem].example != null ? SizedBox(height: 16.0) : Container(),
                        Wrap(
                          spacing: 24.0,
                          runSpacing: 8.0,
                          children: List.generate(
                            definitions[mainItem].synonyms.length > 6 ? 6 : definitions[mainItem].synonyms.length,
                            (index) => Text(
                              definitions[mainItem].synonyms[index]!,
                              style: GoogleFonts.montserrat(
                                color: Theme.of(context).primaryColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.italic,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 32.0),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ],
    ),
  );
}

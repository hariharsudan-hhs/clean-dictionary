import 'package:clean_dictionary/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Widget searchBox(BuildContext context, TextEditingController controller) {
  return Container(
    color: Colors.white,
    child: TextField(
      cursorHeight: 22.0,
      cursorWidth: 1.4,
      controller: controller,
      autofocus: false,
      cursorColor: AppColors.appBlack,
      style: GoogleFonts.montserrat(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: AppColors.appBlack,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: AppColors.appGrey),
        suffixIcon: AnimatedOpacity(
          opacity: controller.text.isNotEmpty ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 200),
          child: GestureDetector(
            onTap: () {
              if (controller.text.isNotEmpty) controller.clear();
            },
            child: Icon(Icons.clear, color: AppColors.appGrey),
          ),
        ),
        filled: true,
        fillColor: AppColors.appLightGrey,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: "search here",
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
  );
}

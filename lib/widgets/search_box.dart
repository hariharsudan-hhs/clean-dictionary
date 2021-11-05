import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Widget searchBox(BuildContext context, TextEditingController controller) {
  return Container(
    // color: Colors.white,
    child: TextField(
      cursorHeight: 22.0,
      cursorWidth: 1.4,
      controller: controller,
      autofocus: false,
      cursorColor: Theme.of(context).primaryColor,
      style: GoogleFonts.montserrat(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: Theme.of(context).primaryColor,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: Theme.of(context).accentColor),
        suffixIcon: AnimatedOpacity(
          opacity: controller.text.isNotEmpty ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 200),
          child: GestureDetector(
            onTap: () {
              if (controller.text.isNotEmpty) controller.clear();
            },
            child: Icon(Icons.clear, color: Theme.of(context).accentColor),
          ),
        ),
        filled: true,
        fillColor: Theme.of(context).canvasColor,
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

import 'dart:developer';

import 'package:clean_dictionary/constants/app_colors.dart';
import 'package:clean_dictionary/constants/app_constants.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sizer/sizer.dart';

class SimpleResult extends StatefulWidget {
  final String word;
  final String phonetic;
  final String phoneticAudio;
  final String partOfSpeech;
  final String definition;

  SimpleResult({required this.word, required this.phonetic, required this.phoneticAudio, required this.partOfSpeech, required this.definition});

  @override
  _SimpleResultState createState() => _SimpleResultState();
}

class _SimpleResultState extends State<SimpleResult> {
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    audioPlayer = AudioPlayer();
    super.initState();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void handlePhoneticAudio() async {
    final url = "https:" + widget.phoneticAudio;
    try {
      await audioPlayer.setUrl(url);
      audioPlayer.play();
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
      child: Container(
        child: DelayedDisplay(
          delay: Duration(milliseconds: 300),
          fadingDuration: Duration(milliseconds: 300),
          slidingBeginOffset: const Offset(0.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.word.isNotEmpty ? widget.word : AppConstants.resultDefault,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.appBlack,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "[" + (widget.phonetic.isNotEmpty ? widget.phonetic : AppConstants.resultDefault) + "]",
                          style: GoogleFonts.notoSerif(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w200,
                            color: AppColors.appBlack,
                          ),
                        ),
                        (widget.phoneticAudio != AppConstants.detailedPage_EmptyResult)
                            ? IconButton(
                                splashRadius: 24.0,
                                padding: const EdgeInsets.only(top: 4.0),
                                onPressed: () => handlePhoneticAudio(),
                                icon: Icon(
                                  Icons.volume_up,
                                  color: AppColors.appBlack,
                                  size: 24.0,
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    SizedBox(height: 24.0),
                  ],
                ),
              ),
              Flexible(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 24.h,
                    child: SingleChildScrollView(
                      physics: new BouncingScrollPhysics(),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                                bottom: 8.0,
                              ),
                              child: Text(
                                widget.partOfSpeech.isNotEmpty ? widget.partOfSpeech : AppConstants.detailedPage_EmptyResult,
                                style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.appGrey,
                                  height: 1.4,
                                ),
                              ),
                            ),
                            Divider(
                              thickness: 2.0,
                              color: AppColors.appLightGrey,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                                bottom: 8.0,
                              ),
                              child: Text(
                                widget.definition.isNotEmpty ? widget.definition : AppConstants.detailedPage_EmptyResult,
                                style: GoogleFonts.montserrat(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.appGrey,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

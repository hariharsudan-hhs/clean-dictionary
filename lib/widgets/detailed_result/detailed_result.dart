import 'dart:developer';

import 'package:clean_dictionary/constants/app_colors.dart';
import 'package:clean_dictionary/constants/app_constants.dart';
import 'package:clean_dictionary/models/result_model.dart';
import 'package:clean_dictionary/widgets/detailed_result/definition_block.dart';
import 'package:clean_dictionary/widgets/detailed_result/meanings_block.dart';
import 'package:clean_dictionary/widgets/detailed_result/origin_block.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sizer/sizer.dart';

class DetailedResult extends StatefulWidget {
  final String word;
  final String phonetic;
  final String phoneticAudio;
  final String origin;
  final String partOfSpeech;
  final List<Definitions> definitions;

  DetailedResult(
      {required this.word, required this.phonetic, required this.phoneticAudio, required this.origin, required this.partOfSpeech, required this.definitions});

  @override
  _DetailedResultState createState() => _DetailedResultState();
}

class _DetailedResultState extends State<DetailedResult> {
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
    final List<String> synonymList = [];
    final List<String> antonymList = [];

    widget.definitions.forEach((element) {
      for (String synonym in element.synonyms) {
        synonymList.add(synonym);
      }
      for (String antonym in element.antonyms) {
        antonymList.add(antonym);
      }
    });

    return SingleChildScrollView(
      physics: new BouncingScrollPhysics(),
      child: DelayedDisplay(
        delay: Duration(milliseconds: 300),
        fadingDuration: Duration(milliseconds: 300),
        slidingBeginOffset: const Offset(0.0, 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.0),
                  RichText(
                    text: TextSpan(
                        text: widget.word.isNotEmpty ? widget.word : AppConstants.resultDefault,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 36.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.appBlack,
                        ),
                        children: [
                          TextSpan(
                            text: widget.partOfSpeech.isNotEmpty ? " (" + widget.partOfSpeech + ")" : "",
                            style: GoogleFonts.montserrat(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300,
                              color: AppColors.appGrey,
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "[" + (widget.phonetic.isNotEmpty ? widget.phonetic : AppConstants.resultDefault) + "]",
                        style: GoogleFonts.notoSerif(
                          fontSize: 16.sp,
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
                ],
              ),
            ),
            SizedBox(height: 40.0),
            definitionBlock(context, widget.definitions),
            SizedBox(height: 8.0),
            Container(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      meaningsBlock(context, AppConstants.detailedPage_Synonyms, synonymList),
                      SizedBox(width: 8.0),
                      meaningsBlock(context, AppConstants.detailedPage_Antonyms, antonymList),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.0),
            originBlock(context, widget.origin),
          ],
        ),
      ),
    );
  }
}

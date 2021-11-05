import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:clean_dictionary/constants/app_constants.dart';
import 'package:clean_dictionary/models/result_model.dart';
import 'package:clean_dictionary/screens/AboutPage.dart';
import 'package:clean_dictionary/transition/FadeRoute.dart';
import 'package:clean_dictionary/widgets/detailed_result/detailed_result.dart';
import 'package:clean_dictionary/widgets/simple_result/simple_result.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ResultPage extends StatefulWidget {
  late final ResultModel resultModel;

  ResultPage({required this.resultModel});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool _isSimple = true;
  // late SimpleModel simpleModel;
  // late DetailedModel detailedModel;
  late String word;
  late String phonetic;
  late String phoneticAudio;
  late String origin;
  late String partOfSpeech;
  late String simpleDefinition;
  late List<Definitions> definitions = [];

  void handlePopUpClick(String value) {
    switch (value) {
      case AppConstants.popupSwitchToDetailedView:
        setState(() {
          _isSimple = false;
        });
        break;
      case AppConstants.popupSwitchToSimpleView:
        setState(() {
          _isSimple = true;
        });
        break;
      case AppConstants.popupSwitchToDarkMode:
        AdaptiveTheme.of(context).setDark();
        break;
      case AppConstants.popupSwitchToLightMode:
        AdaptiveTheme.of(context).setLight();
        break;
      case AppConstants.popupShare:
        break;
      case AppConstants.popupAbout:
        Navigator.push(context, FadeRoute(page: AboutPage()));
        break;
    }
  }

  void buildContent() {
    final result = widget.resultModel;

    word = result.word ?? AppConstants.detailedPage_EmptyResult;
    phonetic = result.phonetic ?? AppConstants.detailedPage_EmptyResult;
    phoneticAudio = result.phonetics[0].audio ?? AppConstants.detailedPage_EmptyResult;
    origin = result.origin ?? AppConstants.detailedPage_EmptyResult;
    partOfSpeech = result.meanings[0].partOfSpeech ?? AppConstants.detailedPage_EmptyResult;
    simpleDefinition = result.meanings[0].definitions[0].definition ?? AppConstants.detailedPage_EmptyResult;
    print(phoneticAudio);
    // final example = result.meanings[0].definitions[0].example;
    // final List<String> synonyms = result.meanings[0].definitions[0].synonyms;
    // final List<String> antonyms = result.meanings[0].definitions[0].antonyms;

    definitions = result.meanings[0].definitions ?? [];

    // simpleModel = new SimpleModel(word, phonetic, partOfSpeech, definition);
    // detailedModel = new DetailedModel(word, phonetic, partOfSpeech, definitions, origin);
  }

  @override
  void initState() {
    buildContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0.0,
        leadingWidth: 100.0,
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
          PopupMenuButton<String>(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                child: Text(
                  AppConstants.navMore,
                  style: GoogleFonts.montserrat(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            // icon: Icon(
            //   Icons.more_vert,
            //   color: AppColors.appBlack,
            //   size: 28.0,
            // ),
            onSelected: handlePopUpClick,
            itemBuilder: (BuildContext context) {
              var _isLight = AdaptiveTheme.of(context).mode.isLight;
              print(AdaptiveTheme.of(context).mode.isLight);
              return {
                _isSimple ? AppConstants.popupSwitchToDetailedView : AppConstants.popupSwitchToSimpleView,
                // ignore: unrelated_type_equality_checks
                _isLight ? AppConstants.popupSwitchToDarkMode : AppConstants.popupSwitchToLightMode,
                AppConstants.popupShare,
                AppConstants.popupAbout,
              }.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(
                    choice,
                    style: GoogleFonts.montserrat(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: _isSimple
          ? SimpleResult(
              word: word,
              phonetic: phonetic,
              phoneticAudio: phoneticAudio,
              partOfSpeech: partOfSpeech,
              definition: simpleDefinition,
            )
          : DetailedResult(
              word: word,
              phonetic: phonetic,
              phoneticAudio: phoneticAudio,
              origin: origin,
              partOfSpeech: partOfSpeech,
              definitions: definitions,
            ),
    );
  }
}

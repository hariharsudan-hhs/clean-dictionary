import 'package:clean_dictionary/constants/app_colors.dart';
import 'package:clean_dictionary/constants/app_constants.dart';
import 'package:clean_dictionary/models/result_model.dart';
import 'package:clean_dictionary/screens/AboutPage.dart';
import 'package:clean_dictionary/widgets/detailed_result/detailed_result.dart';
import 'package:clean_dictionary/widgets/simple_result/simple_result.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  late String origin;
  late String partOfSpeech;
  late String simpleDefinition;
  late List<Definitions> definitions = [];

  void handlePopUpClick(String value) {
    print(value);
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
        break;
      case AppConstants.popupShare:
        break;
      case AppConstants.popupAbout:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AboutPage()),
        );
        break;
    }
  }

  void buildContent() {
    final result = widget.resultModel;

    word = result.word;
    phonetic = result.phonetic;
    origin = result.origin;
    partOfSpeech = result.meanings[0].partOfSpeech;
    simpleDefinition = result.meanings[0].definitions[0].definition;
    // final example = result.meanings[0].definitions[0].example;
    // final List<String> synonyms = result.meanings[0].definitions[0].synonyms;
    // final List<String> antonyms = result.meanings[0].definitions[0].antonyms;

    definitions = result.meanings[0].definitions;

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                style: kNavTextStyle,
              ),
            ),
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(
              Icons.more_vert,
              color: AppColors.appBlack,
              size: 28.0,
            ),
            onSelected: handlePopUpClick,
            itemBuilder: (BuildContext context) {
              return {
                _isSimple ? AppConstants.popupSwitchToDetailedView : AppConstants.popupSwitchToSimpleView,
                AppConstants.popupSwitchToDarkMode,
                AppConstants.popupShare,
                AppConstants.popupAbout,
              }.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(
                    choice,
                    style: GoogleFonts.montserrat(
                      color: AppColors.appBlack,
                    ),
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: _isSimple
          ? simpleResult(
              context,
              word,
              phonetic,
              partOfSpeech,
              simpleDefinition,
            )
          : DetailedResult(
              word: word,
              phonetic: phonetic,
              origin: origin,
              partOfSpeech: partOfSpeech,
              definitions: definitions,
            ),
    );
  }
}

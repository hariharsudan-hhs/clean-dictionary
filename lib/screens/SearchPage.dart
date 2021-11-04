import 'package:clean_dictionary/animation/ShakeWidget.dart';
import 'package:clean_dictionary/api/DictionaryApi.dart';
import 'package:clean_dictionary/constants/app_colors.dart';
import 'package:clean_dictionary/constants/app_constants.dart';
import 'package:clean_dictionary/models/result_model.dart';
import 'package:clean_dictionary/screens/AboutPage.dart';
import 'package:clean_dictionary/screens/ErrorPage.dart';
import 'package:clean_dictionary/transition/FadeRoute.dart';
import 'package:clean_dictionary/widgets/search_box.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'ResultPage.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  DictionaryApi dictionaryApi = new DictionaryApi();
  final List<String> sampleRecent = ["Ambitious", "Gambling", "Human", "Problem"];
  TextEditingController controller = new TextEditingController();
  bool isLoading = false;

  final shakeKey = GlobalKey<ShakeWidgetState>();

  void handleSearch() {
    final searchText = controller.text.trim();
    if (searchText.contains(" ")) searchText.replaceAll(" ", "%20");
    fetchResultApi(searchText);
  }

  fetchResultApi(String searchText) async {
    // try {
    //   final response = await Dio().get(AppConstants.apiEndpoint + searchText);
    //   ResultModel resultModel = ResultModel.fromJson(response.data[0]);
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => ResultPage(resultModel: resultModel)),
    //   );
    //   isLoading = false;
    // } catch (e) {
    //   print(e);
    // }
    try {
      List<ResultModel> response = await dictionaryApi.fetchAll(searchText);
      ResultModel resultModel = response[0];
      isLoading = false;
      // Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(resultModel: resultModel)));
      Navigator.push(context, FadeRoute(page: ResultPage(resultModel: resultModel)));
      isLoading = false;
    } catch (e) {
      print(e.toString());
      isLoading = false;
      Navigator.push(context, FadeRoute(page: ErrorPage(statusCode: e.toString())));
    }
  }

  bool isPortrait() {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: isLoading
          ? Scaffold(
              backgroundColor: Colors.white,
              body: DelayedDisplay(
                delay: Duration(milliseconds: 150),
                fadingDuration: Duration(milliseconds: 300),
                slidingBeginOffset: const Offset(0.0, 0.0),
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.appBlack,
                  ),
                ),
              ),
            )
          : Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                automaticallyImplyLeading: false,
                actions: [
                  InkWell(
                    //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage())),
                    onTap: () => Navigator.push(context, FadeRoute(page: AboutPage())),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                        child: Text(
                          AppConstants.navAbout,
                          style: kNavTextStyle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                physics: new BouncingScrollPhysics(),
                child: DelayedDisplay(
                  delay: Duration(milliseconds: 300),
                  fadingDuration: Duration(milliseconds: 300),
                  slidingBeginOffset: const Offset(0.0, 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                        height: isPortrait() ? 50.h : 30.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            isPortrait() ? SizedBox(height: 10.h) : SizedBox(height: 0.h),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppConstants.searchPage_MainHeading,
                                  style: GoogleFonts.playfairDisplay(
                                    fontSize: 36.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 24.0),
                                Container(
                                  height: 64.0,
                                  child: ShakeWidget(
                                      // 4. pass the GlobalKey as an argument
                                      key: shakeKey,
                                      // 5. configure the animation parameters
                                      shakeCount: 3,
                                      shakeOffset: 10,
                                      shakeDuration: Duration(milliseconds: 500),
                                      // 6. Add the child widget that will be animated
                                      child: searchBox(context, controller)),
                                ),
                                SizedBox(height: 8.0),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: TextButton(
                                    onPressed: () {
                                      if (controller.text.length > 0) {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        handleSearch();
                                      } else {
                                        shakeKey.currentState?.shake();
                                      }
                                    },
                                    child: Text(
                                      AppConstants.searchPage_SearchButtonText,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.appBlack,
                                        height: 1.4,
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all(AppColors.appLightGrey),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            isPortrait() ? SizedBox(height: 8.h) : SizedBox(height: 2.h),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                        height: 30.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppConstants.searchPage_SubHeading,
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Expanded(
                              child: ListView.builder(
                                  physics: new NeverScrollableScrollPhysics(),
                                  itemCount: sampleRecent.length,
                                  itemBuilder: (context, item) {
                                    return Container(
                                      margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
                                      child: Text(
                                        sampleRecent[item],
                                        style: GoogleFonts.montserrat(
                                          color: AppColors.appGrey,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.normal,
                                          height: 1.4,
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

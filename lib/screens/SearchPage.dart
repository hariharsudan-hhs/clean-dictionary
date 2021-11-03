import 'package:clean_dictionary/api/DictionaryApi.dart';
import 'package:clean_dictionary/constants/app_colors.dart';
import 'package:clean_dictionary/constants/app_constants.dart';
import 'package:clean_dictionary/models/result_model.dart';
import 'package:clean_dictionary/screens/AboutPage.dart';
import 'package:clean_dictionary/screens/ErrorPage.dart';
import 'package:clean_dictionary/widgets/search_box.dart';
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
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultPage(resultModel: resultModel)),
      );
      isLoading = false;
    } catch (e) {
      print(e.toString());
      isLoading = false;
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ErrorPage(
                  statusCode: e.toString(),
                )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: isLoading
          ? Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: CircularProgressIndicator(
                  color: AppColors.appBlack,
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
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutPage()),
                    ),
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
              body: Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
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
                            child: searchBox(context, controller),
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
                      SizedBox(height: 6.h),
                      Expanded(
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
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

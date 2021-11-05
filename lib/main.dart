// @dart=2.11

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:clean_dictionary/constants/app_colors.dart';
import 'package:clean_dictionary/screens/SearchPage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode savedThemeMode;

  const MyApp({Key key, this.savedThemeMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return AdaptiveTheme(
        light: ThemeData(
          appBarTheme: AppBarTheme(
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Colors.white,
            foregroundColor: AppColors.appBlack,
            iconTheme: IconThemeData(
              color: AppColors.appBlack,
            ),
            textTheme: TextTheme(
              button: TextStyle(
                color: AppColors.appBlack,
              ),
              headline6: TextStyle(
                color: AppColors.appBlack,
              ),
            ),
          ),
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white,
          primaryColor: AppColors.appBlack,
          accentColor: AppColors.appGrey,
          backgroundColor: Colors.white,
          canvasColor: AppColors.appLightGrey,
        ),
        dark: ThemeData(
          appBarTheme: AppBarTheme(
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Colors.black,
            foregroundColor: AppColors.appGrey,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            textTheme: TextTheme(
              button: TextStyle(
                color: Colors.white,
              ),
              headline6: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black,
          primaryColor: Colors.white,
          accentColor: AppColors.appGrey,
          backgroundColor: Colors.black,
          canvasColor: AppColors.appDarkGrey,
        ),
        initial: savedThemeMode ?? AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp(
          title: 'Clean Dictionary',
          debugShowCheckedModeBanner: false,
          theme: theme,
          darkTheme: darkTheme,
          home: SearchPage(),
        ),
      );
    });
  }
}

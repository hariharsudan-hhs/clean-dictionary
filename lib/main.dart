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
            foregroundColor: Colors.black,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            textTheme: TextTheme(
              button: TextStyle(
                color: Colors.black,
              ),
              headline6: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.black,
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

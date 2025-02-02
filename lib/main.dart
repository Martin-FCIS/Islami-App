import 'package:flutter/material.dart';
import 'package:islami_app/screens/layout/hadth/hadeth_details.dart';
import 'package:islami_app/screens/layout/layout_screen.dart';
import 'package:islami_app/screens/layout/quran/sura_details.dart';
import 'package:islami_app/screens/splash/splash_screen.dart';

import 'core/themes/appcolors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppColors.WhiteCoffe,
          textTheme: TextTheme(
            bodySmall: TextStyle(fontSize: 14,color: AppColors.Black,fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(fontSize: 16,color: AppColors.Black,fontWeight: FontWeight.bold),
            bodyLarge: TextStyle(fontSize: 18,color: AppColors.Black,fontWeight: FontWeight.bold),
          ),
        bottomNavigationBarTheme:  BottomNavigationBarThemeData(
          backgroundColor: AppColors.WhiteCoffe,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
        )
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.brown,
        textTheme: TextTheme(
          bodySmall: TextStyle(fontSize: 14,color: AppColors.White,fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 16,color: AppColors.White,fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 18,color: AppColors.White,fontWeight: FontWeight.bold),
        ),
    bottomNavigationBarTheme:  BottomNavigationBarThemeData(
    backgroundColor: Colors.brown,
    type: BottomNavigationBarType.fixed,
    showUnselectedLabels: false,
      )),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routes: {
        LayoutScreen.routeName: (context) => LayoutScreen(),
        SplashScreen.routeName: (context) => SplashScreen(),
        SuraDetails.routeName: (context) => SuraDetails(),
        HadethDetails.routeName: (context) => HadethDetails(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}

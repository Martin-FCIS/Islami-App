import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/app_assets.dart';
import 'package:islami_app/core/themes/appcolors.dart';
import 'package:islami_app/screens/layout/hadth/hadth_screen.dart';
import 'package:islami_app/screens/layout/quran/quran_screen.dart';
import 'package:islami_app/screens/layout/widgets/custom_bttm_nav_item.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  static const String routeName = "Layout";

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedIndex = 0;
  List<Widget> Screens = [
    QuranScreen(),
    HadthScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: FadeInUpBig(
          delay: Duration(seconds:2 ),
        child: BottomNavigationBar(
            onTap: (value) {
              selectedIndex = value;
              setState(() {});
            },
            backgroundColor: AppColors.WhiteCoffe,
            type: BottomNavigationBarType.fixed,
            fixedColor: AppColors.White,
            showUnselectedLabels: false,
            currentIndex: selectedIndex,
            items: [
              BottomNavigationBarItem(
                  icon: CustomBttmNavItem(
                      icon: AppAssets.QuranIcon,
                      isSelected: selectedIndex == 0),
                  label: "Quran"),
              BottomNavigationBarItem(
                  icon: CustomBttmNavItem(
                      icon: AppAssets.AdhanIcon,
                      isSelected: selectedIndex == 1),
                  label: "Adhan"),
              BottomNavigationBarItem(
                  icon: CustomBttmNavItem(
                      icon: AppAssets.SebhaIcon,
                      isSelected: selectedIndex == 2),
                  label: "Sebha"),
              BottomNavigationBarItem(
                  icon: CustomBttmNavItem(
                      icon: AppAssets.RadioIcon,
                      isSelected: selectedIndex == 3),
                  label: "Radio"),
              BottomNavigationBarItem(
                  icon: CustomBttmNavItem(
                      icon: AppAssets.SurahIcon,
                      isSelected: selectedIndex == 4),
                  label: "Surah"),
            ]),
      ),
      body: Screens[selectedIndex],
    );
  }
}

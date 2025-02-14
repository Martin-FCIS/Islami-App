import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/themes/appcolors.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  List<String> tasbeehList = [
    "سبحان الله",
    "الحمدلله",
    "الله اكبر",
  ];
  int counter = 0;
  late String tasbeeh = tasbeehList[0];
  double turns=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppAssets.sebhaBg), fit: BoxFit.cover),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.Black.withOpacity(0.7),
              AppColors.Black,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppAssets.HomeLogo),
                Text(
                  "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
                  style: TextStyle(
                      fontFamily: GoogleFonts.tajawal().fontFamily,
                      fontSize: 36,
                      color: AppColors.White,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        top: 0,
                        child: Image.asset(
                          AppAssets.sebhaHead,
                          height: MediaQuery.of(context).size.height * 0.12,
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.10,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                counter++;
                                turns=turns+(pi/33);
                                if (counter == 34) {
                                  tasbeeh = tasbeehList[
                                      tasbeehList.indexOf(tasbeeh) + 1 % 3];
                                  counter = 0;
                                }
                                setState(() {});
                              },
                              child: AnimatedRotation(
                                turns: turns,
                                duration: Duration(milliseconds: 500),
                                child: Image.asset(
                                  AppAssets.sebhaBody,
                                  width: MediaQuery.of(context).size.width * 0.8,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  tasbeeh,
                                  style: TextStyle(
                                    color: AppColors.White,
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 22,
                                ),
                                Text(
                                  counter.toString(),
                                  style: TextStyle(
                                    color: AppColors.White,
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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

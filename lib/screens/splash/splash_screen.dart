import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/app_assets.dart';
import 'package:islami_app/core/themes/appcolors.dart';
import 'package:islami_app/screens/layout/layout_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String routeName = "Splash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Black,
      body: Column(
        children: [
          const Spacer(),
          Center(
              child: Roulette(
                  duration: const Duration(seconds: 3),
                  onFinish: (direction) {
                    Navigator.pushReplacementNamed(
                        context, LayoutScreen.routeName);
                  },
                  child: Image.asset(AppAssets.islamiLogo))),
          const Spacer(),
          Center(child: FadeInUp(child: Image.asset(AppAssets.routeLogo))),
        ],
      ),
    );
  }
}

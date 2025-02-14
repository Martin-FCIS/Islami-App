import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/app_assets.dart';
import 'package:islami_app/core/themes/appcolors.dart';
import 'package:islami_app/screens/layout/layout_screen.dart';
import 'package:islami_app/screens/onboarding/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = "Splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? hasSeenOnboarding;

  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkOnboardingStatus();
  }

  Future<void> _checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;
    setState(() {});
  }

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
                    if (hasSeenOnboarding != null) {
                      Navigator.pushReplacementNamed(
                          context,
                          !hasSeenOnboarding!
                              ? OnboardingScreen.routeName
                              : LayoutScreen.routeName);
                    }
                  },
                  child: Image.asset(AppAssets.islamiLogo))),
          const Spacer(),
          Center(child: FadeInUp(child: Image.asset(AppAssets.routeLogo))),
        ],
      ),
    );
  }
}

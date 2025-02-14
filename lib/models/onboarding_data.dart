import 'package:islami_app/core/constants/app_assets.dart';

class OnboardingData {
  String image;
  String title;
  String? subTitle;

  OnboardingData({required this.image, required this.title, this.subTitle});

  static List<OnboardingData> data = [
    OnboardingData(
        image: AppAssets.readingOnboarding, title: "Welcome To Islmi App"),
    OnboardingData(
        image: AppAssets.kabbaOnboarding,
        title: "Welcome To Islami",
        subTitle: "We Are Very Excited To Have You In Our Community"),
    OnboardingData(
        image: AppAssets.welcomeOnboarding,
        title: "Reading the Quran",
        subTitle: "Read, and your Lord is the Most Generous"),
    OnboardingData(
        image: AppAssets.bearishOnboarding,
        title: "Bearish",
        subTitle: "Praise the name of your Lord, the Most High"),
    OnboardingData(
        image: AppAssets.radioOnboarding,
        title: "Holy Quran Radio",
        subTitle:
            "You can listen to the Holy Quran Radio through the application for free and easily"),
  ];
}

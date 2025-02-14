import 'package:flutter/material.dart';
import 'package:islami_app/core/themes/appcolors.dart';
import 'package:islami_app/models/onboarding_data.dart';
import 'package:islami_app/screens/layout/layout_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/app_assets.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  static const String routeName = "Onboarding";

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController();
  static int i = 0;

  @override
  Widget build(BuildContext context) {
    Widget? text;
    return Scaffold(
      backgroundColor: AppColors.Black,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              AppAssets.HomeLogo,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: OnboardingData.data.length,
                onPageChanged: (index) {
                  i = index;
                  setState(() {});
                },
                controller: controller,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      SizedBox(
                          width: double.infinity,
                          height: 400,
                          child: Image.asset(
                            OnboardingData.data[index].image,
                          )),
                      const Spacer(),
                      Text(
                        OnboardingData.data[index].title,
                        style: const TextStyle(
                            color: AppColors.WhiteCoffe,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          OnboardingData.data[index].subTitle ?? "",
                          style: const TextStyle(
                              color: AppColors.WhiteCoffe,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                print("------------------$index");
                                if (index > 0) {
                                  controller.previousPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.ease);
                                }
                              },
                              child: Text(
                                index == 0 ? " " : "Back",
                                style: const TextStyle(
                                    color: AppColors.WhiteCoffe),
                              ),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(5, (currIndex) {
                                return AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  height: 10,
                                  width: index == currIndex ? 25 : 10,
                                  decoration: BoxDecoration(
                                    color: index == currIndex
                                        ? Colors.amber
                                        : Colors.grey,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                );
                              }),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () async {
                                print("------------------$index");
                                if (index == OnboardingData.data.length - 1) {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  await prefs.setBool(
                                      'hasSeenOnboarding', true);
                                  Navigator.pushReplacementNamed(
                                      context, LayoutScreen.routeName);
                                } else {
                                  controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.ease);
                                }
                              },
                              child: text = Text(
                                index == OnboardingData.data.length - 1
                                    ? "Finish"
                                    : "Next",
                                style: const TextStyle(
                                    color: AppColors.WhiteCoffe),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

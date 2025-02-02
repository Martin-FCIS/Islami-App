import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/themes/appcolors.dart';
import 'package:islami_app/screens/layout/hadth/widgets/hadeth_card_widget.dart';
import '../../../core/constants/app_assets.dart';

class HadthScreen extends StatefulWidget {
  const HadthScreen({super.key});

  @override
  State<HadthScreen> createState() => _HadthScreenState();
}
class _HadthScreenState extends State<HadthScreen> {
  List<HadethData> ahadeth = [];

  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData();
  }
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppAssets.hadethBg), fit: BoxFit.cover),
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
          child: Column(
            children: [
                FadeInDown(
                  delay: Duration(seconds: 2),
                    child: Image.asset(AppAssets.HomeLogo)),
                if(ahadeth.isNotEmpty)
                  Expanded(
                  child: ZoomIn(
                    delay: Duration(seconds: 3),
                    child: CarouselSlider.builder(itemCount: 50, itemBuilder:(context, index, realIndex) {
                    return HadethCardWidget(hadethData: ahadeth[index]);
                                  }, options: CarouselOptions(
                    viewportFraction: 0.8,
                    height: double.infinity,
                      enlargeCenterPage: true,

                                  )
                                  ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  void readData() async {
    for (int i = 1; i <= 50; i++) {
      String fullData = await rootBundle.loadString("assets/Hadeeth/h$i.txt");
      String title = fullData.split("\n")[0];
      String body = fullData.split("\n")[1];
      ahadeth.add(HadethData(title, body));
    }
    setState(() {});
  }
}

class HadethData {
  String title;
  String body;

  HadethData(
    this.title,
    this.body,
  );
}

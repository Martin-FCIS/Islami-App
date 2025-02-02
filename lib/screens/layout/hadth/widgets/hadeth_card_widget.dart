import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/screens/layout/hadth/hadeth_details.dart';
import 'package:islami_app/screens/layout/hadth/hadth_screen.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/themes/appcolors.dart';

class HadethCardWidget extends StatelessWidget {
 final HadethData hadethData;

  HadethCardWidget({super.key, required this.hadethData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() {
        Navigator.pushNamed(context, HadethDetails.routeName,arguments: hadethData);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          color: AppColors.WhiteCoffe,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      FadeInLeft(
                          child: Image.asset(
                            AppAssets.SuraDetailsLeft,
                            color: AppColors.Black,
                          )),
                          Spacer(),
                      FadeInRight(
                          child: Image.asset(AppAssets.SuraDetailsRight,
                              color: AppColors.Black)),
                    ],
                  ),
                ),
                Expanded(child: Image.asset(AppAssets.hadethCardBg)),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                    child: Image.asset(AppAssets.SuraDetailsButtom,color: AppColors.Black,)),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Center(
                              child: FadeInDown(
                        child: Text(
                          hadethData.title,
                          style: TextStyle(
                              color: AppColors.Black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ))),
                    ],
                  ),
                  SizedBox(height: 40,),
                  Text(
                    hadethData.body,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.Black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

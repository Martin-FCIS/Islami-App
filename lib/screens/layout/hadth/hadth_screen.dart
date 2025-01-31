import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/themes/appcolors.dart';
import '../../../core/constants/app_assets.dart';

class HadthScreen extends StatelessWidget {
  const HadthScreen({super.key});

  @override
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
              Image.asset(AppAssets.HomeLogo),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.WhiteCoffe,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        FadeInLeft(child: Image.asset(AppAssets.SuraDetailsLeft,color: AppColors.Black,)),
                        Expanded(
                            child: Center(
                                child: FadeInDown(
                          child: Text(
                            " الحديث الاول",
                            style: TextStyle(
                                color: AppColors.Black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ))),
                        FadeInRight(child: Image.asset(AppAssets.SuraDetailsRight,color: AppColors.Black)),
                      ],
                    ),
                    Text(
                      " الحديث الاول",
                      style: TextStyle(
                          color: AppColors.Black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " الحديث الاول",
                      style: TextStyle(
                          color: AppColors.Black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " الحديث الاول",
                      style: TextStyle(
                          color: AppColors.Black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

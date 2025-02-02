import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/constants/app_assets.dart';
import 'package:islami_app/core/themes/appcolors.dart';
import 'package:islami_app/screens/layout/hadth/hadth_screen.dart';
import 'package:islami_app/screens/layout/quran/quran_screen.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = "HadethDetailes";

  HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute
        .of(context)!
        .settings
        .arguments as HadethData; //get data


    return Scaffold(
      backgroundColor: AppColors.Black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: AppColors.WhiteCoffe,
        ),
        title: FadeInDown(
          child: Text(
            arg.title,
            style: TextStyle(
                color: AppColors.WhiteCoffe,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              FadeInLeft(child: Image.asset(AppAssets.SuraDetailsLeft)),
              Expanded(
                  child: Center(
                      child: FadeInDown(
                        child: Text(
                          arg.title,
                          style: TextStyle(
                              color: AppColors.WhiteCoffe,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ))),
              FadeInRight(child: Image.asset(AppAssets.SuraDetailsRight)),
            ],
          ),
          SizedBox(height: 30,),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                arg.body,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.WhiteCoffe,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
           Spacer(),

           ZoomIn(child: Image.asset(AppAssets.SuraDetailsButtom)),
        ],
      ),
    );
  }
}

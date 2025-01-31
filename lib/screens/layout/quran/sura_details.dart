import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/constants/app_assets.dart';
import 'package:islami_app/core/themes/appcolors.dart';
import 'package:islami_app/screens/layout/quran/quran_screen.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "SuraDetailes";

  SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  String sura = "";
  List<String> suraList = [];

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as SuraData; //get data
    if (sura.isEmpty) {
      readFile(arg.index);
    }

    return Scaffold(
      backgroundColor: AppColors.Black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: AppColors.WhiteCoffe,
        ),
        title: FadeInDown(
          child: Text(
            arg.suraEn,
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
                  arg.suraAr,
                  style: TextStyle(
                      color: AppColors.WhiteCoffe,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ))),
              FadeInRight(child: Image.asset(AppAssets.SuraDetailsRight)),
            ],
          ),
          Expanded(
            child: suraList.isEmpty
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ZoomIn(
                    delay: Duration(seconds: 1),
                    child: ListView.builder(
                      itemCount: suraList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: AppColors.WhiteCoffe)),
                          child: Text(
                            textAlign: TextAlign.center,
                            "[${(index + 1).toString()}]" +
                                " " +
                                suraList[index],
                            style: TextStyle(color: AppColors.WhiteCoffe),
                          ),
                        );
                      },
                    ),
                  ),
          ),
          ZoomIn(child: Image.asset(AppAssets.SuraDetailsButtom)),
        ],
      ),
    );
  }

  void readFile(int index) async {
    sura = await rootBundle.loadString("assets/Suras/${index + 1}.txt");
    suraList = sura.trim().split("\n");
    setState(() {});
  }
}

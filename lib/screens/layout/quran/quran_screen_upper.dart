import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/models/app_data.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/themes/appcolors.dart';

class QuranScreenUpper extends StatefulWidget {
  final VoidCallback onSearch;
  QuranScreenUpper({super.key,required this.onSearch});

  @override
  State<QuranScreenUpper> createState() => _QuranScreenUpperState();
}

class _QuranScreenUpperState extends State<QuranScreenUpper> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInDown(
            delay: Duration(seconds: 2),
            child: Image.asset(AppAssets.HomeLogo)),
        ZoomIn(
          delay: Duration(seconds: 3),
          child: TextField(
            style: TextStyle(color: AppColors.White),
            onChanged: (value) {
              search(value);
            },
            decoration: InputDecoration(
              fillColor: AppColors.Black.withOpacity(0.5),
              filled: true,
              hintText: "Sura Name",
              hintStyle: TextStyle(
                color: AppColors.White,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              prefixIcon: ImageIcon(
                AssetImage(AppAssets.SearchIcon),
                color: AppColors.WhiteCoffe,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: AppColors.WhiteCoffe)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: AppColors.WhiteCoffe)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: AppColors.WhiteCoffe)),
            ),
          ),
        ),
      ],
    );
  }

  void search(String q) {
    var reg=RegExp("^[\u0621-\u064A\u0660-\u0669 ]+");
    AppData.ids.clear();
    if(reg.hasMatch(q)){
      AppData.arabicQuranSuras.where(
            (suraName) {
          if (suraName.toLowerCase().contains(q.toLowerCase())) {
            AppData.ids.add(AppData.englishQuranSurahs.indexOf(suraName));
          }
          // print(suraName);
          return true;
        },
      ).toList();
      widget.onSearch();
    }
    else {
      AppData.englishQuranSurahs.where(
            (suraName) {
          if (suraName.toLowerCase().contains(q.toLowerCase())) {
            AppData.ids.add(
                AppData.englishQuranSurahs.indexOf(suraName));
          }
          print(suraName);
          return true;
        },
      ).toList();

      widget.onSearch();
    }
  }
}

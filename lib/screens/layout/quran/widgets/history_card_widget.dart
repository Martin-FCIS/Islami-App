import 'package:flutter/material.dart';
import 'package:islami_app/screens/layout/quran/quran_screen.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/themes/appcolors.dart';
import '../sura_details.dart';

class HistoryCardWidget extends StatelessWidget {
  final SuraData sura;
   HistoryCardWidget({super.key,required this.sura});

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetails.routeName,arguments:sura);
      },
      child: Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColors.WhiteCoffe,
            borderRadius: BorderRadius.circular(20)
        ),
        child:Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sura.suraEn,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                Text(sura.suraAr,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                Text(sura.suraVerses + " Verses",),
              ],
            ),
            SizedBox(width: size.width*0.01,),
            Image.asset(AppAssets.suraCard,width: size.width*0.25,)

          ],
        ),
      ),
    );
  }
}

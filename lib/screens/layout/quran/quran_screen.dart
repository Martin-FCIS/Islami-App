import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/screens/layout/quran/quran_screen_upper.dart';
import 'package:islami_app/screens/layout/quran/sura_details.dart';
import 'package:islami_app/screens/layout/quran/widgets/history_card_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/themes/appcolors.dart';
import '../../../models/app_data.dart';

class QuranScreen extends StatefulWidget {
  QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  @override
  void initState() {
    // TODO: implement initState
    getHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppAssets.quranBg), fit: BoxFit.cover),
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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                QuranScreenUpper(
                  onSearch: () {
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                if (AppData.historyIds.isNotEmpty)
                  ZoomIn(
                    delay:  Duration(seconds: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Most Recently ",
                          style: TextStyle(
                              color: AppColors.White,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 110,
                          child: ListView.builder(
                            itemCount: AppData.historyIds.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              int indexUse = AppData.historyIds[index];
                              return HistoryCardWidget(
                                  sura: SuraData(
                                      suraAr: AppData.arabicQuranSuras[indexUse],
                                      suraEn:
                                          AppData.englishQuranSurahs[indexUse],
                                      index: indexUse,
                                      suraVerses: AppData.AyaNumber[indexUse]));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(
                  height: 15,
                ),
                ZoomIn(
                  delay: Duration(seconds: 4),
                  child: const Text(
                    "Suras List",
                    style: TextStyle(
                        color: AppColors.White,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: ZoomIn(
                    delay: Duration(seconds: 4),
                    child: ListView.separated(
                      itemCount:
                          AppData.ids.isNotEmpty ? AppData.ids.length : 114,
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemBuilder: (context, index) {
                        int indexUse =
                            AppData.ids.isNotEmpty ? AppData.ids[index] : index;
                        return InkWell(
                          onTap: () {
                            save(indexUse);
                            Navigator.pushNamed(
                                //store data
                                context,
                                SuraDetails.routeName,
                                arguments: SuraData(
                                    suraAr: AppData.arabicQuranSuras[indexUse],
                                    suraEn:
                                        AppData.englishQuranSurahs[indexUse],
                                    index: indexUse,
                                    suraVerses: AppData.AyaNumber[indexUse]));
                          },
                          child: Row(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  const ImageIcon(
                                    AssetImage(AppAssets.SuraNumberIcon),
                                    color: AppColors.White,
                                    size: 60,
                                  ),
                                  Text(
                                    (indexUse + 1).toString(),
                                    style:
                                        const TextStyle(color: AppColors.White),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppData.englishQuranSurahs[indexUse],
                                    style: const TextStyle(
                                        color: AppColors.White,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    AppData.AyaNumber[indexUse] + " Verses",
                                    style: const TextStyle(
                                        color: AppColors.White, fontSize: 16),
                                  )
                                ],
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  AppData.arabicQuranSuras[indexUse],
                                  style: const TextStyle(
                                      color: AppColors.White, fontSize: 24),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void save(int index) async { ///shared prefrences <save>
    List<String> idsString = [];
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    AppData.historyIds=AppData.historyIds.toSet().toList();
    if(AppData.historyIds.contains(index)){
      AppData.historyIds.remove(index);
    }
    AppData.historyIds.insert(0,index);
    for (int e in AppData.historyIds) {
      idsString.add(e.toString());
    }
    await prefs.setStringList("History", idsString);
    setState(() {});
  }

  void getHistory() async { ///shared prefrences <get>
    List<String> idsString = [];
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    idsString = prefs.getStringList("History") ?? [];
    for (String e in idsString) {
      AppData.historyIds.add(int.parse(e));
    }
    AppData.historyIds=AppData.historyIds.toSet().toList();
    setState(() {});
  }
}

class SuraData {
  String suraAr;
  String suraEn;
  int index;
  String suraVerses;

  SuraData(
      {required this.suraAr,
      required this.suraEn,
      required this.index,
      required this.suraVerses});
}

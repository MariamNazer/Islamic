import 'package:flutter/material.dart';
import 'package:islamic/tabs/quran/soura_content_screen.dart';

class QuranTab extends StatelessWidget {
  List<String> suraNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  QuranTab({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Image.asset(
            'assets/images/quran_header_icn.png',
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          Expanded(
              child: ListView.separated(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.01,
            ),
            //دي widget بتخليني اضيف on tap لأي widget غادي
            itemBuilder: (_, index) => GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(
                  SouraContentScreen.routName,
                  arguments: SouraContentArgs(
                      index: index, suraName: suraNames[index])),
              child: Text(
                suraNames[index],
                textAlign: TextAlign.center,
                //emportant!!
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            itemCount: suraNames.length,
            separatorBuilder: (_, __) => SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
          ))
        ],
      ),
    );
  }
}

class SouraContentArgs {
  String suraName;
  int index;
  SouraContentArgs({required this.index, required this.suraName});
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/tabs/hadeth/hadeth.dart';
import 'package:islamic/tabs/hadeth/hadeth_content_screen.dart';
import 'package:islamic/widgets/load_indicator.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (ahadeth.isEmpty) {
      loadHadithFile();
    }
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Image.asset(
            'assets/images/hadith_logo.png',
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          Expanded(
              child: ahadeth.isEmpty
                  ? const LoadIndicator()
                  : ListView.separated(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01,
                      ),
                      //دي widget بتخليني اضيف on tap لأي widget عادي
                      itemBuilder: (_, index) => GestureDetector(
                        onTap: () => Navigator.of(context).pushNamed(
                            HadethContentScreen.routName,
                            arguments: ahadeth[index]),
                        child: Text(
                          ahadeth[index].title,
                          textAlign: TextAlign.center,
                          //emportant!!
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      itemCount: ahadeth.length,
                      //بستخدمه عشان افصل بين ال list واللي قبلها
                      separatorBuilder: (_, __) => SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                    ))
        ],
      ),
    );
  }

  Future<void> loadHadithFile() async {
    String ahadethFileContent =
        await rootBundle.loadString('assets/text/ahadeth.txt');
    List<String> ahadethStrings = ahadethFileContent.split(
        '#'); //بستخدم الsplit عشان اقسم ال text عندي بناءا على حاجة معينة انا بحددها
    ahadeth = ahadethStrings.map((hadethString) {
      //دي بتلف على اللستة كلها عشان تحولها لتايب تاني مثلا
      List<String> hadethLines = hadethString.trim().split('\n');
      String title = hadethLines.first;
      hadethLines.removeAt(0);
      List<String> content = hadethLines;
      return Hadeth(content, title);
    }).toList();
    setState(() {});
  }
}

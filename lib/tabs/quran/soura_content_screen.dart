import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/tabs/quran/quran_tab.dart';
import 'package:islamic/widgets/load_indicator.dart';

class SouraContentScreen extends StatefulWidget {
  static const String routName = '/soura-content';

  @override
  State<SouraContentScreen> createState() => _SouraContentScreenState();
}

class _SouraContentScreenState extends State<SouraContentScreen> {
  List<String> ayat = [];

  late SouraContentArgs args;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    args = ModalRoute.of(context)!.settings.arguments as SouraContentArgs;
    if (ayat.isEmpty) {
      loadSuraFile();
    }
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/defult_background.png'),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
            title: Text(args.suraName),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(
                horizontal: width * 0.06, vertical: height * 0.08),
            padding:
                EdgeInsets.symmetric(vertical: height * 0.08, horizontal: 30),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: ayat.isEmpty
                ? LoadIndicator()
                : ListView.builder(
                    itemBuilder: (_, index) => Text(
                      ayat[index],
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    itemCount: ayat.length,
                  ),
          ),
        ));
  }

  void loadSuraFile() async {
    await Future.delayed(Duration(seconds: 1));
    String soura =
        await rootBundle.loadString('assets/text/${args.index + 1}.txt');
    ayat = soura.split('\r\n');
    setState(() {});
  }
}

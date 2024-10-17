import 'package:flutter/material.dart';
import 'package:islamic/tabs/hadeth/hadeth.dart';
import 'package:islamic/tabs/quran/quran_tab.dart';

class HadethContentScreen extends StatefulWidget {
  static const String routName = '/hadeth_content';

  const HadethContentScreen({super.key});

  @override
  State<HadethContentScreen> createState() => _SouraContentScreenState();
}

class _SouraContentScreenState extends State<HadethContentScreen> {
  List<String> ahadeth = [];

  late SouraContentArgs args;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/defult_background.png'),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
            title: Text(hadeth.title),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(
                horizontal: width * 0.06, vertical: height * 0.08),
            padding:
                EdgeInsets.symmetric(vertical: height * 0.08, horizontal: 30),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child:ListView.builder(
                    itemBuilder: (_, index) => Text(
                      hadeth.content[index],
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    itemCount: hadeth.content.length,
                  ),
          ),
        ));
  }
}

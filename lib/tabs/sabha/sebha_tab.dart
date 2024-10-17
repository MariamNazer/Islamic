import 'package:flutter/material.dart';
import 'package:islamic/app_theme.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  String sebhaText = 'سبحان الله';
  int change = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Image.asset(
            'assets/images/sebha_logo.png',
            height: height * 0.40,
          ),
          Text(
            'عدد التسبيحات',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Container(
            height: height * 0.1,
            child: ElevatedButton(
              onPressed: () {
                count();
              },
              style: ElevatedButton.styleFrom(
                  // backgroundColor: const Color.fromARGB(145, 183, 146, 95),
                  backgroundColor: const Color(0XFFB7935F).withOpacity(0.57),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  )),
              child: Text(
                '$counter',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.028,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            decoration: BoxDecoration(
                color: AppTheme.lightPrimary,
                borderRadius: BorderRadius.circular(25)),
            child: Text(sebhaText,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w100,
                    color: Colors.white)),
          )
        ]));
  }

  void count() {
    counter += 1;
    if (change == 0) {
      if (counter % 34 == 0) {
        counter = 1;

        change = 1;
        sebhaText = 'الحمدلله';
      }
    } else if (change == 1) {
      if (counter % 34 == 0) {
        counter = 1;
        change = 2;
        sebhaText = 'الله أكبر';
      }
    } else if (change == 2) {
      if (counter % 34 == 0) {
        counter = 1;
        change = 0;
        sebhaText = 'سبحان الله';
      }
    }
    setState(() {});
  }
}

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
  double angle = 0;
  void countAndRotate() {
    angle -= 2;
    counter += 1;
    if (change == 0) {
      if (counter % 33 == 0) {
        change = 1;
        sebhaText = 'الحمدلله';
      }
    } else if (change == 1) {
      if (counter % 33 == 0) {
        change = 2;
        sebhaText = 'الله أكبر';
      }
    } else if (change == 2) {
      if (counter % 33 == 0) {
        change = 0;
        sebhaText = 'سبحان الله';
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            Column(
              children: [
                Transform.translate(
                  offset: const Offset(10, 4),
                  child: Image.asset(
                    'assets/images/headofseb7a.png',
                    height: height * 0.13,
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, -height * 0.089),
                  child: GestureDetector(
                    onTap: countAndRotate,
                    child: Transform.rotate(
                      angle: angle,
                      child: Image.asset(
                        'assets/images/bodyofseb7a.png',
                        width: width * 0.7,
                        height: height * 0.4,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Transform.translate(
                offset: Offset(0, -height * 0.1),
                child: Text(
                  'عدد التسبيحات',
                  style: Theme.of(context).textTheme.headlineLarge,
                )),
            SizedBox(
              height: height * 0.04,
            ),
            Transform.translate(
              offset: Offset(0, -height * 0.1),
              child: Container(
                height: height * 0.1,
                width: width * 0.17,
                // ignore: sort_child_properties_last
                child: Center(
                  child: Text(
                    '$counter',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0XFFB7935F).withOpacity(0.57),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.028,
            ),
            Transform.translate(
              offset: Offset(0, -height * 0.1),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                decoration: BoxDecoration(
                    color: AppTheme.lightPrimary,
                    borderRadius: BorderRadius.circular(25)),
                child: Text(sebhaText,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w100,
                        color: Colors.white)),
              ),
            )
          ])),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../../../model/course.dart';
import 'progress_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondaryCourseCard extends StatelessWidget {
  SecondaryCourseCard({
    Key? key,
    required this.title,
    required this.link,
    required this.difficulty,
    this.iconsSrc = "assets/icons/ios.svg",
    required this.color1,
  }) : super(key: key);

  final String title, iconsSrc, difficulty;
  final Color color1;
  final String link;
  bool? value = false;
  @override
  Widget build(BuildContext context) {
    print(color1);
    return InkWell(
      child: GlassmorphicContainer(
        borderRadius: 280 * 0.09,
        blur: 15,
        height: 90,
        width: (MediaQuery.of(context).size.width) - 36,
        border: 5,
        alignment: Alignment.center,
        linearGradient: LinearGradient(
            colors: [Color.fromARGB(255, 0, 0, 0).withOpacity(0.2), color1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        borderGradient: LinearGradient(
            colors: [color1, Color.fromARGB(179, 0, 0, 0).withOpacity(0.2)]),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 20),
                    child: Text(
                      title,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 20),
                    child: Text(
                      difficulty,
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: SizedBox(
                height: 40,
                child: VerticalDivider(
                  // thickness: 5,
                  color: Colors.white70,
                ),
              ),
            ),
            const SizedBox(width: 8),
            //SvgPicture.asset(iconsSrc)
            Theme(
              data: ThemeData(unselectedWidgetColor: Color(0xff5e616a)),
              child: Transform.scale(
                scale: 1.5,
                child: const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: MyCheckBoxWidget(),
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () => Launch.launchUrl((link)),
    );
  }
}

class Launch {
  static void launchUrl(String url) async {
    await launch(url);
  }
}

class MyCheckBoxWidget extends StatefulWidget {
  const MyCheckBoxWidget({super.key});

  @override
  State<MyCheckBoxWidget> createState() => _MyCheckBoxWidgetState();
}

class _MyCheckBoxWidgetState extends State<MyCheckBoxWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      activeColor: Color(0xff6cf8a9),
      checkColor: Color(0xff0e3e26),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
          print("isChecked = " + isChecked.toString());
          isChecked ? progress += 1 : progress -= 1;
          //AnimatedLiquidLinearProgressIndicatorState().update_Bar(isChecked);
        });
      },
    );
  }
}

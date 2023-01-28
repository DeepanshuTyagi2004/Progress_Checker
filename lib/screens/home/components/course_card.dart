import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    Key? key,
    required this.title,
    required this.easySolved,
    required this.mediumSolved,
    required this.hardSolved,
    required this.totalQuestions,
    this.color = const Color.fromARGB(255, 20, 21, 22),
    this.iconSrc = "assets/icons/leetcode.svg",
    this.link = "https://leetcode.com/user2685by/",
  }) : super(key: key);

  final String title,
      iconSrc,
      easySolved,
      mediumSolved,
      hardSolved,
      totalQuestions,
      link;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: GlassmorphicContainer(
        borderRadius: 280 * 0.09,
        blur: 15,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        height: 280,
        border: 5,
        alignment: Alignment.center,
        linearGradient: LinearGradient(colors: [
          Colors.white.withOpacity(0.2),
          Color.fromARGB(255, 15, 1, 64).withOpacity(0.2)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderGradient: LinearGradient(colors: [
          Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
          Color.fromARGB(179, 255, 255, 255).withOpacity(0.2)
        ]),
        width: (MediaQuery.of(context).size.width) - 36,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 40, top: 20),
                        child: Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 5),
                        child: Text(
                          easySolved,
                          style: const TextStyle(
                            color: Color.fromARGB(253, 44, 228, 207),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          mediumSolved,
                          style: const TextStyle(
                            color: Color.fromARGB(240, 255, 234, 0),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          hardSolved,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 255, 0, 0),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          totalQuestions,
                          style: const TextStyle(
                            color: Colors.white38,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: List.generate(
                      3,
                      (index) => Transform.translate(
                        offset: Offset((-30 * index).toDouble(), 0),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 30),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(
                              "assets/avaters/Avatar ${index + 1}.jpg",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 30, top: 40),
                  child: SvgPicture.asset(
                    iconSrc,
                    height: 50,
                    width: 50,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      onTap: () {
        launch(link);
      },
    );
  }
}

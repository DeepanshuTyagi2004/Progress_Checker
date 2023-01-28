import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rive_animation/constants.dart';
import 'package:rive_animation/screens/entryPoint/fetchdata.dart';

import '../../model/course.dart';
import 'components/course_card.dart';
import 'components/progress_bar.dart';
import 'components/secondary_course_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  Stream<QuerySnapshot<Map<String, dynamic>>> stream =
      FirebaseFirestore.instance.collection("Progress-Checker").snapshots();
  @override
  Widget build(BuildContext context) {
    Future<String> _fetchDataIt() async {
      print("Fire");
      int i = 0;
      while (i < 1) {
        print("fire");
        await courses[i].fetchData();
        print("fire2");
        i++;
      }
      //fillList();
      print("total easyquestions are ${courses[0].easySolved}");
      return "Done";
    }

    return Scaffold(
        backgroundColor: backgroundColor2,
        body: FutureBuilder<String>(
          future: _fetchDataIt(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SafeArea(
                bottom: false,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          "Profile",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  color: Color(0xFFC69749),
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: courses
                              .map(
                                (course) => Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: CourseCard(
                                    title: course.title,
                                    easySolved:
                                        "Easy Questions solved: ${course.easySolved} / ${course.totalEasy}\n",
                                    mediumSolved:
                                        "Medium Questions solved: ${course.mediumSolved} / ${course.totalMedium}\n",
                                    hardSolved:
                                        "Hard Questions solved: ${course.hardSolved} / ${course.totalHard}\n",
                                    totalQuestions:
                                        "Total number of questions: ${course.totalQuestions}\n",
                                    iconSrc: course.iconSrc,
                                    color: course.color,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          "Questions",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  color: Color(0xFFC69749),
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(bottom: 20),
                      //   child: Container(
                      //     child: Column(
                      //       children: [
                      //         AnimatedLiquidLinearProgressIndicator(),
                      //         Padding(
                      //           padding: EdgeInsets.only(left: 20),
                      //           child: Text(
                      //             "${progress}/$total_progress",
                      //             style: const TextStyle(
                      //               color: Colors.white60,
                      //               fontSize: 16,
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),

                      Container(
                        child: StreamBuilder(
                            stream: stream,
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              print(snapshot.data?.docs.length);
                              return ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: snapshot.data?.docs.length,
                                itemBuilder: (BuildContext context, int index) {
                                  Map<String, dynamic> doc =
                                      snapshot.data?.docs[index].data()
                                          as Map<String, dynamic>;
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20, bottom: 20),
                                    child: SecondaryCourseCard(
                                      difficulty: doc["difficulty"],
                                      title: doc["title"],
                                      color1: doc["difficulty"] == "Easy"
                                          ? Color.fromARGB(255, 0, 251, 255)
                                          : doc["difficulty"] == "Medium"
                                              ? Color.fromARGB(255, 255, 221, 0)
                                              : Color.fromARGB(255, 255, 0, 0),
                                      link: doc["link"],
                                    ),
                                  );
                                },
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return SafeArea(
                bottom: false,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          "Profile",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  color: Color(0xFFC69749),
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: courses
                              .map(
                                (course) => Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: CourseCard(
                                    title: course.title,
                                    easySolved:
                                        "Easy Questions solved: Loading...\n",
                                    mediumSolved:
                                        "Medium Questions solved: Loading...\n",
                                    hardSolved:
                                        "Hard Questions solved: Loading...\n",
                                    totalQuestions:
                                        "Total number of questions: Loading...\n",
                                    iconSrc: course.iconSrc,
                                    color: course.color,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          "Questions",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  color: Color(0xFFC69749),
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Loading...",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  color: Color.fromARGB(255, 63, 63, 67),
                                  fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else {
              return Text("Normally");
            }
          },
        ));
  }
}

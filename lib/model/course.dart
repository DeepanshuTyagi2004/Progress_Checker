import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart' show Color;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../screens/entryPoint/fetchdata.dart';

class Course {
  int totalQuestions,
      easySolved,
      mediumSolved,
      hardSolved,
      totalEasy,
      totalMedium,
      totalHard,
      totalSolved;
  final String iconSrc, title;
  final Color color;

  Future<void> fetchData() async {
    print("Fire");
    Data response = await fetchData2();
    print(response.easySolved);
    this.easySolved = response.easySolved;
    this.mediumSolved = response.mediumSolved;
    this.hardSolved = response.hardSolved;
    this.totalEasy = response.totalEasy;
    this.totalMedium = response.totalMedium;
    this.totalHard = response.totalHard;
    this.totalSolved = response.totalSolved;
    this.totalQuestions = response.totalQuestions;
  }

  Course({
    required this.title,
    this.easySolved = 0,
    this.mediumSolved = 0,
    this.hardSolved = 0,
    this.totalSolved = 0,
    this.totalEasy = 0,
    this.totalMedium = 0,
    this.totalHard = 0,
    this.totalQuestions = 0,
    this.iconSrc = "assets/icons/leetcode.svg",
    this.color = const Color(0xFF3C2A21),
  });
}

final List<Course> courses = [
  Course(title: "LeetCode", iconSrc: "assets/icons/leetcode.svg"),
];

final List<Course> recentCourses = [
  Course(
    title: "State Machine",
    color: Color.fromARGB(255, 255, 0, 0),
  ),
  Course(
    title: "Animated Menu",
    color: Color.fromARGB(255, 0, 251, 255),
  ),
  Course(
    title: "Flutter with Rive",
    color: Color.fromARGB(255, 255, 221, 0),
  ),
  Course(
    title: "Animated Menu",
    color: Color.fromARGB(255, 255, 0, 0),
  ),
  Course(
    title: "State Machine",
    color: Color.fromARGB(255, 255, 0, 0),
  ),
  Course(
    title: "Animated Menu",
    color: Color.fromARGB(255, 255, 0, 0),
  ),
  Course(
    title: "Flutter with Rive",
    color: Color.fromARGB(255, 255, 0, 0),
  ),
  Course(
    title: "Animated Menu",
    color: Color.fromARGB(255, 255, 0, 0),
  ),
];

int progress = (0);
int total_progress = recentCourses.length;

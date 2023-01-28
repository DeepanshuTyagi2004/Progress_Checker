import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

Future<Data> fetchData2() async {
  final response = await http
      .get(Uri.parse('https://leetcode-stats-api.herokuapp.com/user2685by'));

  if (response.statusCode == 200) {
    return Data.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class Data {
  final int totalSolved;
  final int totalQuestions;
  final int easySolved;
  final int totalEasy;
  final int totalMedium;
  final int totalHard;
  final int mediumSolved;
  final int hardSolved;

  Data({
    required this.totalSolved,
    required this.totalQuestions,
    required this.easySolved,
    required this.mediumSolved,
    required this.hardSolved,
    required this.totalEasy,
    required this.totalMedium,
    required this.totalHard,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      totalSolved: json['totalSolved'],
      totalQuestions: json['totalQuestions'],
      easySolved: json['easySolved'],
      mediumSolved: json['mediumSolved'],
      hardSolved: json['hardSolved'],
      totalEasy: json['totalEasy'],
      totalMedium: json['totalMedium'],
      totalHard: json['totalHard'],
    );
  }
}

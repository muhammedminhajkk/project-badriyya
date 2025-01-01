// class ExamResult {
//   final String subjectName;
//   final String className;
//   final String studentName;
//   final int mark;

//   ExamResult(
//       {required this.subjectName,
//       required this.className,
//       required this.studentName,
//       required this.mark});

//   factory ExamResult.fromJson(Map<String, dynamic> json) {
//     return ExamResult(
//         subjectName: json['subjectId'],
//         className: json['classId'],
//         studentName: json['studentId'],
//         mark: json['mark']);
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'subjectId': subjectName,
//       'classId': className,
//       'studentId': studentName,
//       'mark': mark
//     };
//   }
// }

import 'dart:convert';

class ExamResult {
  final int mark;
  final String name;

  ExamResult({
    required this.mark,
    required this.name,
  });

  // Convert JSON map to ExamResult object
  factory ExamResult.fromJson(Map<String, dynamic> json) {
    return ExamResult(
      mark: json['mark'] as int,
      name: json['name'] as String,
    );
  }

  // Convert ExamResult object to JSON map
  Map<String, dynamic> toJson() {
    return {
      'mark': mark,
      'name': name,
    };
  }
}

List<ExamResult> parseResults(String jsonString) {
  final List<dynamic> decodedList = jsonDecode(jsonString);
  return decodedList
      .map((e) => ExamResult.fromJson(e as Map<String, dynamic>))
      .toList();
}

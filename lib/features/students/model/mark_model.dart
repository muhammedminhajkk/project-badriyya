class ExamResult {
  final String subjectName;
  final String className;
  final String studentName;
  final int mark;

  ExamResult(
      {required this.subjectName,
      required this.className,
      required this.studentName,
      required this.mark});

  factory ExamResult.fromJson(Map<String, dynamic> json) {
    return ExamResult(
        subjectName: json['ExamId'],
        className: json['ClassId'],
        studentName: json['StudentId'],
        mark: json['mark']);
  }

  Map<String, dynamic> toJson() {
    return {
      'ExamId': subjectName,
      'ClassId': className,
      'StudentId': studentName,
      'mark': mark
    };
  }
}

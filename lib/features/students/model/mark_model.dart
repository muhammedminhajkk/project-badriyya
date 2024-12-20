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
        subjectName: json['subjectId'],
        className: json['classId'],
        studentName: json['studentId'],
        mark: json['mark']);
  }

  Map<String, dynamic> toJson() {
    return {
      'subjectId': subjectName,
      'classId': className,
      'studentId': studentName,
      'mark': mark
    };
  }
}

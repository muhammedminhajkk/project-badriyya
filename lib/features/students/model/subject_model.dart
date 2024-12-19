class Subject {
  final String subjectName;
  final int passMark;
  final int totalMark;

  Subject(
      {required this.subjectName,
      required this.passMark,
      required this.totalMark});

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      subjectName: json['name'],
      passMark: json['passMark'],
      totalMark: json['totalMark'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': subjectName, 'passMark': passMark, 'totalMark': totalMark};
  }
}

class ClassModel {
  final String classID;
  final String superVisor;
  final List<Exam> exams;

  // Constructor
  ClassModel(
      {required this.classID, required this.superVisor, required this.exams});

  // Factory method to create a ClassModel instance from a JSON object
  factory ClassModel.fromJson(Map<String, dynamic> json) {
    return ClassModel(
      classID: json['name'],
      superVisor: json['superVisor'],
      exams: (json['exams'] as List<dynamic>)
          .map((examJson) => Exam.fromJson(examJson))
          .toList(),
    );
  }

  // Method to convert the ClassModel object back into a JSON object
  Map<String, dynamic> toJson() {
    return {
      'name': classID,
      'superVisor': superVisor,
      'exams': exams.map((exam) => exam.toJson()).toList(),
    };
  }
}

class Exam {
  final String name;
  final bool isCompleted;

  // Constructor
  Exam({required this.name, required this.isCompleted});

  // Factory method to create an Exam instance from a JSON object
  factory Exam.fromJson(Map<String, dynamic> json) {
    return Exam(
      name: json['name'],
      isCompleted:
          json['isCompleted'] ?? false, // Default to false if not present
    );
  }

  // Method to convert the Exam object back into a JSON object
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isCompleted': isCompleted,
    };
  }
}

class ClassModel {
  final String classID;
  final String superVisor;
  final List<String> exams;

  // Constructor
  ClassModel(
      {required this.classID, required this.superVisor, required this.exams});

  // Factory method to create an class instance from a JSON object
  factory ClassModel.fromJson(Map<String, dynamic> json) {
    return ClassModel(
      classID: json['name'],
      superVisor: json['superVisor'],
      exams: List<String>.from(json['exams']),
    );
  }

  // Method to convert the class object back into a JSON object
  Map<String, dynamic> toJson() {
    return {
      'name': classID,
      'exams': exams,
    };
  }
}

class TeacherModel {
  final String name;
  final String contact;
  final String address;
  final List<String> classes;

  // Constructor
  TeacherModel(
      {required this.name,
      required this.contact,
      required this.address,
      required this.classes});

  // From JSON
  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return TeacherModel(
      name: json['name'] as String,
      contact: json['contact'] as String,
      address: json['address'] as String,
      classes: List<String>.from(json['classes'] as List),
    );
  }
}

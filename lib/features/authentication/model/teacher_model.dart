class Teacher {
  final String name;

  Teacher({required this.name});

  // Factory method to create a Teacher instance from a JSON object
  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(name: json['name']);
  }

  // Method to convert the Teacher object to a JSON object (optional)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}

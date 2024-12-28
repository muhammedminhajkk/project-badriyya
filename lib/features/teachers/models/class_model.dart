class Students {
  final String name;

  // Constructor
  Students({
    required this.name,
  });

  // From JSON
  factory Students.fromJson(Map<String, dynamic> json) {
    return Students(
      name: json['name'] as String, // Fetches the 'name' field
    );
  }
}

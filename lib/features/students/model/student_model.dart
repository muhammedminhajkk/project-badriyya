class Student {
  final int? id;
  final String name;
  final String father;
  final String mother;
  final String number;
  final String className;
  final DateTime dob;
  final String address;
  final String password;

  Student({
    this.id,
    required this.name,
    required this.father,
    required this.mother,
    required this.number,
    required this.className,
    required this.dob,
    required this.address,
    required this.password,
  });

  // Factory constructor to create a Student from JSON
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'] as int,
      name: json['name'] as String,
      father: json['father'] as String,
      mother: json['mother'] as String,
      number: json['number'] as String,
      className: json['class'] as String,
      dob: DateTime.parse(json['dob'] as String),
      address: json['address'] as String,
      password: json['password'] as String,
    );
  }

  // Method to convert a Student object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'father': father,
      'mother': mother,
      'number': number,
      'class': className,
      'dob': dob.toIso8601String(),
      'address': address,
      'password': password,
    };
  }
}

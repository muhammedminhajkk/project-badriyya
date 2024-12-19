class Attendance {
  final String userid;
  final List<String> presentDays;

  // Constructor
  Attendance({required this.userid, required this.presentDays});

  // Factory method to create an Attendance instance from a JSON object
  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(
      userid: json['userid'],
      presentDays: List<String>.from(json['presentDays']),
    );
  }

  // Method to convert the Attendance object back into a JSON object
  Map<String, dynamic> toJson() {
    return {
      'userid': userid,
      'presentDays': presentDays,
    };
  }
}

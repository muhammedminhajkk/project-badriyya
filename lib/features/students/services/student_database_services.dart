import 'package:project_badriyya/features/students/model/attendance_model.dart';
import 'package:project_badriyya/features/students/model/student_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StudentServices {
  final currentUser = Supabase.instance.client.auth.currentUser!.email;

  Future getStudents() async {
    final data = await Supabase.instance.client
        .from('students')
        .select()
        .eq('userid', currentUser!);
    final Student student = Student.fromJson(data[0]);
    return student;
  }

  Future getStudentclass() async {
    final data = await Supabase.instance.client
        .from('students')
        .select()
        .eq('userid', currentUser!);
    final Student student = Student.fromJson(data[0]);
    return student.className;
  }

  Future getStudentattendance() async {
    final data = await Supabase.instance.client
        .from('attendance')
        .select()
        .eq('userid', currentUser!);
    final Attendance attendance = Attendance.fromJson(data[0]);
    return attendance;
  }
}

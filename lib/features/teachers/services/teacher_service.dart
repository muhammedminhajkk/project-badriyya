import 'package:project_badriyya/features/teachers/models/teacher_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TeacherService {
  final currentUser = Supabase.instance.client.auth.currentUser!.email;

  Future getTeacher() async {
    final data = await Supabase.instance.client
        .from('teachers')
        .select()
        .eq('name', currentUser!);
    final TeacherModel teacher = TeacherModel.fromJson(data[0]);
    return teacher;
  }

  // Future getStudentclass() async {
  //   final data = await Supabase.instance.client
  //       .from('students')
  //       .select()
  //       .eq('userid', currentUser!);
  //   final Student student = Student.fromJson(data[0]);
  //   return student.className;
  // }

  // Future getStudentattendance() async {
  //   final data = await Supabase.instance.client
  //       .from('attendance')
  //       .select()
  //       .eq('userid', currentUser!);
  //   final Attendance attendance = Attendance.fromJson(data[0]);
  //   return attendance;
  // }
}

import 'package:project_badriyya/features/teachers/models/class_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClassDetailsService {
  Future<List<Students>> getStudents(String className) async {
    final data = await Supabase.instance.client
        .from('students')
        .select('name') // Fetch only the 'name' field
        .eq('class', className); // Filter by the class name

    // Map the response to a list of Student objects
    List<Students> studentList =
        (data as List<dynamic>).map((item) => Students.fromJson(item)).toList();

    return studentList;
  }
}


  // final currentUser = Supabase.instance.client.auth.currentUser!.email;

//   import 'package:project_badriyya/features/students/model/mark_model.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class MarkServices {
//   final currentUser = Supabase.instance.client.auth.currentUser!.email;

//   Future<List<ExamResult>> getMark(studentname, className, examName) async {
//     final data = await Supabase.instance.client
//         .from('marks')
//         .select()
//         .eq('studentId', studentname)
//         .eq('classId', className)
//         .eq('examId', examName);
//     List<ExamResult> examResultList =
//         data.map((item) => ExamResult.fromJson(item)).toList();

//     return examResultList;
//   }
// }

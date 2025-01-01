// import 'package:project_badriyya/features/students/model/mark_model.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class MarkServices {
//   final currentUser = Supabase.instance.client.auth.currentUser!.email;

//   Future<List<ExamResult>> getMark(studentname, className, examName) async {
//     final data = await Supabase.instance.client
//         .from(className)
//         .select('result')
//         .eq('studentname', studentname)
//         .eq('examname', examName);
//     // List<ExamResult> examResultList =
//     //     data.map((item) => ExamResult.fromJson(item)).toList();

//     // return examResultList;
//     final resultJson = data.first['result'] ;
//     final examResultList = parseResults(resultJson);
//     return examResultList;
//   }
// }
import 'package:project_badriyya/features/students/model/mark_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MarkServices {
  final currentUser = Supabase.instance.client.auth.currentUser?.email;

  Future<List<ExamResult>> getMark(
      String studentName, String className, String examName) async {
    // Query the database
    final response = await Supabase.instance.client
        .from(className)
        .select('result')
        .eq('studentname', studentName)
        .eq('examname', examName)
        .maybeSingle();

    // Handle if no data is found

    // Assuming 'result' is already a List<dynamic> containing the exam results
    final resultJson =
        response!['result'] as List<dynamic>; // Expecting a list, not a string
    final examResultList = resultJson
        .map((e) => ExamResult.fromJson(e as Map<String, dynamic>))
        .toList();

    return examResultList;
  }
}

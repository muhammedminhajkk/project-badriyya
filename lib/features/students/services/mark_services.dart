import 'package:project_badriyya/features/students/model/mark_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MarkServices {
  final currentUser = Supabase.instance.client.auth.currentUser!.email;

  Future<List<ExamResult>> getMark(studentname, className, examName) async {
    final data = await Supabase.instance.client
        .from('marks')
        .select()
        .eq('studentId', studentname)
        .eq('classId', className)
        .eq('examId', examName);
    List<ExamResult> examResultList =
        data.map((item) => ExamResult.fromJson(item)).toList();

    return examResultList;
  }
}

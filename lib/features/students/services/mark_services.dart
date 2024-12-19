import 'package:project_badriyya/features/students/model/class_model.dart';
import 'package:project_badriyya/features/students/model/mark_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MarkServices {
  final currentUser = Supabase.instance.client.auth.currentUser!.email;

  Future getMark(studentname, className) async {
    final data = await Supabase.instance.client
        .from('marks')
        .select()
        .eq('StudentId', studentname)
        .eq('ClassId', className);
    // final ExamResult examResultModel = ExamResult.fromJson(data[0]);
    List<ExamResult> examResultList =
        data.map((item) => ExamResult.fromJson(item)).toList();

    return examResultList;
  }
}

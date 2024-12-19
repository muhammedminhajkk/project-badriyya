import 'package:project_badriyya/features/students/model/class_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClassServices {
  final currentUser = Supabase.instance.client.auth.currentUser!.email;

  Future getClass(studentclass) async {
    final data = await Supabase.instance.client
        .from('class')
        .select()
        .eq('name', studentclass);
    final ClassModel classModel = ClassModel.fromJson(data[0]);
    return classModel;
  }
}

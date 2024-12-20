import 'package:project_badriyya/features/authentication/model/teacher_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TeacherService {
  Future<List<String>> getAllTeacherNames() async {
    try {
      // Fetch data from the 'teachers' table
      final response =
          await Supabase.instance.client.from('teachers').select('name');

      // Map the response to a list of Teacher objects and extract names
      List<Teacher> teacherList =
          (response as List).map((data) => Teacher.fromJson(data)).toList();

      // Return only the list of names
      return teacherList.map((teacher) => teacher.name).toList();
    } catch (e) {
      print('Error fetching teachers: $e');
      return [];
    }
  }
}

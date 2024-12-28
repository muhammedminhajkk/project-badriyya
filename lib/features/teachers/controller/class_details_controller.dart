import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_badriyya/core/utils/snack_bar_utils.dart';

import 'package:project_badriyya/features/teachers/models/class_model.dart';
import 'package:project_badriyya/features/teachers/services/class_service.dart';

final classDetailsControllerProvider = Provider<ClassDetailsController>((ref) {
  return ClassDetailsController();
});

class ClassDetailsController {
  final _classServices = ClassDetailsService();

  Future<List<Students>> getStudents(String className) async {
    try {
      final students = await _classServices.getStudents(className);
      return students;
    } catch (e) {
      // print('Error fetching students: $e');
      SnackBarUtils.showMessage("Failed to fetch students: ${e.toString()}");
      rethrow;
    }
  }
}

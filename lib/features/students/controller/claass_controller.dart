import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_badriyya/core/utils/snack_bar_utils.dart';
import 'package:project_badriyya/features/students/model/class_model.dart';
import 'package:project_badriyya/features/students/services/class_database_services.dart';

final classControllerProvider = Provider<ClassController>((ref) {
  return ClassController();
});

class ClassController {
  final _classServices = ClassServices();

  Future<ClassModel?> getClass(studentclass) async {
    try {
      // Fetch student by userid
      final classdata = await _classServices.getClass(studentclass);
      return classdata;
    } catch (e) {
      SnackBarUtils.showMessage("Failed to fetch student: ${e.toString()}");
      rethrow; // Re-throw the exception to handle it higher up if necessary
    }
  }
}

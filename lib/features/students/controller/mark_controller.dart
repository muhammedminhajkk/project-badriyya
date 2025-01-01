import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_badriyya/core/utils/snack_bar_utils.dart';
import 'package:project_badriyya/features/students/model/mark_model.dart';
import 'package:project_badriyya/features/students/services/mark_services.dart';

final markControllerProvider = Provider<MarkController>((ref) {
  return MarkController();
});

class MarkController {
  final _markServices = MarkServices();

  Future<List<ExamResult?>> getResult(
      examName, studentname, studentclass) async {
    try {
      final examResultData =
          await _markServices.getMark(studentname, studentclass, examName);
      return examResultData;
    } catch (e) {
      SnackBarUtils.showMessage("Failed to fetch markdd: ${e.toString()}");
      rethrow; // Re-throw the exception to handle it higher up if necessary
    }
  }
}

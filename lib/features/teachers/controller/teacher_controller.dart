import 'package:project_badriyya/core/utils/snack_bar_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_badriyya/features/teachers/models/teacher_model.dart';
import 'package:project_badriyya/features/teachers/services/teacher_service.dart';

final teacherControllerProvider = Provider<TeacherController>((ref) {
  return TeacherController();
});

class TeacherController {
  final _techerServices = TeacherService();

  Future<TeacherModel?> getTeacher() async {
    try {
      // Fetch student by userid
      final teacher = await _techerServices.getTeacher();
      return teacher;
    } catch (e) {
      SnackBarUtils.showMessage("Failed to fetch teacher: ${e.toString()}");
      rethrow; // Re-throw the exception to handle it higher up if necessary
    }
  }

  // Future<String?> getStudentclass() async {
  //   try {
  //     // Fetch student class
  //     final classId = await _techerServices.getStudentclass();
  //     return classId;
  //   } catch (e) {
  //     SnackBarUtils.showMessage("Failed to fetch student: ${e.toString()}");
  //     rethrow; // Re-throw the exception to handle it higher up if necessary
  //   }
  // }

  // Future<String?> getStudentid() async {
  //   try {
  //     // Fetch student by userid
  //     final userid = _techerServices.currentUser;

  //     return userid;
  //   } catch (e) {
  //     SnackBarUtils.showMessage("Failed to fetch student: ${e.toString()}");
  //     rethrow; // Re-throw the exception to handle it higher up if necessary
  //   }
  // }

  // Future<Attendance?> getStudentattendance() async {
  //   try {
  //     // Fetch student by userid
  //     final attendance = await _techerServices.getStudentattendance();
  //     return attendance;
  //   } catch (e) {
  //     SnackBarUtils.showMessage("Failed to fetch attendance: ${e.toString()}");
  //     rethrow; // Re-throw the exception to handle it higher up if necessary
  //   }
  // }
}

import 'package:project_badriyya/core/utils/snack_bar_utils.dart';
import 'package:project_badriyya/features/students/model/attendance_model.dart';
import 'package:project_badriyya/features/students/model/student_model.dart';
import 'package:project_badriyya/features/students/services/student_database_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final studentControllerProvider = Provider<StudentController>((ref) {
  return StudentController();
});

class StudentController {
  final _studentServices = StudentServices();

  Future<Student?> getStudent() async {
    try {
      // Fetch student by userid
      final student = await _studentServices.getStudents();
      return student;
    } catch (e) {
      SnackBarUtils.showMessage("Failed to fetch student: ${e.toString()}");
      rethrow; // Re-throw the exception to handle it higher up if necessary
    }
  }

  Future<String?> getStudentclass() async {
    try {
      // Fetch student class
      final classId = await _studentServices.getStudentclass();
      return classId;
    } catch (e) {
      SnackBarUtils.showMessage("Failed to fetch student: ${e.toString()}");
      rethrow; // Re-throw the exception to handle it higher up if necessary
    }
  }

  Future<String?> getStudentid() async {
    try {
      // Fetch student by userid
      final userid = _studentServices.currentUser;

      return userid;
    } catch (e) {
      SnackBarUtils.showMessage("Failed to fetch student: ${e.toString()}");
      rethrow; // Re-throw the exception to handle it higher up if necessary
    }
  }

  Future<Attendance?> getStudentattendance() async {
    try {
      // Fetch student by userid
      final attendance = await _studentServices.getStudentattendance();
      return attendance;
    } catch (e) {
      SnackBarUtils.showMessage("Failed to fetch attendance: ${e.toString()}");
      rethrow; // Re-throw the exception to handle it higher up if necessary
    }
  }
}

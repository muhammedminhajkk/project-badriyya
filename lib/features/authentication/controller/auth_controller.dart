import 'package:go_router/go_router.dart';
import 'package:project_badriyya/core/utils/snack_bar_utils.dart';
import 'package:project_badriyya/features/authentication/services/auth_services.dart';
import 'package:project_badriyya/features/authentication/services/teacher_service.dart';
import 'package:project_badriyya/features/authentication/view/pages/login_page.dart';
import 'package:project_badriyya/features/students/view/pages/home_page_for_students.dart';
import 'package:project_badriyya/features/teachers/view/pages/home_page_for_teachers.dart';
import 'package:project_badriyya/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  final _authServices = AuthServices();
  final teacherService = TeachersList();
  @override
  void build() async {
    List<String> teacherNames = await teacherService.getAllTeacherNames();
    Supabase.instance.client.auth.onAuthStateChange.listen(
      (data) {
        final session = data.session; // The current session
        // print(session!.user.email);

        if (session == null) {
          MyApp.navigatorKey.currentContext!.go(Loginpage.routePath);
        } else {
          if (teacherNames.contains(session.user.email)) {
            MyApp.navigatorKey.currentContext!
                .go(HomePageForTeachers.routePath);
          } else {
            MyApp.navigatorKey.currentContext!
                .go(HomePageForStudents.routePath);
          }
        }
      },
    );
  }

  Future<void> login(String email, String password) async {
    try {
      await _authServices.signInWithEmailAndPassword(email, password);

      SnackBarUtils.showMessage('Login success');
    } catch (e) {
      SnackBarUtils.showMessage(e.toString());
    }
  }

  Future<void> logout() async {
    try {
      await Supabase.instance.client.auth.signOut();
      // print('User logged out successfully.');
    } catch (e) {
      // print('Error during logout: $e');
    }
  }
}

import 'package:go_router/go_router.dart';
import 'package:project_badriyya/features/authentication/view/pages/login_page.dart';
import 'package:project_badriyya/features/authentication/view/pages/welcome_page.dart';
import 'package:project_badriyya/features/students/view/pages/home_page_for_students.dart';
import 'package:project_badriyya/features/teachers/view/pages/exam_page.dart';
import 'package:project_badriyya/features/teachers/view/pages/home_page_for_teachers.dart';
import 'package:project_badriyya/main.dart';

final router = GoRouter(
    initialLocation: WelcomePage.routePath,
    navigatorKey: MyApp.navigatorKey,
    routes: [
      GoRoute(
        path: WelcomePage.routePath,
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(
        path: Loginpage.routePath,
        builder: (context, state) => const Loginpage(),
      ),
      GoRoute(
        path: HomePageForStudents.routePath,
        builder: (context, state) => const HomePageForStudents(),
      ),
      GoRoute(
        path: HomePageForTeachers.routePath,
        builder: (context, state) => const HomePageForTeachers(),
      ),
    ]);

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_badriyya/core/navigation/router.dart';
// import 'package:project_badriyya/features/students/view/pages/test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  Supabase.initialize(
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhodnZ5dXhza2hvaW1tZ3FlZW5tIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzMxMTUwODcsImV4cCI6MjA0ODY5MTA4N30.KTiVOREPZRZpfCTxxJYSLLDtXdG2__22kUbf5JcTiik",
      url: "https://xhvvyuxskhoimmgqeenm.supabase.co");

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        scaffoldMessengerKey: MyApp.scaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        routerConfig: router);
  }
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     scaffoldMessengerKey: MyApp.scaffoldMessengerKey,
  //     debugShowCheckedModeBanner: false,
  //     home: const Test(),
  //   );
  // }
}

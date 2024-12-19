import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_badriyya/features/students/controller/student_controller.dart';

class Test extends ConsumerWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final studentController = ref.read(studentControllerProvider);

    return Scaffold(
      body: FutureBuilder(
          future: studentController.getStudentid(),
          builder: (context, snapshot) {
            final userid = snapshot.data;
            if (snapshot.hasData && userid != null) {
              return Center(
                child: Text(userid),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

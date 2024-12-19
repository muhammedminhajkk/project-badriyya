import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_badriyya/features/students/controller/claass_controller.dart';
import 'package:project_badriyya/features/students/view/widgets/detailed_exam_result.dart';

class ExamPage extends ConsumerWidget {
  final String studenClass;
  const ExamPage({super.key, required this.studenClass});

  @override
  Widget build(BuildContext context, ref) {
    final classController = ref.read(classControllerProvider);

    return FutureBuilder(
        future: classController.getClass(studenClass),
        builder: (context, snapshot) {
          final exams = snapshot.data;
          if (snapshot.hasData && exams != null) {
            return ListView.builder(
                itemCount: exams.exams.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () => showExamResults(context),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(20)),
                        height: 58,
                        width: 363,
                        child: Center(
                            child: Text(
                          exams.exams[index],
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )),
                      ),
                    ),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

void showExamResults(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const DetailedExamResult();
    },
  );
}

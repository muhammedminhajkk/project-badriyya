import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_badriyya/features/students/controller/claass_controller.dart';
import 'package:project_badriyya/features/students/view/widgets/detailed_exam_result.dart';

class ExamPage extends ConsumerWidget {
  final String studenClass;
  final String studentName;
  const ExamPage(
      {super.key, required this.studenClass, required this.studentName});

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
                  final data = exams.exams;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () => showExamResults(
                          context, data[index].name, studenClass, studentName),
                      child: Container(
                        decoration: BoxDecoration(
                            color: data[index].isCompleted
                                ? const Color.fromARGB(120, 255, 187, 0)
                                : const Color.fromARGB(178, 47, 128, 237),
                            borderRadius: BorderRadius.circular(20)),
                        height: 58,
                        width: 363,
                        child: Center(
                            child: Text(
                          data[index].name,
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

void showExamResults(BuildContext context, examId, studentClass, studentName) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return DetailedExamResult(
        studentName: studentName,
        studentClass: studentClass,
        examId: examId,
      );
    },
  );
}

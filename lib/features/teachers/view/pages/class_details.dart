import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:project_badriyya/features/teachers/controller/class_details_controller.dart';
import 'package:project_badriyya/features/teachers/view/pages/exam_page.dart';
import 'package:project_badriyya/main.dart';

class ClassDetailsPage extends ConsumerWidget {
  final String className;
  const ClassDetailsPage({super.key, required this.className});

  @override
  Widget build(BuildContext context, ref) {
    final classController = ref.read(classDetailsControllerProvider);

    return FutureBuilder(
        future: classController.getStudents(className),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final students = snapshot.data!;
            return Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 47, 128, 237),
                            border: Border.all(
                                color: Colors.black,
                                width: 1), // Thin black border
                            borderRadius:
                                BorderRadius.circular(8), // Rounded corners
                          ),
                          alignment: Alignment.center, // Align text to center
                          child: const Text(
                            "Add New Student",
                            style: TextStyle(
                              color: Colors
                                  .white, // Optional: Change text color for better visibility
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ClassExamPage(studenClass: 'S3'),
                              ),
                            );
                          },
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 47, 128, 237),
                              border: Border.all(
                                  color: Colors.black,
                                  width: 1), // Thin black border
                              borderRadius:
                                  BorderRadius.circular(8), // Rounded corners
                            ),
                            alignment: Alignment.center, // Align text to center
                            child: const Text(
                              "Update Exam Result",
                              style: TextStyle(
                                color: Colors
                                    .white, // Optional: Change text color for better visibility
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(178, 47, 128, 237),
                                  borderRadius: BorderRadius.circular(20)),
                              height: 58,
                              width: 363,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    '$index.${students[0].name}',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Expanded(
                                    child: SizedBox(),
                                  ),
                                  Checkbox(
                                    value: false,
                                    onChanged: (value) {},
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

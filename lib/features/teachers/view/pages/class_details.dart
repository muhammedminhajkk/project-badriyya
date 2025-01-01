import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:project_badriyya/features/teachers/controller/class_details_controller.dart';

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
            return ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(178, 47, 128, 237),
                            borderRadius: BorderRadius.circular(20)),
                        height: 58,
                        width: 363,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              '${index + 1}.${students[0].name}',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
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
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

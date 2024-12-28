import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_badriyya/features/students/controller/claass_controller.dart';

class ClassExamPage extends ConsumerWidget {
  static const routePath = '/classexampage';

  final String studenClass;
  const ClassExamPage({super.key, required this.studenClass});

  @override
  Widget build(BuildContext context, ref) {
    final classController = ref.read(classControllerProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 121, 211, 252),
        title: const Text(
          "Exams",
          style: TextStyle(
            fontSize: 32, // Font size
            fontWeight: FontWeight.bold, // Bold text
            letterSpacing: 1.5, // Spacing between letters
            height: 1.5, // Line height
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 121, 211, 252),
      body: Column(
        children: [
          // Underline or divider below AppBar
          const Divider(
            thickness: 2, // Line thickness
            color: Colors.black, // Line color
          ),
          // Your existing FutureBuilder code
          Expanded(
            child: FutureBuilder(
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
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1),
                                    color: data[index].isCompleted
                                        ? const Color.fromARGB(185, 255, 187, 0)
                                        : const Color.fromARGB(
                                            255, 47, 129, 237),
                                    borderRadius: BorderRadius.circular(20)),
                                height: 58,
                                width: 363,
                                child: Center(
                                    child: Text(
                                  data[index].name,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                )),
                              ),
                            ),
                          );
                        });
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ],
      ),
    );
  }
}

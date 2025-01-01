import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_badriyya/features/students/controller/student_controller.dart';
import 'package:project_badriyya/features/students/view/pages/attendance_tab.dart';
import 'package:project_badriyya/features/students/view/pages/exam_tab.dart';

class HomePageForStudents extends ConsumerWidget {
  static const routePath = '/students';

  const HomePageForStudents({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final studentController = ref.read(studentControllerProvider);
    String studentclass;
    return Scaffold(
      body: FutureBuilder(
          future: studentController.getStudent(),
          builder: (context, snapshot) {
            final student = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting ||
                student == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              studentclass = student.className;
              return DefaultTabController(
                length: 2,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(47, 128, 237, 255),
                    image: DecorationImage(
                        image:
                            AssetImage("assets/images/background/homepage.png"),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 30,
                        color: const Color.fromARGB(255, 22, 125, 242),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 24,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                student.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                              Text(
                                student.className,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                          const Expanded(child: SizedBox()),
                          Container(
                            height: 124,
                            width: 124,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/profile.png"),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(
                            width: 24,
                          )
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: TabBar(
                            dividerColor: Colors.black,
                            isScrollable: false,
                            indicatorColor: Colors.white,
                            indicatorWeight: 3,
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.black,
                            labelStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800),
                            tabs: [
                              Tab(
                                  child: Container(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: const Text('Attendance'))),
                              Tab(
                                  child: Container(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: const Text('Exam'))),
                              // Tab(
                              //     child: Container(
                              //         padding: const EdgeInsets.only(top: 20),
                              //         child: const Text('Account'))),
                            ]),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            const CalendarPage(),
                            ExamPage(
                              studenClass: studentclass,
                              studentName: student.name,
                            ),
                            // const AccountPage()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}

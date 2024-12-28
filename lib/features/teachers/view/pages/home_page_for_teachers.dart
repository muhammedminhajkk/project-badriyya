import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:project_badriyya/features/teachers/controller/teacher_controller.dart';
import 'package:project_badriyya/features/teachers/view/pages/class_details.dart';

class HomePageForTeachers extends ConsumerWidget {
  static const routePath = '/teachers';

  const HomePageForTeachers({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final teacherController = ref.read(teacherControllerProvider);
    return Scaffold(
      body: FutureBuilder(
          future: teacherController.getTeacher(),
          builder: (context, snapshot) {
            final teacher = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting ||
                teacher == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return DefaultTabController(
                length: teacher.classes.length,
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
                                teacher.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
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
                          tabs: teacher.classes
                              .map((tabName) => Tab(
                                    child: Container(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text(tabName),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: teacher.classes
                              .map((className) =>
                                  ClassDetailsPage(className: className))
                              .toList(),
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

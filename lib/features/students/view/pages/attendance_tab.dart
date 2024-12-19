import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_badriyya/features/students/controller/student_controller.dart';
import 'package:project_badriyya/features/students/view/widgets/calendar_widget.dart';

class CalendarPage extends ConsumerWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final studentController = ref.read(studentControllerProvider);

    return FutureBuilder(
        future: studentController.getStudentattendance(),
        builder: (context, snapshot) {
          final attendance = snapshot.data;
          if (snapshot.hasData && attendance != null) {
            return Column(
              children: [
                const Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 24,
                    ),
                    Calendar(
                      attendance: attendance,
                    )
                  ],
                ),
                const Expanded(child: SizedBox()),
                const Row(
                  children: [
                    SizedBox(
                      width: 24,
                    ),
                    Text(
                      'Total Classes',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    Expanded(child: SizedBox()),
                    Text('120',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600)),
                    SizedBox(
                      width: 41,
                    )
                  ],
                ),
                const Expanded(child: SizedBox()),
                Row(
                  children: [
                    const SizedBox(
                      width: 24,
                    ),
                    const Text('Present Days',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600)),
                    const Expanded(child: SizedBox()),
                    Text(attendance.presentDays.length.toString(),
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600)),
                    const SizedBox(
                      width: 41,
                    )
                  ],
                ),
                const Expanded(child: SizedBox()),
                Row(
                  children: [
                    const SizedBox(
                      width: 24,
                    ),
                    const Text('Absent Days',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600)),
                    const Expanded(child: SizedBox()),
                    Text('${120 - attendance.presentDays.length}',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600)),
                    const SizedBox(
                      width: 41,
                    )
                  ],
                ),
                const Expanded(child: SizedBox()),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

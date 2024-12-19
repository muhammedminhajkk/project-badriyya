import 'package:flutter/material.dart';
import 'package:project_badriyya/features/students/model/attendance_model.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  final Attendance attendance;
  const Calendar({super.key, required this.attendance});

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 288,
        width: 346,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              blurStyle: BlurStyle.solid,
              offset: const Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: TableCalendar(
            firstDay: DateTime.utc(2024, 1, 1),
            lastDay: DateTime.utc(2024, 12, 31),
            focusedDay: DateTime.utc(2024, 11, 1),
            rowHeight: 40,
            headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            availableGestures: AvailableGestures.all,
            calendarBuilders:
                CalendarBuilders(defaultBuilder: (context, day, focusedDay) {
              String dayString =
                  '${day.year}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}';
              bool? isPresent = attendance.presentDays.contains(dayString);

              return Container(
                height: 30,
                width: 30,
                margin: const EdgeInsets.all(4.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: isPresent
                      ? const Color.fromRGBO(0, 255, 17, 0.5)
                      : const Color.fromRGBO(255, 0, 0, 0.4),
                  // shape: BoxShape.circle,
                ),
                child: Text(
                  '${day.day}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              );
            })));
  }
}

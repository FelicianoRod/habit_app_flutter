import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../theme/app_constants.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime focusedDay = DateTime.now();
    DateTime selectedDate = DateTime.now();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.all(
          Radius.circular(AppConstants.borderRadiusL),
        ),
      ),
      // Limitar la altura para que el calendario ocupe una sola fila visual (vista semanal).
      child: SizedBox(
        // height: 140, // ajusta este valor si quieres más/menos espacio
        child: TableCalendar(
          firstDay: DateTime.utc(2000, 1, 1),
          lastDay: DateTime.utc(2100, 12, 31),
          headerVisible: false,
          focusedDay: focusedDay,
          calendarFormat: CalendarFormat.week, // forzar vista semanal
          availableCalendarFormats: const {
            CalendarFormat.week: 'Semana',
          }, // evitar cambiar formato
          selectedDayPredicate: (day) => isSameDate(day, selectedDate),
          onDaySelected: (selectedDay, focusedDay) {},
          // headerStyle: HeaderStyle(
          //   // Hacemos invisible el título del mes (lo ocultamos visualmente).
          //   // titleTextStyle: const TextStyle(
          //   //   color: Colors.transparent,
          //   //   fontSize: 0,
          //   // ),
          //   formatButtonVisible: false,
          //   titleCentered: true,
          //   leftChevronIcon: const Icon(
          //     Icons.chevron_left,
          //     color: Colors.white70,
          //   ),
          //   rightChevronIcon: const Icon(
          //     Icons.chevron_right,
          //     color: Colors.white70,
          //   ),
          //   headerPadding: const EdgeInsets.symmetric(
          //     vertical: 4,
          //   ), // menos espacio arriba
          // ),
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: Theme.of(context).textTheme.bodyMedium ?? TextStyle(),
            weekendStyle: TextStyle(
              fontStyle: Theme.of(context).textTheme.bodyMedium!.fontStyle,
              color: Colors.red,
            ),
          ),
          calendarStyle: CalendarStyle(
            defaultTextStyle: TextStyle(color: Colors.black),
            weekendTextStyle: TextStyle(color: Colors.black),
            todayDecoration: BoxDecoration(
              color: Color(0xFF2A2A2E),
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle,
            ),
            selectedTextStyle: TextStyle(color: Colors.black),
            outsideDaysVisible: false,
          ),
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focusedDay) {
              final isSelected = isSameDate(day, selectedDate);
              return Center(
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${day.day}',
                    style: TextStyle(
                      color: isSelected ? Colors.black : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  bool isSameDate(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}

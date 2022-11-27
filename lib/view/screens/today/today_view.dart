import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:letsdo_app/controller/today_providers.dart';
import 'package:letsdo_app/model/weekday_to_string.dart';
import 'package:letsdo_app/view/handlers/handle_statusbar_brightness.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../widgets/day_builder.dart';

class TodayScreen extends HookConsumerWidget {
  const TodayScreen({Key? key}) : super(key: key);
  static const String id = '/home/today';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    handleStatusBarBrightness(context);
    final now = DateTime.now();
    final ValueNotifier<DateTime> focusedDay = useState(now);
    final DateTime selectedDay = ref.watch(selectedDateProvider) ?? now;

    debugPrint('focusedDay=${focusedDay.value}, selectedDay=$selectedDay');

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Today',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            TableCalendar(
              rowHeight: 72,
              focusedDay: focusedDay.value,
              selectedDayPredicate: (sDay) => sDay == selectedDay,
              firstDay: DateTime(1999),
              lastDay: DateTime(2999),
              weekendDays: const [DateTime.friday, DateTime.saturday],
              calendarFormat: CalendarFormat.week,
              availableCalendarFormats: const {CalendarFormat.week: ''},
              headerStyle: HeaderStyle(
                  // formatButtonVisible: false,
                  // formatButtonShowsNext: false,
                  titleTextStyle: Theme.of(context).textTheme.bodyMedium!,
                  headerPadding: const EdgeInsets.only(left: 20, bottom: 20),
                  leftChevronVisible: false,
                  rightChevronVisible: false),
              onDaySelected: (nowSelectedDay, nowFocusedDay) {
                focusedDay.value = nowFocusedDay;
                ref.read(selectedDateProvider.notifier).state = nowSelectedDay;
              },
              daysOfWeekVisible: false,
              calendarBuilders: CalendarBuilders(
                  outsideBuilder: (context, day, focusedDay) =>
                      dayBuilder(day, isOutside: true, context: context),
                  defaultBuilder: (context, day, focusedDay) =>
                      dayBuilder(day, isSelected: false, context: context),
                  selectedBuilder: (context, day, focusedDay) => Container(
                      width: 42,
                      height: 62,
                      constraints:
                          const BoxConstraints(minHeight: 120, minWidth: 42),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(16)),
                      child:
                          dayBuilder(day, isSelected: true, context: context)),
                  todayBuilder: (context, day, focusedDay) => Container(
                      width: 42,
                      height: 62,
                      constraints:
                          const BoxConstraints(minHeight: 120, minWidth: 42),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(16)),
                      child: dayBuilder(day, isToday: true, context: context))),
            ),
          ],
        ),
      ),
    );
  }
}

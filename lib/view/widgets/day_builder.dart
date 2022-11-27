import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../model/weekday_to_string.dart';

dayBuilder(
  DateTime day, {
  bool isSelected = true,
  BuildContext? context,
  bool isToday = false,
  bool isOutside = false,
}) {
  final TextStyle selectedWeekDayTS = TextStyle(
      letterSpacing: 2,
      color: (isSelected)
          ? // selected = true
          isToday
              // today
              ? Theme.of(context!).colorScheme.background
              // not today
              : Theme.of(context!)
                  .colorScheme
                  .onBackground
                  .withOpacity(isOutside ? 0.4 : 1)
          :
          // selected  false
          Theme.of(context!)
              .colorScheme
              .onBackground
              .withOpacity(isOutside ? 0.8 : 1),
      fontSize: 12,
      fontFamily: GoogleFonts.roboto().fontFamily);
  return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(
          flex: 2,
        ),
        FittedBox(
          child: Text(
            weekdayToString(day),
            style: selectedWeekDayTS,
          ),
        ),
        const Spacer(),
        FittedBox(
          child: Text(
            day.day.toString(),
            style: selectedWeekDayTS.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Spacer(
          flex: 2,
        ),
      ]);
}

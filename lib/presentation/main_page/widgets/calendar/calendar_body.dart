import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/app_colors.dart';
import '../../../../logic/event_bloc/event_bloc.dart';
import 'custom_calendar.dart';
import 'calendar_month_data.dart';

class Body extends StatelessWidget {
  const Body({
    required this.selectedMonth,
    required this.selectedDate,
    super.key,
  });

  final DateTime selectedMonth;
  final DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    var data = CalendarMonthData(
      year: selectedMonth.year,
      month: selectedMonth.month,
    );

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            7,
            (index) => Text(
              days[index].substring(0, 3),
              style: const TextStyle(
                color: Color(0xFF969696),
              ),
            ),
          ).toList(),
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var week in data.weeks)
              Row(
                children: week.map((d) {
                  bool isSelected =
                      selectedDate != null && selectedDate!.isSameDate(d.date);
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.read<EventBloc>().add(
                              ChangeDateEvent(d.date),
                            );
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        alignment: Alignment.center,
                        height: 35,
                        decoration: isSelected
                            ? const BoxDecoration(
                                color: Color(0xFF009FEE),
                                shape: BoxShape.circle)
                            : null,
                        child: Text(
                          d.date.day.toString(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? AppColors.whiteColor
                                : d.isActiveMonth
                                    ? AppColors.selectedDayColor
                                    : AppColors.greyColor,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ],
    );
  }
}

List<String> days = [
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
  "Sunday",
];

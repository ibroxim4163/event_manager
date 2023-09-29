import 'package:event_task/data/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/app_colors.dart';
import '../../../../data/constants/app_utils.dart';
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
    CalendarMonthData data = CalendarMonthData(
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
                color: AppColors.weekdayColor,
              ),
            ),
          ).toList(),
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (final week in data.weeks)
              Row(
                children: week.map((d) {
                  bool isSelected =
                      selectedDate != null && selectedDate!.isSameDate(d.date);
                  return Expanded(
                    child: BlocBuilder<EventBloc, EventState>(
                      buildWhen: (previous, current) {
                        return previous.eventTodo.allTodos.length !=
                            current.eventTodo.allTodos.length;
                      },
                      builder: (context, state) {
                        List<TodoModel> todos = state.eventTodo.allTodos
                            .where((element) => element.taskDate == d.date)
                            .toList();
                        return GestureDetector(
                          onTap: () {
                            context.read<EventBloc>().add(
                                  ChangeDateEvent(d.date),
                                );
                          },
                          behavior: HitTestBehavior.opaque,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 35,
                                decoration: isSelected
                                    ? const BoxDecoration(
                                        color: AppColors.blueColor,
                                        shape: BoxShape.circle,
                                      )
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
                              const SizedBox(height: 3),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: todos
                                    .map((e) {
                                      return Padding(
                                        padding: AppUtils.pLeft2,
                                        child: CircleAvatar(
                                          radius: 3,
                                          backgroundColor: AppColors
                                              .primaries[e.priorityColor],
                                        ),
                                      );
                                    })
                                    .take(3)
                                    .toList(),
                              ),
                            ],
                          ),
                        );
                      },
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

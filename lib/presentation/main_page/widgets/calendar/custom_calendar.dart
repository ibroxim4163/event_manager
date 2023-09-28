import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../logic/event_bloc/event_bloc.dart';
import 'calendar_body.dart';
import 'calendar_header.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  late DateTime selectedMonth;

  DateTime? selectedDate;

  @override
  void initState() {
    selectedDate = DateTime.now();
    selectedMonth = DateTime.now().monthStart;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventBloc, EventState>(
      buildWhen: (previous, current) {
        return previous.eventTodo.current != current.eventTodo.current;
      },
      builder: (context, state) {
        return Center(
          child: SizedBox(
            height: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Header(
                  selectedMonth: selectedMonth,
                  selectedDate: state.eventTodo.current,
                  onChange: (value) => setState(() => selectedMonth = value),
                ),
                Expanded(
                  child: Body(
                    selectedDate: state.eventTodo.current,
                    selectedMonth: selectedMonth,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

String getMonthName(int index) {
  return switch (index) {
    1 => "January",
    2 => "February",
    3 => "March",
    4 => "April",
    5 => "May",
    6 => "June",
    7 => "July",
    8 => "August",
    9 => "September",
    10 => "October",
    11 => "November",
    12 => "December",
    _ => "January",
  };
}

extension DateTimeExt on DateTime {
  DateTime get monthStart => DateTime(year, month);
  DateTime get dayStart => DateTime(year, month, day);

  DateTime addMonth(int count) {
    return DateTime(year, month + count, day);
  }

  bool isSameDate(DateTime date) {
    return year == date.year && month == date.month && day == date.day;
  }

  bool get isToday {
    return isSameDate(DateTime.now());
  }
}

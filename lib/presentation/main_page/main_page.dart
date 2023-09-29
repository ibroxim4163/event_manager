import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/constants/app_colors.dart';
import '../../data/constants/app_icons.dart';
import '../../data/constants/app_navigator.dart';
import '../../data/constants/app_utils.dart';
import '../../data/constants/text_styles.dart';
import '../../logic/event_bloc/event_bloc.dart';
import '../add_event_page/add_event_page.dart';
import '../details_page/details_page.dart';
import 'widgets/calendar/calendar_body.dart';
import 'widgets/calendar/custom_calendar.dart';
import 'widgets/task_holder.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppUtils.pAll8,
          child: BlocBuilder<EventBloc, EventState>(
            builder: (context, state) {
              return ListView(
                children: [
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            days[state.eventTodo.current.weekday - 1],
                            style: AppTextStyles.weekDay,
                          ),
                          const SizedBox(height: 7),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${state.eventTodo.current.day}"
                                " ${getMonthName(state.eventTodo.current.month)}"
                                " ${state.eventTodo.current.year}  ",
                                style: AppTextStyles.date,
                              ),
                              const SizedBox(
                                height: 10,
                                width: 10,
                                child: Image(
                                  color: AppColors.blackColor,
                                  image: AssetImage(
                                    AppIcons.arrowDown,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: screenSize.width > 300 ? 35 : 25,
                        child: const Image(
                          image: AssetImage(
                            AppIcons.bell,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const CustomCalendar(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Schedule",
                        style: AppTextStyles.schedule,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(100, 30)),
                        onPressed: () {
                          AppNavigator.navigatorPush(
                              context, const AddEventPage());
                        },
                        child: Text(
                          "+ Add Event",
                          style: AppTextStyles.addEvent,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  BlocConsumer<EventBloc, EventState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return Column(
                        children: List.generate(
                          state.eventTodo.todos.length,
                          (index) {
                            final todo = state.eventTodo.todos[index];
                            return GestureDetector(
                              onTap: () {
                                AppNavigator.navigatorPush(
                                    context, DetailsPage(todo: todo));
                              },
                              child: TodoHolder(todo: todo),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

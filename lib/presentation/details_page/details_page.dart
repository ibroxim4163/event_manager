import 'package:event_task/data/constants/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/constants/app_colors.dart';
import '../../data/constants/app_icons.dart';
import '../../data/constants/app_utils.dart';
import '../../data/constants/text_styles.dart';
import '../../data/models/todo_model.dart';
import '../../logic/event_bloc/event_bloc.dart';
import 'widgets/header.dart';

class DetailsPage extends StatelessWidget {
  final TodoModel todo;
  const DetailsPage({
    required this.todo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            DetailsHeader(todo: todo),
            const Padding(
              padding: AppUtils.pAll8,
              child: Text(
                "Reminder",
                style: AppTextStyles.title,
              ),
            ),
            Padding(
              padding: AppUtils.pAll8,
              child: Text(
                "${todo.remainder} minutes before",
                style: AppTextStyles.subtitle,
              ),
            ),
            const Padding(
              padding: AppUtils.pAll8,
              child: Text(
                "Description",
                style: AppTextStyles.title,
              ),
            ),
            Padding(
              padding: AppUtils.pLeft8,
              child: Text(
                todo.eventDescription,
                style: AppTextStyles.subtitle,
              ),
            ),
            SizedBox(
              height: screenSize.height * .3,
            ),
            Padding(
              padding: AppUtils.pSym15,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(double.infinity, 50),
                  backgroundColor: AppColors.deleteButtonColor,
                  disabledBackgroundColor: AppColors.deleteButtonColor,
                ),
                onPressed: () {
                  context.read<EventBloc>().add(DeleteTodo(todo.id));
                  context.read<EventBloc>().add(const LoadingEvent());

                  AppNavigator.navigatorPop(context);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(
                        AppIcons.delete,
                      ),
                      height: 25,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Delete Event",
                      style: AppTextStyles.title,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

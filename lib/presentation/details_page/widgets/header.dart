import 'package:flutter/material.dart';

import '../../../data/constants/app_colors.dart';
import '../../../data/constants/app_icons.dart';
import '../../../data/constants/app_navigator.dart';
import '../../../data/constants/app_utils.dart';
import '../../../data/constants/text_styles.dart';
import '../../../data/models/todo_model.dart';
import '../../add_event_page/add_event_page.dart';

class DetailsHeader extends StatelessWidget {
  final TodoModel todo;

  const DetailsHeader({
    required this.todo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return SizedBox(
      height: screenSize.height * .35,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.blueColor,
          borderRadius: AppUtils.bBottom20,
        ),
        child: Padding(
          padding: AppUtils.pAll15,
          child: ListView(
            children: [
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      AppNavigator.navigatorPop(context);
                    },
                    child: const CircleAvatar(
                      radius: 25,
                      backgroundColor: AppColors.textFieldColor,
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        size: 20,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      AppNavigator.navigatorPush(
                        context,
                        AddEventPage(todo: todo),
                      );
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: AssetImage(AppIcons.edit),
                          height: 25,
                        ),
                        Text(
                          "Edit",
                          style: AppTextStyles.edit,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                todo.eventName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.eventName,
              ),
              const SizedBox(height: 5),
              Text(
                todo.eventDescription,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.eventDescription,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.watch_later,
                    color: AppColors.whiteColor,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    todo.time,
                    style: AppTextStyles.whiteFont600,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: AppColors.whiteColor,
                  ),
                  SizedBox(
                    width: screenSize.width * .8,
                    child: Text(
                      todo.eventLocation,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppTextStyles.whiteFont600,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../data/constants/app_colors.dart';
import '../../../data/constants/app_utils.dart';
import '../../../data/constants/text_styles.dart';
import '../../../data/models/todo_model.dart';

class TodoHolder extends StatelessWidget {
  final TodoModel todo;
  const TodoHolder({
    required this.todo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final MaterialColor selectedColor = AppColors.primaries[todo.priorityColor];
    return Padding(
      padding: AppUtils.pAll8,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: AppUtils.bAll8,
          color: selectedColor.shade600,
        ),
        child: Padding(
          padding: AppUtils.pTop12,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: selectedColor.shade100,
              borderRadius: AppUtils.bBottom8,
            ),
            child: Padding(
              padding: AppUtils.pLeft8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    todo.eventName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppTextStyles.eventTitle(todo.priorityColor),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    todo.eventDescription,
                    overflow: TextOverflow.clip,
                    maxLines: 2,
                    style: TextStyle(
                      color: selectedColor.shade700,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Row(
                    children: [
                      Icon(
                        Icons.watch_later,
                        color: selectedColor.shade700,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        todo.time,
                        style: TextStyle(
                          color: selectedColor.shade700,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 7),
                      Icon(
                        Icons.location_on,
                        color: selectedColor.shade700,
                      ),
                      SizedBox(
                        width: screenSize.width * .45,
                        child: Text(
                          todo.eventLocation,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: selectedColor.shade700,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

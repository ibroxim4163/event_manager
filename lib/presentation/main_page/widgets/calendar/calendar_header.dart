import 'package:flutter/material.dart';

import '../../../../data/constants/app_colors.dart';
import '../../../../data/constants/app_utils.dart';
import '../../../../data/constants/text_styles.dart';
import 'custom_calendar.dart';

class Header extends StatelessWidget {
  const Header({
    required this.selectedMonth,
    required this.selectedDate,
    required this.onChange,
    super.key,
  });

  final DateTime selectedMonth;
  final DateTime? selectedDate;

  final void Function(DateTime) onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppUtils.pAll8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            getMonthName(selectedMonth.month),
            textAlign: TextAlign.center,
            style: AppTextStyles.calendatMonth,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  onChange(selectedMonth.addMonth(-1));
                },
                child: const CircleAvatar(
                  radius: 15,
                  backgroundColor: AppColors.textFieldColor,
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 12,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              GestureDetector(
                onTap: () {
                  onChange(selectedMonth.addMonth(1));
                },
                child: const CircleAvatar(
                  radius: 15,
                  backgroundColor: AppColors.textFieldColor,
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 12,
                    color: AppColors.blackColor,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

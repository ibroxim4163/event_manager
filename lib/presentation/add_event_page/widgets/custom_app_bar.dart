import 'package:flutter/material.dart';

import '../../../data/constants/app_colors.dart';
import '../../../data/constants/app_utils.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      leading: Padding(
        padding: AppUtils.pTop12Left10,
        child: IconButton(
          focusColor: AppColors.transparent,
          hoverColor: AppColors.transparent,
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.arrowBackColor,
          ),
        ),
      ),
    );
  }
}

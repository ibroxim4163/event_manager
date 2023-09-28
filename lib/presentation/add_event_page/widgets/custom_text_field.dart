import 'package:flutter/material.dart';

import '../../../data/constants/app_colors.dart';
import '../../../data/constants/app_utils.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final int maxLines;
  final Widget? suffix;
  final String? Function(String?)? validator;
  const CustomTextField({
    required this.controller,
    required this.hint,
    this.maxLines = 1,
    this.validator,
    this.suffix,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffix,
        fillColor: AppColors.textFieldColor,
        filled: true,
        focusedBorder: const OutlineInputBorder(
          borderRadius: AppUtils.bAll8,
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: AppUtils.bAll8,
          borderSide: BorderSide.none,
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: AppUtils.bAll8,
          borderSide: BorderSide(
            color: AppColors.redColor,
            width: 1,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: AppUtils.bAll8,
          borderSide: BorderSide(
            color: AppColors.redColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}

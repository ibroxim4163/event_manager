import 'package:flutter/material.dart';

import '../../../data/constants/app_colors.dart';
import '../../../data/constants/app_icons.dart';
import '../../../data/constants/app_utils.dart';

class CustomDropDownButton extends StatefulWidget {
  final ValueNotifier<int> colorIndex;
  const CustomDropDownButton({
    required this.colorIndex,
    super.key,
  });

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  MaterialColor selectedColor = AppColors.primaries.first;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 40,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: AppUtils.bAll8,
          color: AppColors.textFieldColor,
        ),
        child: DropdownButton(
          alignment: Alignment.centerLeft,
          borderRadius: AppUtils.bAll8,
          underline: const SizedBox(),
          hint: Padding(
            padding: AppUtils.pAll8,
            child: SizedBox(
              height: 25,
              width: 20,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(selectedColor.value),
                  borderRadius: AppUtils.bAll8,
                ),
              ),
            ),
          ),
          iconEnabledColor: AppColors.blueColor,
          icon: const Image(
            image: AssetImage(
              AppIcons.arrowDown,
            ),
            height: 24,
          ),
          padding: AppUtils.pLeft8,
          items: List.generate(
            AppColors.primaries.length,
            (index) => DropdownMenuItem(
              value: AppColors.primaries[index],
              child: SizedBox(
                height: 20,
                width: 23,
                child: ColoredBox(
                  color: AppColors.primaries[index],
                ),
              ),
            ),
          ),
          onChanged: (newValue) {
            selectedColor = newValue ?? selectedColor;
            setState(() {});
            widget.colorIndex.value = (AppColors.primaries
                .indexOf(newValue ?? AppColors.primaries.first));
          },
        ),
      ),
    );
  }
}

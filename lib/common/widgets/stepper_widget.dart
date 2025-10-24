import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class StepperWidget extends StatelessWidget {
  final List items;
  final int selectedIndex;
  const StepperWidget({super.key, required this.items, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(items.length, (index) {
        return Container(
          height: 6,
          width: selectedIndex == index ? 15 : 6,
          margin: EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: selectedIndex == index ? AppColors.primary : AppColors.greyBarelyMedium,
          ),
        );
      }),
    );
  }
}

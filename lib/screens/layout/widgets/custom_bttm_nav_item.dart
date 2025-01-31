import 'package:flutter/material.dart';
import 'package:islami_app/core/themes/appcolors.dart';

class CustomBttmNavItem extends StatelessWidget {
  String icon;
  bool isSelected;

  CustomBttmNavItem({super.key, required this.icon, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color:
            isSelected ? AppColors.Black.withOpacity(0.5) : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ImageIcon(AssetImage(icon)),
    );
  }
}

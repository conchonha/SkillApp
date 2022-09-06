import 'package:flutter/material.dart';
import 'package:life_skills_app/resources/app_color.dart';

class LifeSkillChip extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isSelected;

  LifeSkillChip({@required this.text, this.onTap, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            color: isSelected ? AppColor.h44A1FF : AppColor.hF5F4FF,
            borderRadius: BorderRadius.circular(200)),
        child: Text(
          text ?? '',
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isSelected ? AppColor.hFFFFFF : AppColor.h44A1FF),
        ),
      ),
    );
  }
}

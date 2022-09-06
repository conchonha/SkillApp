import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:life_skills_app/models/life_skill_model.dart';
import 'package:life_skills_app/resources/app_color.dart';

class LifeSkillItem extends StatelessWidget {
  final LifeSkillModel data;

  LifeSkillItem(this.data);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 20),
          child: SvgPicture.asset(data.icon, width: 20, height: 20),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(color: data.color.withOpacity(0.3), blurRadius: 20)
          ], color: data.color, borderRadius: BorderRadius.circular(15)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            data.title ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColor.h6B6B6B, fontSize: 12),
          ),
        )
      ],
    );
  }
}

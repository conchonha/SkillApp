import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:life_skills_app/resources/app_color.dart';

class LifeSkillsTabIcon extends BottomNavigationBarItem {
  final String drawable;

  LifeSkillsTabIcon({@required this.drawable})
      : super(icon: SvgPicture.asset(drawable), label: '');

  @override
  Widget get icon => SvgPicture.asset(drawable);

  @override
  Widget get activeIcon => SvgPicture.asset(
        drawable,
        color: AppColor.h44A1FF,
      );

  @override
  Color get backgroundColor => AppColor.hFFFFFF;
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:life_skills_app/resources/app_color.dart';
import 'package:life_skills_app/resources/app_drawable.dart';

class SlideMenuIcon extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback onTap;

  SlideMenuIcon({@required this.icon, @required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 19),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Text(
                text ?? '',
                style: TextStyle(
                    fontSize: 14,
                    color: AppColor.h5E5E5E,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Spacer(),
            SvgPicture.asset(AppDrawable.ic_dropdown)
          ],
        ),
      ),
    );
  }
}

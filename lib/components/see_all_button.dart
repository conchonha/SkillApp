import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:life_skills_app/generated/l10n.dart';
import 'package:life_skills_app/resources/app_color.dart';
import 'package:life_skills_app/resources/app_drawable.dart';

class SeeAllButton extends StatelessWidget {
  final VoidCallback onTap;

  SeeAllButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S.of(context).lbl_see_all,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColor.h44A1FF),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: SvgPicture.asset(AppDrawable.ic_arrow_down),
          )
        ],
      ),
    );
  }
}

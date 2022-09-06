import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:life_skills_app/generated/l10n.dart';
import 'package:life_skills_app/resources/app_color.dart';
import 'package:life_skills_app/resources/app_drawable.dart';

class InviteButton extends StatelessWidget {
  final VoidCallback onTap;

  InviteButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        decoration: BoxDecoration(
            color: AppColor.h44A1FF, borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).btn_invite,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColor.hFFFFFF),
            ),
            SizedBox(width: 10),
            SvgPicture.asset(
              AppDrawable.ic_arrow_down,
              color: AppColor.hFFFFFF,
            )
          ],
        ),
      ),
    );
  }
}

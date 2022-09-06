import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:life_skills_app/resources/app_color.dart';

class UtilitiesIcon extends StatelessWidget {
  final String icon;
  final String text;

  UtilitiesIcon({@required this.icon, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          child: SvgPicture.asset(icon),
          decoration: BoxDecoration(
              color: AppColor.hF5F4FF, borderRadius: BorderRadius.circular(15)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            text,
            style: TextStyle(fontSize: 12, color: AppColor.h5E5E5E),
          ),
        )
      ],
    );
  }
}

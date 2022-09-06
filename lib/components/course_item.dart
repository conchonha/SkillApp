import 'package:flutter/material.dart';
import 'package:life_skills_app/generated/l10n.dart';
import 'package:life_skills_app/models/course_model.dart';
import 'package:life_skills_app/resources/app_color.dart';

import 'invite_button.dart';

class CourseItem extends StatelessWidget {
  final CourseModel data;

  CourseItem(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: AppColor.hFFFFFF,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(color: AppColor.h000000.withOpacity(0.1), blurRadius: 10)
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(
              data.image,
              width: 148,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  data.title ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: TextStyle(
                      fontSize: 14,
                      color: AppColor.h5E5E5E,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  S.of(context).lbl_opening_date(data.openingDate),
                  style: TextStyle(fontSize: 12, color: AppColor.h828282),
                ),
                Spacer(),
                InviteButton()
              ],
            ),
          ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:life_skills_app/models/new_course_model.dart';
import 'package:life_skills_app/resources/app_color.dart';

class NewCourseItem extends StatelessWidget {
  final NewCourseModel data;

  NewCourseItem(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 219,
      width: 290,
      margin: const EdgeInsets.only(right: 27, top: 10, bottom: 20, left: 10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(blurRadius: 10, color: AppColor.h000000.withOpacity(0.15))
      ], color: AppColor.hFFFFFF, borderRadius: BorderRadius.circular(6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6), topRight: Radius.circular(6)),
              child: Image.asset(data.image)),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Text(
              data.category ?? '',
              style: TextStyle(fontSize: 12, color: AppColor.h5E5E5E),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                data.title ?? '',
                style: TextStyle(
                    fontSize: 14,
                    color: AppColor.h44A1FF,
                    fontWeight: FontWeight.w600),
              ))
        ],
      ),
    );
  }
}

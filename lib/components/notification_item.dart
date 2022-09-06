import 'package:flutter/material.dart';
import 'package:life_skills_app/models/notification_model.dart';
import 'package:life_skills_app/resources/app_color.dart';
import 'package:life_skills_app/resources/app_drawable.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel data;
  final VoidCallback onTap;

  NotificationItem({@required this.data, this.onTap});

  @override
  Widget build(BuildContext context) {
    String subString1, subString2, subString3;

    subString1 = data.title;

    if (data.highLight != null && data.highLight.isNotEmpty) {
      final index = data.title.indexOf(data.highLight);

      if (index >= 0) {
        subString1 = data.title.substring(0, index);
        subString2 = data.title.substring(index, data.highLight.length + index);
        subString3 = data.title.substring(index + data.highLight.length);
      }
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        color: data.isRead ? Colors.transparent : AppColor.hEDFAFF,
        padding:
            const EdgeInsets.only(top: 17, bottom: 17, right: 20, left: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: SizedBox(
                width: 30,
                height: 30,
                child: Image.asset(AppDrawable.img_avatar),
              ),
            ),
            SizedBox(width: 19),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: subString1,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.h5E5E5E),
                  ),
                  if (subString2 != null)
                    TextSpan(
                        text: subString2,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColor.h00A3FF)),
                  if (subString3 != null)
                    TextSpan(
                        text: subString3,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColor.h5E5E5E))
                ])),
                Text(
                  data.createdDate,
                  style: TextStyle(fontSize: 12, color: AppColor.h6B6B6B),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

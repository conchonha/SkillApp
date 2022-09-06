import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:life_skills_app/pages/notification/notification_viewmodel.dart';
import 'package:life_skills_app/resources/app_color.dart';
import 'package:life_skills_app/resources/app_drawable.dart';
import 'package:provider/provider.dart';

class NotificationIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationVM>(
        builder: (ctx, provider, _) => Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 21, bottom: 6),
                  child: SvgPicture.asset(AppDrawable.ic_notify),
                ),
                Visibility(
                  visible: provider.count > 0,
                  child: Positioned(
                    child: Container(
                        constraints: BoxConstraints(minWidth: 18),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            color: AppColor.hEF5F5F, shape: BoxShape.circle),
                        child: Text(
                          provider.count.toString(),
                          style:
                              TextStyle(fontSize: 11, color: AppColor.hFFFFFF),
                        )),
                    top: 0,
                    right: 10,
                  ),
                )
              ],
            ));
  }
}

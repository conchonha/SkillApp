import 'package:flutter/material.dart';
import 'package:life_skills_app/components/notification_item.dart';
import 'package:life_skills_app/generated/l10n.dart';
import 'package:life_skills_app/resources/app_color.dart';
import 'package:provider/provider.dart';

import 'notification_viewmodel.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 304,
      color: AppColor.hFFFFFF,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 35,
                  left: 20,
                  bottom: 20),
              child: Text(
                S.of(context).title_notification,
                style: TextStyle(
                    color: AppColor.h5E5E5E,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              )),
          Expanded(
              child: Consumer<NotificationVM>(
                builder: (ctx, provider, _) => ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: (_, index) => NotificationItem(
                      data: provider.listNotify[index],
                      onTap: () {
                        provider.readNotify(index);
                      }),
                  itemCount: provider.listNotify.length,
                ),
              ))
        ],
      ),
    );
  }
}

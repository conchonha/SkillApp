import 'package:flutter/material.dart';
import 'package:life_skills_app/generated/l10n.dart';
import 'package:life_skills_app/resources/app_color.dart';
import 'package:life_skills_app/resources/app_drawable.dart';

import 'slide_menu_icon.dart';

class SlideLeftMenu extends StatelessWidget {
  final VoidCallback onHome;
  final VoidCallback onLesson;
  final VoidCallback onSupport;
  final VoidCallback onSetting;
  final VoidCallback onUtilities;

  SlideLeftMenu(
      {this.onHome,
      this.onLesson,
      this.onSupport,
      this.onSetting,
      this.onUtilities});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 20, right: 26, top: MediaQuery.of(context).padding.top + 65),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(200),
            child: SizedBox(
              width: 60,
              height: 60,
              child: Image.asset(AppDrawable.img_avatar),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'Minh Châu Nguyễn',
              style: TextStyle(
                  fontSize: 20,
                  color: AppColor.h5E5E5E,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SlideMenuIcon(
                    icon: AppDrawable.ic_slide_account,
                    text: S.of(context).lbl_account_manager,
                  ),
                  SlideMenuIcon(
                    icon: AppDrawable.ic_slide_home,
                    text: S.of(context).lbl_home,
                    onTap: () {
                      onHome?.call();
                      Navigator.of(context).pop();
                    },
                  ),
                  SlideMenuIcon(
                    icon: AppDrawable.ic_slide_graduation,
                    text: S.of(context).lbl_lesson,
                    onTap: () {
                      onLesson?.call();
                      Navigator.of(context).pop();
                    },
                  ),
                  SlideMenuIcon(
                    icon: AppDrawable.ic_slide_help,
                    text: S.of(context).lbl_support,
                    onTap: () {
                      onSupport?.call();
                      Navigator.of(context).pop();
                    },
                  ),
                  SlideMenuIcon(
                    icon: AppDrawable.ic_slide_setting,
                    text: S.of(context).lbl_manager,
                    onTap: () {
                      onSetting?.call();
                      Navigator.of(context).pop();
                    },
                  ),
                  SlideMenuIcon(
                    icon: AppDrawable.ic_slide_utilities,
                    text: S.of(context).lbl_utilities,
                    onTap: () {
                      onUtilities?.call();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

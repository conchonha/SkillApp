import 'package:flutter/material.dart';
import 'package:life_skills_app/base/base_page.dart';
import 'package:life_skills_app/components/life_skill_chip.dart';
import 'package:life_skills_app/generated/l10n.dart';
import 'package:provider/provider.dart';

import 'all_course_page.dart';
import 'list_course_page.dart';
import 'tab_course_viewmodel.dart';

class TabCoursePage extends StatefulWidget {
  static const index = 1;

  TabCoursePage({Key key}) : super(key: key);

  @override
  TabCoursePageState createState() => TabCoursePageState();
}

class TabCoursePageState extends State<TabCoursePage>
    with AutomaticKeepAliveClientMixin<TabCoursePage> {
  final model = TabCourseVM();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BasePage<TabCourseVM>(
        model: model,
        child: Stack(children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15, top: 15, bottom: 27),
                height: 30,
                child: _TopTabBar(),
              ),
              Expanded(
                child: Consumer<TabCourseVM>(
                    builder: (ctx, provider, _) => PageView(
                          controller: provider.pageController,
                          children: [
                            ListCoursePage(provider.lastCourses),
                            AllCoursePage(provider.courses),
                            ...provider.courses.values
                                .map((value) => ListCoursePage(value))
                          ],
                        )),
              ),
            ],
          ),
          Consumer<TabCourseVM>(
            builder: (ctx, provider, _) => Visibility(
              visible: provider.searching,
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: ListCoursePage(provider.resultSearch),
              ),
            ),
          )
        ]));
  }

  void search(String value) {
    model.search(value);
  }

  void closeSearch() {
    model.closeSearch();
  }

  void searching() {
    model.startSearch();
  }

  @override
  bool get wantKeepAlive => true;
}

class _TopTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TabCourseVM>(
        builder: (ctx, provider, _) => ListView(
              scrollDirection: Axis.horizontal,
              children: [
                LifeSkillChip(
                    text: S.of(context).lbl_course_last,
                    isSelected: provider.current == 0,
                    onTap: () {
                      provider.selectTab(0);
                    }),
                LifeSkillChip(
                    text: S.of(context).lbl_course_all,
                    isSelected: provider.current == 1,
                    onTap: () {
                      provider.selectTab(1);
                    }),
                ...provider.courses.keys.map((k) {
                  final index = provider.courses.keys.toList().indexOf(k) + 2;
                  return LifeSkillChip(
                      text: k,
                      isSelected: provider.current == index,
                      onTap: () {
                        provider.selectTab(index);
                      });
                })
              ],
            ));
  }
}

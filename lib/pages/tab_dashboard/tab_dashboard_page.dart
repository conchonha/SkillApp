import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:life_skills_app/base/base_page.dart';
import 'package:life_skills_app/components/life_skill_item.dart';
import 'package:life_skills_app/components/new_course_item.dart';
import 'package:life_skills_app/components/new_item.dart';
import 'package:life_skills_app/components/see_all_button.dart';
import 'package:life_skills_app/generated/l10n.dart';
import 'package:life_skills_app/resources/app_color.dart';
import 'package:life_skills_app/resources/app_drawable.dart';
import 'package:life_skills_app/resources/app_style.dart';
import 'package:provider/provider.dart';

import 'tab_dashboard_viewmodel.dart';

class TabDashBoardPage extends StatefulWidget {
  static const index = 0;

  TabDashBoardPage({Key key}) : super(key: key);

  @override
  _TabDashBoardPageState createState() => _TabDashBoardPageState();
}

class _TabDashBoardPageState extends State<TabDashBoardPage>
    with AutomaticKeepAliveClientMixin<TabDashBoardPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BasePage<TabDashBoardVM>(
        model: TabDashBoardVM(),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    S.of(context).lbl_header_life_skill,
                    style: AppStyle.headerTitle,
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(bottom: 30, left: 15, right: 15),
                    child: _LifeSkillGroup()),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 23, left: 15, right: 15),
                  child: _BannerDescription(),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          S.of(context).lbl_header_news,
                          style: AppStyle.headerTitle,
                        ),
                        Spacer(),
                        SeeAllButton()
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(
                        top: 14, bottom: 53, left: 15, right: 15),
                    child: _News()),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                          S.of(context).lbl_header_new_course,
                          style: AppStyle.headerTitle,
                        ),
                        Spacer(),
                        SeeAllButton()
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 14, left: 5, right: 5),
                  child: Container(
                    height: 239,
                    child: _NewCourses(),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}

class _LifeSkillGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TabDashBoardVM>(builder: (ctx, provider, _) {
      final axisCount = 4;
      final widthItem =
          (MediaQuery.of(context).size.width - 50 - 10 * (axisCount - 1)) /
              axisCount;
      final heightItem = 125;

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: axisCount,
              crossAxisSpacing: 10,
              childAspectRatio: widthItem / heightItem),
          itemBuilder: (_, index) => LifeSkillItem(provider.skills[index]),
          itemCount: provider.skills.length,
        ),
      );
    });
  }
}

class _BannerDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TabDashBoardVM>(
        builder: (ctx, provider, _) => AspectRatio(
              aspectRatio: 345 / 185,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 21),
                child: Stack(fit: StackFit.expand, children: [
                  SvgPicture.asset(AppDrawable.bg_banner_description),
                  CarouselSlider.builder(
                    itemCount: provider.banners.length,
                    options: CarouselOptions(
                        viewportFraction: 1,
                        autoPlay: true,
                        onPageChanged: (page, reason) {
                          provider.updateSlider(page);
                        }),
                    itemBuilder: (ctx, int index) => Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Column(
                        children: [
                          Text(
                            provider.banners[index].title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColor.hFFFFFF,
                                fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              provider.banners[index].description ?? '',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColor.hFFFFFF,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: provider.banners.map((b) {
                          int index = provider.banners.indexOf(b);
                          return Container(
                            width: 5,
                            height: 5,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: provider.currentSlider == index
                                  ? AppColor.h7466F7
                                  : AppColor.hFFFFFF,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  )
                ]),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        colors: [AppColor.hAE6FFF, AppColor.h44A1FF])),
              ),
            ));
  }
}

class _News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TabDashBoardVM>(builder: (ctx, provider, _) {
      final axisCount = 2;
      final widthItem =
          (MediaQuery.of(context).size.width - 30 - (axisCount - 1) * 15) /
              axisCount;
      final heightItem = widthItem + 45;

      return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: axisCount,
            crossAxisSpacing: 15,
            mainAxisSpacing: 25,
            childAspectRatio: widthItem / heightItem),
        itemBuilder: (_, index) => NewItem(provider.news[index]),
        itemCount: provider.news.length,
      );
    });
  }
}

class _NewCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TabDashBoardVM>(builder: (ctx, provider, _) {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => NewCourseItem(provider.courses[index]),
        itemCount: provider.courses.length,
      );
    });
  }
}

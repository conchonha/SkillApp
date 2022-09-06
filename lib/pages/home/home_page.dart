import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:life_skills_app/components/life_skills_appbar.dart';
import 'package:life_skills_app/components/life_skills_tab_icon.dart';
import 'package:life_skills_app/components/slide_left_menu.dart';
import 'package:life_skills_app/generated/l10n.dart';
import 'package:life_skills_app/pages/notification/notification_page.dart';
import 'package:life_skills_app/pages/notification/notification_viewmodel.dart';
import 'package:life_skills_app/pages/tab_courses/tab_course_page.dart';
import 'package:life_skills_app/pages/tab_dashboard/tab_dashboard_page.dart';
import 'package:life_skills_app/resources/app_color.dart';
import 'package:life_skills_app/resources/app_drawable.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int current = 0;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  PageController _pageController = PageController();
  GlobalKey<TopAppBarState> _appBarKey = GlobalKey();
  GlobalKey<TabCoursePageState> tabCourseKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      _appBarKey.currentState?.offSearch();

      switch (_pageController.page.toInt()) {
        case TabCoursePage.index:
          tabCourseKey.currentState?.closeSearch();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<NotificationVM>(
              create: (_) => NotificationVM()),
        ],
        child: Scaffold(
          key: _drawerKey,
          drawer: Drawer(
            child: SlideLeftMenu(
              onHome: () {
                setState(() {
                  current = TabDashBoardPage.index;
                });

                _pageController.animateToPage(TabDashBoardPage.index,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear);
              },
            ),
          ),
          endDrawer: Drawer(child: NotificationPage()),
          appBar: LifeSkillsAppBar(
            context,
            keyTop: _appBarKey,
            onTapLeading: () {
              _drawerKey.currentState?.openDrawer();
            },
            isDashBoard: current == TabDashBoardPage.index,
            hasSearch: current != TabDashBoardPage.index,
            title: title,
            onNotification: () {
              _drawerKey.currentState?.openEndDrawer();
            },
            onSearch: (value) {
              switch (current) {
                case TabCoursePage.index:
                  tabCourseKey.currentState?.search(value);
                  break;
              }
            },
            onCloseSearch: () {
              switch (current) {
                case TabCoursePage.index:
                  tabCourseKey.currentState?.closeSearch();
                  break;
              }
            },
            onSearching: () {
              switch (current) {
                case TabCoursePage.index:
                  tabCourseKey.currentState?.searching();
                  break;
              }
            },
          ),
          body: PageView(
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              TabDashBoardPage(),
              TabCoursePage(key: tabCourseKey),
              Container(),
              Container(),
              Container()
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: current,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: AppColor.hFFFFFF,
            onTap: (page) {
              setState(() {
                current = page;
              });

              _pageController.animateToPage(page,
                  duration: Duration(milliseconds: 300), curve: Curves.linear);
            },
            items: [
              LifeSkillsTabIcon(drawable: AppDrawable.ic_home),
              LifeSkillsTabIcon(drawable: AppDrawable.ic_book),
              LifeSkillsTabIcon(drawable: AppDrawable.ic_map_marker),
              LifeSkillsTabIcon(drawable: AppDrawable.ic_location),
              BottomNavigationBarItem(
                  label: '',
                  backgroundColor: AppColor.hFFFFFF,
                  icon: SvgPicture.asset(AppDrawable.ic_message),
                  activeIcon: SvgPicture.asset(AppDrawable.ic_message,
                      color: AppColor.h44A1FF)),
            ],
          ),
        ));
  }

  String get title {
    switch (current) {
      case TabCoursePage.index:
        return S.of(context).title_course;
      case 4:
        return S.of(context).title_message;
    }

    return 'Xin chào Minh Châu';
  }
}

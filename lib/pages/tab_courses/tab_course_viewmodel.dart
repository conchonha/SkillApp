import 'package:flutter/cupertino.dart';
import 'package:life_skills_app/base/base_viewmodel.dart';
import 'package:life_skills_app/models/course_model.dart';
import 'package:life_skills_app/resources/app_drawable.dart';

class TabCourseVM extends BaseViewModel {
  Map<String, List<CourseModel>> courses = {
    'Nhận biết bản thân': [
      CourseModel(
          title: 'Kỹ năng thể hiện bản thân',
          openingDate: '24/05/2020',
          image: AppDrawable.img_new_1),
      CourseModel(
          title: 'Kỹ năng xác định mục tiêu',
          openingDate: '24/05/2020',
          image: AppDrawable.img_new_4),
      CourseModel(
          title: 'Kỹ năng quản lý thời gian của bản thân',
          openingDate: '24/05/2020',
          image: AppDrawable.img_new_5)
    ],
    'Sống cùng tập thể': [
      CourseModel(
          title: 'Kỹ năng lắng nghe tích cực',
          openingDate: '24/05/2020',
          image: AppDrawable.img_new_6),
      CourseModel(
          title: 'Kỹ năng thể hiện sự cảm thông chia sẻ',
          openingDate: '24/05/2020',
          image: AppDrawable.img_new_3),
    ],
    'Giải quyết vấn đề': [
      CourseModel(
          title: 'Kỹ năng thể hiện bản thân',
          openingDate: '24/05/2020',
          image: AppDrawable.img_new_1),
      CourseModel(
          title: 'Kỹ năng thể hiện bản thân',
          openingDate: '24/05/2020',
          image: AppDrawable.img_new_2),
      CourseModel(
          title: 'Kỹ năng thể hiện bản thân',
          openingDate: '24/05/2020',
          image: AppDrawable.img_new_5)
    ],
  };

  final pageController = PageController();

  List<CourseModel> resultSearch = [];

  List<CourseModel> get lastCourses {
    List<CourseModel> list = [];

    courses.forEach((key, c) {
      list.addAll(c);
    });

    return list;
  }

  int current = 0;
  bool searching = false;

  @override
  void onInit() {
    pageController.addListener(() {
      current = pageController.page.toInt();
      notifyListeners();
    });
  }

  void selectTab(int index) {
    if (current == index) return;

    current = index;
    notifyListeners();

    pageController.animateToPage(current,
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  void search(String value) {
    searching = true;
    resultSearch = lastCourses
        .where((c) => c.title.toLowerCase().contains(value))
        .toList();
    notifyListeners();
  }

  void closeSearch() {
    searching = false;
    resultSearch = [];
    notifyListeners();
  }

  void startSearch() {
    searching = true;
    notifyListeners();
  }
}

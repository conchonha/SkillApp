import 'package:flutter/material.dart';
import 'package:life_skills_app/base/base_viewmodel.dart';
import 'package:life_skills_app/models/banner_model.dart';
import 'package:life_skills_app/models/new_course_model.dart';
import 'package:life_skills_app/models/life_skill_model.dart';
import 'package:life_skills_app/models/new_model.dart';
import 'package:life_skills_app/resources/app_drawable.dart';

class TabDashBoardVM extends BaseViewModel {
  List<LifeSkillModel> skills = [
    LifeSkillModel(
        title: 'Nhận biết bản thân',
        color: Color(0xFF01C1FF),
        icon: AppDrawable.ic_skill_know_myself),
    LifeSkillModel(
        title: 'Sống cùng tập thể',
        color: Color(0xFFFFA441),
        icon: AppDrawable.ic_skill_live_together),
    LifeSkillModel(
        title: 'Giải quyết vấn đề',
        color: Color(0xFFED48FF),
        icon: AppDrawable.ic_skill_problem_solving),
    LifeSkillModel(
        title: 'An toàn trong cuộc sống',
        color: Color(0xFF00DB04),
        icon: AppDrawable.ic_skill_safety_life),
    LifeSkillModel(
        title: 'Làm chủ cảm xúc',
        color: Color(0xFFFF26A4),
        icon: AppDrawable.ic_skill_control_feeling),
    LifeSkillModel(
        title: 'Tìm kiếm sự hỗ trợ',
        color: Color(0xFF44A1FF),
        icon: AppDrawable.ic_skill_find_support),
    LifeSkillModel(
        title: 'Tìm kiếm việc làm',
        color: Color(0xFFFF3F60),
        icon: AppDrawable.ic_skill_find_job),
    LifeSkillModel(
        title: 'Sức khỏe sinh sản',
        color: Color(0xFF7466F7),
        icon: AppDrawable.ic_skill_reproductive_health),
  ];

  List<BannerModel> banners = [
    BannerModel(
        title: 'Định hướng nghề nghiệp như thế nào cho phù hợp?',
        description:
            'Cho các em tham gia những buổi trải nghiệm, vào vai các vở kịch, chia sẻ thêm công việc, nghề nghiệp trong các tiết dạy...'),
    BannerModel(
        title: 'Định hướng nghề nghiệp như thế nào cho phù hợp?',
        description:
            'Cho các em tham gia những buổi trải nghiệm, vào vai các vở kịch, chia sẻ thêm công việc, nghề nghiệp trong các tiết dạy...'),
    BannerModel(
        title: 'Định hướng nghề nghiệp như thế nào cho phù hợp?',
        description:
            'Cho các em tham gia những buổi trải nghiệm, vào vai các vở kịch, chia sẻ thêm công việc, nghề nghiệp trong các tiết dạy...'),
    BannerModel(
        title: 'Định hướng nghề nghiệp như thế nào cho phù hợp?',
        description:
            'Cho các em tham gia những buổi trải nghiệm, vào vai các vở kịch, chia sẻ thêm công việc, nghề nghiệp trong các tiết dạy...'),
    BannerModel(
        title: 'Định hướng nghề nghiệp như thế nào cho phù hợp?',
        description:
            'Cho các em tham gia những buổi trải nghiệm, vào vai các vở kịch, chia sẻ thêm công việc, nghề nghiệp trong các tiết dạy...'),
  ];

  int currentSlider = 0;

  List<NewModel> news = [
    NewModel(title: 'Bắt đầu bằng một bước chân', image: AppDrawable.img_new_1),
    NewModel(
        title: 'Con đến trường, cha mẹ lo nơm nớp',
        image: AppDrawable.img_new_2),
    NewModel(title: 'Bắt đầu bằng một bước chân', image: AppDrawable.img_new_3),
    NewModel(
        title: 'Con đến trường, cha mẹ lo nơm nớp',
        image: AppDrawable.img_new_4),
    NewModel(title: 'Bắt đầu bằng một bước chân', image: AppDrawable.img_new_5),
    NewModel(
        title: 'Con đến trường, cha mẹ lo nơm nớp',
        image: AppDrawable.img_new_6),
  ];

  List<NewCourseModel> courses = [
    NewCourseModel(
      image: AppDrawable.img_new_course,
      category: 'Nhận biết bản thân',
      title: 'Kỹ năng sống tích cực',
    ),
    NewCourseModel(
      image: AppDrawable.img_new_course,
      category: 'Nhận biết bản thân',
      title: 'Kỹ năng sống tích cực',
    ),
  ];

  @override
  void onInit() {}

  void updateSlider(int page) {
    currentSlider = page;
    notifyListeners();
  }
}

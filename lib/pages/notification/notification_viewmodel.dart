import 'package:life_skills_app/base/base_viewmodel.dart';
import 'package:life_skills_app/models/notification_model.dart';

class NotificationVM extends BaseViewModel {
  List<NotificationModel> listNotify = [
    NotificationModel(
        isRead: false,
        title:
            'Lớp kỹ năng tìm kiếm việc làm sẽ khai giảng vào ngày 21/10/2020',
        highLight: 'tìm kiếm việc làm',
        createdDate: '3 minutes ago'),
    NotificationModel(
        title: 'Thông báo nâng cấp phiên bản v1.3 từ ban quản trị hệ thống',
        createdDate: 'Hôm qua, 20:30'),
    NotificationModel(
        title: 'Chương trình ưu đãi giảm 20%  khoá học kỹ năng Làm chủ cảm xúc',
        highLight: 'Làm chủ cảm xúc',
        createdDate: '12/07/2020'),
    NotificationModel(
        title: 'Thông báo nâng cấp phiên bản v1.2 từ ban quản trị hệ thống',
        createdDate: '04/05/2020'),
    NotificationModel(
        title: 'Thông báo nâng cấp phiên bản v1.1 từ ban quản trị hệ thống',
        createdDate: '16/02/2020')
  ];

  int get count => listNotify.where((n) => !n.isRead).length;

  @override
  void onInit() {
    print('onInt');
  }

  void readNotify(int index) {
    listNotify[index].isRead = true;
    notifyListeners();
  }
}

class NotificationModel {
  bool isRead;
  final String title;
  final String highLight;
  final String createdDate;

  NotificationModel(
      {this.isRead = true, this.title, this.createdDate, this.highLight});
}

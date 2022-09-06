import 'package:flutter/material.dart';
import 'package:life_skills_app/services/remote/api_client.dart';
import 'package:life_skills_app/utils/shared_prefs.dart';

import 'di/locator.dart';

abstract class BaseViewModel extends ChangeNotifier {
  final api = locator<ApiClient>();
  final prefs = locator<SharedPrefs>();
  bool isShowLoading = false;
  VoidCallback onLoading;
  VoidCallback onHideLoading;

  @protected
  void onInit();

  void showLoading() {
    isShowLoading = true;
    onLoading?.call();
  }

  void hideLoading() {
    if (isShowLoading) {
      isShowLoading = false;
      hideLoading?.call();
    }
  }
}

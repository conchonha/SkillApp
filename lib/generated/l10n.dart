// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Kỹ Năng Sống`
  String get app_name {
    return Intl.message(
      'Kỹ Năng Sống',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Tiện ích`
  String get lbl_utilities {
    return Intl.message(
      'Tiện ích',
      name: 'lbl_utilities',
      desc: '',
      args: [],
    );
  }

  /// `Hồ sơ`
  String get lbl_profile {
    return Intl.message(
      'Hồ sơ',
      name: 'lbl_profile',
      desc: '',
      args: [],
    );
  }

  /// `Cài đặt`
  String get lbl_setting {
    return Intl.message(
      'Cài đặt',
      name: 'lbl_setting',
      desc: '',
      args: [],
    );
  }

  /// `Tham khảo`
  String get lbl_find {
    return Intl.message(
      'Tham khảo',
      name: 'lbl_find',
      desc: '',
      args: [],
    );
  }

  /// `Hướng dẫn`
  String get lbl_help {
    return Intl.message(
      'Hướng dẫn',
      name: 'lbl_help',
      desc: '',
      args: [],
    );
  }

  /// `Quản lý tài khoản`
  String get lbl_account_manager {
    return Intl.message(
      'Quản lý tài khoản',
      name: 'lbl_account_manager',
      desc: '',
      args: [],
    );
  }

  /// `Trang chủ`
  String get lbl_home {
    return Intl.message(
      'Trang chủ',
      name: 'lbl_home',
      desc: '',
      args: [],
    );
  }

  /// `Lớp học`
  String get lbl_lesson {
    return Intl.message(
      'Lớp học',
      name: 'lbl_lesson',
      desc: '',
      args: [],
    );
  }

  /// `Hỗ trợ`
  String get lbl_support {
    return Intl.message(
      'Hỗ trợ',
      name: 'lbl_support',
      desc: '',
      args: [],
    );
  }

  /// `Quản trị`
  String get lbl_manager {
    return Intl.message(
      'Quản trị',
      name: 'lbl_manager',
      desc: '',
      args: [],
    );
  }

  /// `Tin nhắn`
  String get title_message {
    return Intl.message(
      'Tin nhắn',
      name: 'title_message',
      desc: '',
      args: [],
    );
  }

  /// `Thông báo`
  String get title_notification {
    return Intl.message(
      'Thông báo',
      name: 'title_notification',
      desc: '',
      args: [],
    );
  }

  /// `Kỹ năng sống`
  String get lbl_header_life_skill {
    return Intl.message(
      'Kỹ năng sống',
      name: 'lbl_header_life_skill',
      desc: '',
      args: [],
    );
  }

  /// `Tin tức`
  String get lbl_header_news {
    return Intl.message(
      'Tin tức',
      name: 'lbl_header_news',
      desc: '',
      args: [],
    );
  }

  /// `Khoá học mới`
  String get lbl_header_new_course {
    return Intl.message(
      'Khoá học mới',
      name: 'lbl_header_new_course',
      desc: '',
      args: [],
    );
  }

  /// `Xem tất cả`
  String get lbl_see_all {
    return Intl.message(
      'Xem tất cả',
      name: 'lbl_see_all',
      desc: '',
      args: [],
    );
  }

  /// `Mới nhất`
  String get lbl_course_last {
    return Intl.message(
      'Mới nhất',
      name: 'lbl_course_last',
      desc: '',
      args: [],
    );
  }

  /// `Tất cả`
  String get lbl_course_all {
    return Intl.message(
      'Tất cả',
      name: 'lbl_course_all',
      desc: '',
      args: [],
    );
  }

  /// `Khóa học`
  String get title_course {
    return Intl.message(
      'Khóa học',
      name: 'title_course',
      desc: '',
      args: [],
    );
  }

  /// `Khai giảng: {date}`
  String lbl_opening_date(Object date) {
    return Intl.message(
      'Khai giảng: $date',
      name: 'lbl_opening_date',
      desc: '',
      args: [date],
    );
  }

  /// `Tham gia`
  String get btn_invite {
    return Intl.message(
      'Tham gia',
      name: 'btn_invite',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:life_skills_app/pages/notification/notification_viewmodel.dart';
import 'package:life_skills_app/resources/app_color.dart';
import 'package:provider/provider.dart';

import 'base/di/locator.dart';
import 'generated/l10n.dart';
import 'pages/home/home_page.dart';
import 'utils/shared_prefs.dart';

void main() async => {
      Provider.debugCheckInvalidValueType = null,
      WidgetsFlutterBinding.ensureInitialized(),
      setUpInjector(),
      await locator<SharedPrefs>().initialise(),
      runApp(LifeSkillsApp()),
    };

class LifeSkillsApp extends StatelessWidget {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kỹ Năng Sống',
      locale: Locale('vi'),
      key: navigatorKey,
      onGenerateTitle: (_) => S.of(_).app_name,
      theme: ThemeData(
        backgroundColor: AppColor.hFFFFFF,
        scaffoldBackgroundColor: AppColor.hFFFFFF,
        primaryColor: AppColor.h1885FF,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'OpenSans',
      ),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: HomePage(),
    );
  }
}

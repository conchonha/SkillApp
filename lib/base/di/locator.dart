import 'package:get_it/get_it.dart';
import 'package:life_skills_app/services/remote/api_client.dart';
import 'package:life_skills_app/utils/shared_prefs.dart';

GetIt locator = GetIt.instance;

void setUpInjector() {
  locator.registerLazySingleton(() => SharedPrefs());
  locator.registerLazySingleton(() => ApiClient());
}

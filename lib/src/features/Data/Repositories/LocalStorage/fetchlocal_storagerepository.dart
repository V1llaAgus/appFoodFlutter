import 'package:foodapp/src/features/Domain/Interfaces/interfaces.dart';

import 'package:shared_preferences/shared_preferences.dart';

class DefaultFetchLocalStorageRepository extends FetchLocalStorageRepository {
  //DEPENDENCIAS

  final SharedPreferences _prefs =
      SharedPreferences.getInstance() as SharedPreferences;

  @override
  Future<String?> fetchInLocalStorage({required String key}) async {
    final SharedPreferences prefs = _prefs;
    return  prefs.getString(key);
  }
}

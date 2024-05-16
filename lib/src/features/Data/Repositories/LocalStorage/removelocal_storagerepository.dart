import 'package:foodapp/src/features/Domain/Interfaces/interfaces.dart';

import 'package:shared_preferences/shared_preferences.dart';

class DefaultRemoveLocalStorageRepository extends RemoveLocalStorageRepository {
  //DEPENDENCIAS
  final SharedPreferences _prefs =
      SharedPreferences.getInstance() as SharedPreferences;

  @override
  Future<void> removeInLocalStorage({required String key}) async {
    final SharedPreferences prefs = _prefs;
    prefs.remove(key);
  }
}

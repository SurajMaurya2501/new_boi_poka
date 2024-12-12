import "package:sample_app/data/datasources/shared_preference_impl.dart";

class SharedPrefController {
  final SharedPreferenceImpl sharedPrefImpl = SharedPreferenceImpl();

  Future<String> getData(String key) async => await sharedPrefImpl.getData(key);

  Future<void> setData(String key, String value) async {
    await sharedPrefImpl.storeData(key, value);
  }

  Future<void> deleteData(String key) async {
    await sharedPrefImpl.deleteData(key);
  }

  Future<void> setBool(String key, bool value) async {
    await sharedPrefImpl.storeBool(key, value);
  }

  Future<bool> getBool(String key) async => sharedPrefImpl.getBool(key);
}

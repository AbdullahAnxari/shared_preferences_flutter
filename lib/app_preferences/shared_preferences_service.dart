import 'package:dartz/dartz.dart';
import 'package:shared_preferences_flutter/contants/shared_pre_keys.dart';
import '../shared_preferences_flutter.dart';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  late SharedPreferences _preferences;


  SharedPreferencesService._();

  static Future<SharedPreferencesService> getInstance() async {
    _instance ??= SharedPreferencesService._();
    _instance!._preferences = await SharedPreferences.getInstance();

    return _instance!;
  }

  //*SetStringData 
  Future<Either<String, void>> setStringData({required String name}) async {
    try {
      await _preferences.setString(SharedPreferencesKeys.nameKey, name);
      return right(null);
    } catch (e) {
      return left('Fail to set string data');
    }
  }

  //*setIntData
  Future<Either<String, void>> setIntData({required int age}) async {
    try {
      await _preferences.setInt(SharedPreferencesKeys.ageKey, age);
      return right(null);
    } catch (e) {
      return left('Fail to set int data');
    }
  }

  //*setBoolData
  Future<Either<String, void>> setBoolData({required bool isregister}) async {
    try {
      await _preferences.setBool(
          SharedPreferencesKeys.isRegisterKey, isregister);
      return right(null);
    } catch (e) {
      return left('Fail to set bool data');
    }
  }

  //*GetString
  Future<Either<String, String?>> getStringData() async {
    try {
      final String? name =
          _preferences.getString(SharedPreferencesKeys.nameKey);
      return right(name);
    } catch (e) {
      return left('Fail to get String data');
    }
  }

  //*GetInt
  Future<Either<String, int?>> getIntData() async {
    try {
      final int? age = _preferences.getInt(SharedPreferencesKeys.ageKey);
      return right(age);
    } catch (e) {
      return left('Fail to get int data');
    }
  }

  //*GetBool
  Future<Either<String, bool?>> getBoolData() async {
    try {
      final bool? isregister =
          _preferences.getBool(SharedPreferencesKeys.isRegisterKey);
      return right(isregister);
    } catch (e) {
      return left('Fail to get bool data');
    }
  }

  //*removedata
  Future<Either<String, String>> removeData(var data) async {
    try {
      await _preferences.remove(data);
      // ... remove other specific values as needed

      return right('Data removed successfully');
    } catch (e) {
      return left('Fail to remove data');
    }
  }

  //*ClearData
  Future<Either<String, String>> clearAllData() async {
    try {
      await _preferences.clear();

      return right('All data cleared');
    } catch (e) {
      return left('Fail to remove data');
    }
  }

  //*Setmodel
  Future<Either<String, void>> setModelData({required HomeModel model}) async {
    try {
      await _preferences.setString(
          SharedPreferencesKeys.modelKey, model.toJson());
      return right(null);
    } catch (e) {
      return left('Fail to set model data');
    }
  }

  //*getmodel
  Either<String, HomeModel?> getModelData() {
    try {
      final result = _preferences.getString(SharedPreferencesKeys.modelKey);
      debugPrint('GetHomeModelData: $result');
      return right(result != null ? HomeModel.fromJson(result) : null);
    } catch (e) {
      return left('Fail to get model');
    }
  }
}

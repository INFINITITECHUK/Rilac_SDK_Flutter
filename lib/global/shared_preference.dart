import 'package:shared_preferences/shared_preferences.dart';

import 'global_cache.dart';

class SharedPrefs {
  SharedPreferences? _sharedPrefs;

  SharedPrefs(){
    SharedPreferences.getInstance().then((prefs) {
      _sharedPrefs = prefs;
    });
  }


//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  static saveConfig({required String baseURL, required String userName, required String userPassword, required String module, required String customerMobileNumber}) {
    SharedPreferences.getInstance().then((prefs) async => {
      await prefs.setString("rilac_baseURL", baseURL),
      await prefs.setString("rilac_userName", userName),
      await prefs.setString("rilac_userPassword", userPassword),
      await prefs.setString("rilac_module", module),
      await prefs.setString("rilac_customerMobileNumber", customerMobileNumber),
    });
  }

  static Future<String> getBaseURL() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("rilac_baseURL") ?? "";
  }
  String get baseURL => _sharedPrefs?.getString("rilac_baseURL") ?? globalBaseURL;

  static Future<String> getUserName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("rilac_userName") ?? globalUserName;
  }
  String get userName => _sharedPrefs?.getString("rilac_userName") ?? globalUserName;

  static Future<String> getUserPassword() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("rilac_userPassword") ?? globalUserPassword;
  }
  String get userPassword => _sharedPrefs?.getString("rilac_userPassword") ?? globalUserPassword;

  static Future<String> getModule() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("rilac_module") ?? globalModule;
  }
  String get module => _sharedPrefs?.getString("rilac_module") ?? globalModule;

  static Future<String> getCustomerMobileNumber() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("rilac_customerMobileNumber") ?? globalCustomerMobileNumber;
  }
  String get customerMobileNumber => _sharedPrefs?.getString("rilac_customerMobileNumber") ?? globalCustomerMobileNumber;
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  static saveDeviceInfo({required String deviceOS, required String deviceBrand, required String deviceModel, required String deviceId}) {
    SharedPreferences.getInstance().then((prefs) async => {
      await prefs.setString("rilac_deviceOS", deviceOS),
      await prefs.setString("rilac_deviceBrand", deviceBrand),
      await prefs.setString("rilac_deviceModel", deviceModel),
      await prefs.setString("rilac_deviceId", deviceId),
    });
  }

  static Future<String> getDeviceOS() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("rilac_deviceOS") ?? "";
  }
  String get deviceOS => _sharedPrefs?.getString("rilac_deviceOS") ?? "";

  static Future<String> getDeviceBrand() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("rilac_deviceBrand") ?? "";
  }
  String get deviceBrand => _sharedPrefs?.getString("rilac_deviceBrand") ?? "";

  static Future<String> getDeviceModel() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("rilac_deviceModel") ?? "";
  }
  String get deviceModel => _sharedPrefs?.getString("rilac_deviceModel") ?? "";

  static Future<String> getDeviceId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("rilac_deviceId") ?? "";
  }
  String get deviceId => _sharedPrefs?.getString("rilac_deviceId") ?? "";
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::




//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  static Future<void> saveTokens({required String accessToken, required String refreshToken}) async {
    SharedPreferences.getInstance().then((prefs) async => {
      await prefs.setString("rilac_accessToken", accessToken),
      await prefs.setString("rilac_refreshToken", refreshToken),
    });
  }

  static Future<String> getAccessToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("rilac_accessToken") ?? "";
  }
  String get accessToken => _sharedPrefs?.getString("rilac_accessToken") ?? "";

  static Future<String> getRefreshToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("rilac_refreshToken") ?? "";
  }
  String get refreshToken => _sharedPrefs?.getString("rilac_refreshToken") ?? "";
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

}

final sharedPreference = SharedPrefs();
import 'dart:io';
import 'package:device_info/device_info.dart';

import 'api_repository/api_repository.dart';
import 'api_repository/model/LoginBodyModel.dart';
import 'global/functions.dart';
import 'global/global_cache.dart';
import 'global/shared_preference.dart';

class RedltdRilac extends Functions{

  RedltdRilac();

  RedltdRilac.config({required String baseURL, required String userName, required String userPassword, required String module, required String customerMobileNumber}) {
    globalBaseURL = baseURL;
    globalModule = module;
    globalUserName = userName;
    globalUserPassword = userPassword;
    globalCustomerMobileNumber = customerMobileNumber;

    SharedPrefs.getBaseURL().then((value) => {
      if(value.isEmpty){
        SharedPrefs.saveConfig(baseURL: baseURL,
            userName: userName,
            userPassword: userPassword,
            module: module,
            customerMobileNumber: customerMobileNumber),
      }
    });
    SharedPrefs.getAccessToken().then((value) => {
      if(value.isEmpty){
        _getDeviceInfo(baseURL: baseURL,
            userName: userName,
            userPassword: userPassword,
            module: module,
            customerMobileNumber: customerMobileNumber),
      }
    });
  }

  _getDeviceInfo({required String baseURL, required String userName, required String userPassword, required String module, required String customerMobileNumber}) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    late AndroidDeviceInfo androidInfo;
    late IosDeviceInfo iosInfo;

    if (Platform.isAndroid) {
      androidInfo = await deviceInfo.androidInfo;
    } else if (Platform.isIOS) {
      iosInfo = await deviceInfo.iosInfo;
    }

    // Device information
    String deviceOS = Platform.isAndroid ? androidInfo.version.release : iosInfo.systemVersion;
    String deviceBrand = Platform.isAndroid ? androidInfo.brand : 'Apple';
    String deviceModel = Platform.isAndroid ? androidInfo.model : iosInfo.utsname.machine;
    String uniqueId = Platform.isAndroid ? androidInfo.androidId : iosInfo.identifierForVendor;

    SharedPrefs.saveDeviceInfo(deviceOS: "q", deviceBrand: "q", deviceModel: "q", deviceId: "q");

    LoginBodyModel bodyModel = LoginBodyModel(username: userName, password: userPassword, cusMobileno: customerMobileNumber, phoneOs: "q", phoneBrand: "q", deviceId: "q", phoneModel: "q");
    await _repository.login(body: bodyModel, baseUrl: baseURL, module: module);
  }

  final Repository _repository = Repository();

  @override
  Future<String> getProjectInfo() async {
    return "";
  }

  @override
  Future<dynamic> getMyPoint() async {
    return await _repository.getMyPoint();
  }

  @override
  Future<dynamic> getVoucherList({required String longitude, required String latitude, int page = 0, int limit = 0, String merchantId = ""}) async {
    return await _repository.getVoucherList(longitude: latitude, latitude: latitude, page: page, limit: limit, merchantId: merchantId);
  }

  @override
  Future<dynamic> getVoucherDetails({required String voucherId}) {
    return _repository.getVoucherDetails(voucherId: voucherId);
  }

  @override
  Future<dynamic> purchaseVoucher({required String voucherId, required bool purchaseByCash, String transactionId = "", String accountId = "", String transactionDatetime = "", num amount = 0.0}) {
    return _repository.purchaseVoucher(voucherId: voucherId, purchaseByCash: purchaseByCash, transactionId: transactionId, accountId: accountId, amount: amount);
  }

  @override
  Future<dynamic> getPurchaseVoucherList({String merchantId = "", int page = 1, int limit = 20}) {
    return _repository.getPurchaseVoucherList(merchantId: merchantId, page: page, limit: limit);
  }


}

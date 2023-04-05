import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../api_services/DioExceptions.dart';
import '../api_services/api_service.dart';
import '../global/global_cache.dart';
import '../global/shared_preference.dart';
import 'model/LoginBodyModel.dart';
import 'model/PurchaseVoucherBodyModel.dart';
import 'model/RefreshTokenBodyModel.dart';
import 'model/UserInfoResponseModel.dart';

class Repository{

  final Dio _dio = Dio();

  login({required LoginBodyModel body, required String baseUrl, required String module}) async {
    try{
      Response response = await _dio.post(baseUrl + loginURL, data: body.toJson(), options: Options(headers: {'module': module},));
      var userInfoResponseModel = UserInfoResponseModel.fromJson(response.data);
      debugPrint("Plugin configuration successful");
      if(userInfoResponseModel.issuccess ?? false){
        SharedPrefs.saveTokens(accessToken: userInfoResponseModel.payload?.accessToken ?? "", refreshToken: userInfoResponseModel.payload?.refreshToken ?? "");
      }
    }catch(e){
      DioExceptions.fromDioError(dioError: e as DioError).toString();
      var response = e.response?.data;
      debugPrint("Plugin login response-> ${response == null ? e.message : response.toString()}");
    }
  }


  Future<dynamic> refreshToken(Future<dynamic> Function() callback) async {
    try{
      var module = await SharedPrefs.getModule();
      module = module.isEmpty ? globalModule : module;
      var body = RefreshTokenBodyModel(refreshToken: await SharedPrefs.getRefreshToken(), phoneOs: await SharedPrefs.getDeviceOS(), phoneBrand: await SharedPrefs.getDeviceBrand(), deviceId: await SharedPrefs.getDeviceId(), phoneModel: await SharedPrefs.getDeviceModel());
      Response response = await _dio.post(refreshTokenURL, data: body.toJson(), options: Options(headers: {'module': module},));
      var userInfoResponseModel = UserInfoResponseModel.fromJson(response.data);
      if(userInfoResponseModel.issuccess ?? false){
        await SharedPrefs.saveTokens(accessToken: userInfoResponseModel.payload?.accessToken ?? "", refreshToken: userInfoResponseModel.payload?.refreshToken ?? "");
        return await callback();
      }
    }catch(e){
      DioExceptions.fromDioError(dioError: e as DioError).toString();
      var response = e.response?.data;
      debugPrint("Plugin refreshToken-> ${response == null ? e.message : response.toString()}");
    }
  }


  Future<dynamic> getMyPoint() async {
    try{
      var module = await SharedPrefs.getModule();
      var accessToken = await SharedPrefs.getAccessToken();
      module = module.isEmpty ? globalModule : module;

      Response response = await _dio.get(myPointURL, options: Options(headers: {'module': module, 'Authorization': "Bearer $accessToken"},));
      return await response.data;
    }catch(e){
      DioExceptions.fromDioError(dioError: e as DioError);
      if(e.response?.statusCode! == 401){
        return DioExceptions.unauthorized(() => getMyPoint());
      }else{
        return e;
      }
    }
  }


  Future<dynamic> getVoucherList({required String longitude, required String latitude, int page = 1, int limit = 20, String merchantId = ""}) async {
    try{
      var module = await SharedPrefs.getModule();
      var accessToken = await SharedPrefs.getAccessToken();
      module = module.isEmpty ? globalModule : module;

      Map<String, dynamic>? queryParameters;
      if(merchantId.isEmpty){
        queryParameters = {
          "long" : longitude,
          "lat" : latitude,
          "page" : page,
          "limit" : limit
        };
      }else{
        queryParameters = {
          "long" : longitude,
          "lat" : latitude,
          "page" : page,
          "limit" : limit,
          "merchantid" : merchantId
        };
      }

      Response response = await _dio.get(getVoucherListURL, queryParameters: queryParameters, options: Options(headers: {'module': module, 'Authorization': "Bearer $accessToken"},));
      return await response.data;
    }catch(e){
      DioExceptions.fromDioError(dioError: e as DioError);
      if(e.response?.statusCode! == 401){
        return DioExceptions.unauthorized(() => getVoucherList(longitude: latitude, latitude: latitude, page: page, limit: limit, merchantId: merchantId));
      }else{
        return e;
      }
    }
  }


  Future<dynamic> getVoucherDetails({required String voucherId}) async {
    try{
      var module = await SharedPrefs.getModule();
      var accessToken = await SharedPrefs.getAccessToken();
      module = module.isEmpty ? globalModule : module;

      Map<String, dynamic>? queryParameters = {
        "voucherid" : voucherId
      };

      Response response = await _dio.get(getVoucherDetailsURL, queryParameters: queryParameters, options: Options(headers: {'module': module, 'Authorization': "Bearer $accessToken"},));
      return await response.data;
    }catch(e){
      DioExceptions.fromDioError(dioError: e as DioError);
      if(e.response?.statusCode! == 401){
        return DioExceptions.unauthorized(() => getVoucherDetails(voucherId: voucherId));
      }else{
        return e;
      }
    }
  }

  Future<dynamic> purchaseVoucher({required String voucherId, required bool purchaseByCash, String transactionId = "", String accountId = "", String transactionDatetime = "", num amount = 0.0}) async {
    try{
      var module = await SharedPrefs.getModule();
      var accessToken = await SharedPrefs.getAccessToken();
      module = module.isEmpty ? globalModule : module;

      PurchaseVoucherBodyModel body = PurchaseVoucherBodyModel(voucherid: voucherId, purchaseByCash: purchaseByCash, transectionid: transactionId, accountid: accountId, transectionDatetime: transactionDatetime, amount: amount);

      Response response = await _dio.post(getPurchaseVoucherURL, data: body.toJson(), options: Options(headers: {'module': module, 'Authorization': "Bearer $accessToken"},));
      return await response.data;
    }catch(e){
      DioExceptions.fromDioError(dioError: e as DioError);
      if(e.response?.statusCode! == 401){
        return DioExceptions.unauthorized(() => purchaseVoucher(voucherId: voucherId, purchaseByCash: purchaseByCash, transactionId: transactionId, accountId: accountId, transactionDatetime: transactionDatetime, amount: amount));
      }else{
        return e;
      }
    }
  }

  Future<dynamic> getPurchaseVoucherList({String merchantId = "", int page = 1, int limit = 20}) async {
    try{
      var module = await SharedPrefs.getModule();
      var accessToken = await SharedPrefs.getAccessToken();
      module = module.isEmpty ? globalModule : module;

      Map<String, dynamic>? queryParameters;
      if(merchantId.isNotEmpty){
        queryParameters = {
          "merchantid" : merchantId,
          "page" : page,
          "limit" : limit
        };
      }else{
        queryParameters = {
          "page" : page,
          "limit" : limit
        };
      }


      Response response = await _dio.get(getPurchaseVoucherListURL, queryParameters: queryParameters, options: Options(headers: {'module': module, 'Authorization': "Bearer $accessToken"},));
      return await response.data;
    }catch(e){
      DioExceptions.fromDioError(dioError: e as DioError);
      if(e.response?.statusCode! == 401){
        return DioExceptions.unauthorized(() => getPurchaseVoucherList(merchantId: merchantId, page: page, limit: limit));
      }else{
        return e;
      }
    }
  }

  Future<dynamic> getPurchaseVoucherDetails({required String voucherCode}) async {
    try{
      var module = await SharedPrefs.getModule();
      var accessToken = await SharedPrefs.getAccessToken();
      module = module.isEmpty ? globalModule : module;

      Map<String, dynamic>? queryParameters = {
        "voucher_code" : voucherCode
      };

      Response response = await _dio.get(getPurchaseVoucherDetailsURL, queryParameters: queryParameters, options: Options(headers: {'module': module, 'Authorization': "Bearer $accessToken"},));
      return await response.data;
    }catch(e){
      DioExceptions.fromDioError(dioError: e as DioError);
      if(e.response?.statusCode! == 401){
        return DioExceptions.unauthorized(() => getPurchaseVoucherDetails(voucherCode: voucherCode));
      }else{
        return e;
      }
    }
  }
}
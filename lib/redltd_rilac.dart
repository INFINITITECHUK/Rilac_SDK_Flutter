import 'dart:io';
import 'package:device_info/device_info.dart';

import 'api_repository/api_repository.dart';
import 'api_repository/model/LoginBodyModel.dart';
import 'global/functions.dart';
import 'global/global_cache.dart';
import 'global/shared_preference.dart';

/*........... Note: Please do not try to change any code or comment ..........*/

// This is a class named RedltdRilac that extends the Functions class. It can be used to
// configure and access the RedltdRilac module using the provided parameters.
class RedltdRilac extends Functions{

// Default constructor
  RedltdRilac();

// Parameterized constructor that sets the base URL, username, password, module name, and customer mobile number
// Note: All parameters are required and must be provided when creating a new instance of this class.
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


    SharedPrefs.saveDeviceInfo(deviceOS: deviceOS, deviceBrand: deviceBrand, deviceModel: deviceModel, deviceId: uniqueId);
    // SharedPrefs.saveDeviceInfo(deviceOS: "q", deviceBrand: "q", deviceModel: "q", deviceId: "q");

    LoginBodyModel bodyModel = LoginBodyModel(username: userName, password: userPassword, cusMobileno: customerMobileNumber, phoneOs: "q", phoneBrand: "q", deviceId: "q", phoneModel: "q");
    await _repository.login(body: bodyModel, baseUrl: baseURL, module: module);
  }

  final Repository _repository = Repository();

  @override
  Future<String> getProjectInfo() async {
    return "";
  }

// This method uses async/await to return a Future<dynamic> that retrieves
// the user's points from a repository. It waits for the repository to
// return the data using the await keyword, and then returns the result.
// Note: The return type of Future<dynamic> indicates that the data can
// be of any type, and its type will be determined at runtime.
  @override
  Future<dynamic> getMyPoint() async {
    // Wait for the repository to retrieve the data
    return await _repository.getMyPoint();
  }


// This method uses async/await to return a Future<dynamic> that retrieves
// a list of vouchers from a repository based on the provided parameters.
// The parameters are used to filter the list based on location, page and
// limit, and merchant ID (if provided).
// Note: The 'required' keyword is used to indicate that the 'longitude' and
// 'latitude' parameters must be provided when calling the method.
// The default values of 'page' and 'limit' are 1 and 20 respectively, which means
// by default the method returns the first page of the voucher list with 20 items per page.
// The 'merchantId' parameter is optional and can be an empty string if not
// needed.
  @override
  Future<dynamic> getVoucherList({required String longitude, required String latitude, int page = 1, int limit = 20, String merchantId = ""}) async {
    // Wait for the repository to retrieve the voucher list using the
    // provided parameters
    return await _repository.getVoucherList(longitude: latitude, latitude: latitude, page: page, limit: limit, merchantId: merchantId);
  }


// This method returns a Future<dynamic> that retrieves the details of a
// specific voucher based on the provided voucher ID.
// Note: The 'required' keyword is used to indicate that the 'voucherId'
// parameter must be provided when calling the method.
  @override
  Future<dynamic> getVoucherDetails({required String voucherId}) {
    // Retrieve the voucher details from the repository using the provided voucher ID
    return _repository.getVoucherDetails(voucherId: voucherId);
  }


// This method returns a Future<dynamic> that performs a voucher purchase based on the
// provided parameters. The parameters include the voucher ID, whether the purchase
// was made by cash or not, an optional transaction ID, account ID, transaction date and time,
// and the purchase amount (if not made by cash).
// Note: The 'required' keyword is used to indicate that the 'voucherId' and 'purchaseByCash'
// parameters must be provided when calling the method. The 'transactionId', 'accountId',
// and 'amount' parameters are optional and can be empty or zero if not needed.
// [purchaseByCash] == true [transactionId], [accountId], [transactionDatetime], and [amount] are required parameters.
// [purchaseByCash] == false [transactionId], [accountId], [transactionDatetime], and [amount] are optional parameters.
  @override
  Future<dynamic> purchaseVoucher({required String voucherId, required bool purchaseByCash, String transactionId = "", String accountId = "", String transactionDatetime = "", num amount = 0.0}) {
    // Purchase the voucher using the provided parameters
    return _repository.purchaseVoucher(voucherId: voucherId, purchaseByCash: purchaseByCash, transactionId: transactionId, accountId: accountId, amount: amount);
  }


// This method returns a Future<dynamic> that retrieves a list of purchased vouchers
// based on the provided parameters. The parameters include an optional merchant ID,
// and the page and limit for pagination.
// The 'page' parameter is used to specify the page number, and the 'limit' parameter is
// used to specify the maximum number of items to be returned per page.
// By default, the method retrieves the first page with 20 items per page.
// The 'merchantId' parameter is optional and can be an empty string if not needed.
  @override
  Future<dynamic> getPurchaseVoucherList({String merchantId = "", int page = 1, int limit = 20}) {
    // Retrieve the purchased voucher list from the repository using the provided parameters
    return _repository.getPurchaseVoucherList(merchantId: merchantId, page: page, limit: limit);
  }


// This method returns a Future<dynamic> that retrieves the details of a purchased voucher
// based on the provided voucher code.
// Note: The 'required' keyword is used to indicate that the 'voucherCode'
// parameter must be provided when calling the method.
  @override
  Future<dynamic> getPurchaseVoucherDetails({required String voucherCode}) {
    // Retrieve the purchased voucher details from the repository using the provided voucher code
    return _repository.getPurchaseVoucherDetails(voucherCode: voucherCode);
  }


// This method returns a Future<dynamic> that marks a purchased voucher as used
// based on the provided voucher code.
// Note: The 'required' keyword is used to indicate that the 'voucherCode'
// parameter must be provided when calling the method.
  @override
  Future<dynamic> useVoucher({required String voucherCode}) {
    // Mark the purchased voucher as used using the provided voucher code
    return _repository.useVoucher(voucherCode: voucherCode);
  }


// This method returns a Future<dynamic> that sends a purchased voucher as a gift
// to the provided mobile number using the provided voucher code.
// Note: The 'required' keyword is used to indicate that the 'voucherCode'
// and 'sendToMobileNumber' parameters must be provided when calling the method.
  @override
  Future<dynamic> giftVoucher({required String voucherCode, required String sendToMobileNumber}) {
    // Share the purchased voucher using the provided voucher code and mobile number
    return _repository.shareVoucher(voucherCode: voucherCode, sendToMobileNumber: sendToMobileNumber);
  }


// This method returns a Future<dynamic> that transfers points to a business or individual
// based on the provided keyword and transfer amount.
// Note: The 'required' keyword is used to indicate that the 'keyword' and 'transferAmount'
// parameters must be provided when calling the method.
// [keyword] = “C2CP” & “C2MP”
// [sendToMobileNumber].isNotEmpty [keyword] = “C2CP”
// [businessId].isNotEmpty [keyword] = “C2MP”
  @override
  Future<dynamic> transferPoints({String businessId = "", String sendToMobileNumber = "", required String keyword, required num transferAmount}) {
    // Share the points with a business or individual using the provided parameters
    return _repository.sharePoints(businessId: businessId, sendToMobileNumber: sendToMobileNumber, keyword: keyword, transferAmount: transferAmount);
  }


// This method returns a Future<dynamic> that retrieves the user's point expense history
// based on the provided limit and page parameters.
// Note: The 'limit' parameter indicates the maximum number of records to return,
// and the 'page' parameter indicates the page number of the results to retrieve.
  @override
  Future pointExpenseHistory({int limit = 20, int page = 1}) {
    // Retrieve the user's point expense history using the provided parameters
    return _repository.pointExpenseHistory(limit: limit, page: page);
  }


// This method returns a Future<dynamic> that retrieves the user's point earn history
// based on the provided limit and page parameters.
// Note: The 'limit' parameter indicates the maximum number of records to return,
// and the 'page' parameter indicates the page number of the results to retrieve.
  @override
  Future pointEarnHistory({int limit = 20, int page = 1}) {
    // Retrieve the user's point earn history using the provided parameters
    return _repository.pointEarnHistory(limit: limit, page: page);
  }



}

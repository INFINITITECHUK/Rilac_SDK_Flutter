
import 'package:redltd_rilac/global/shared_preference.dart';

String baseURL = sharedPreference.baseURL;

String loginURL = "auth/v1/login";
String refreshTokenURL = "${baseURL}auth/v1/refresh-token";

String myPointURL = "${baseURL}point/v1/mypoint";
String getVoucherListURL = "${baseURL}voucher/v1/list";
String getVoucherDetailsURL = "${baseURL}voucher/v1/details";
String getPurchaseVoucherURL = "${baseURL}voucher-purchase/v1/purchase";

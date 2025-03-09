
import 'package:redltd_rilac/global/shared_preference.dart';

String baseURL = sharedPreference.baseURL;

String loginURL = "auth/v1/login";
String refreshTokenURL = "${baseURL}auth/v1/refresh-token";

String myPointURL = "${baseURL}point/v1/mypoint";
String getVoucherListURL = "${baseURL}voucher/v1/list";
String getVoucherDetailsURL = "${baseURL}voucher/v1/details";
String getPurchaseVoucherURL = "${baseURL}voucher-purchase/v1/purchase";
String getPurchaseVoucherListURL = "${baseURL}voucher-purchase/v1/purchase-list";
String getPurchaseVoucherDetailsURL = "${baseURL}voucher-purchase/v1/details";
String useVoucherURL = "${baseURL}voucher-use/v1/use";
String shareVoucherURL = "${baseURL}voucher/v1/share";
String sharePointURL = "${baseURL}point/v1/pointTransfer";
String pointExpenseHistoryURL = "${baseURL}point/v1/point-expence-history";
String pointEarnHistoryURL = "${baseURL}point/v1/point-earn-history";

/// promotion

String getLocationWisePromotionURL = "${baseURL}rasapi/promotion/getlocationwisepromotion";
String promotionURL = "${baseURL}rasapi/promotion";
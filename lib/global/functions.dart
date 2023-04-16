

abstract class Functions{

  Future<String> getProjectInfo();

  Future<dynamic> getMyPoint();

  Future<dynamic> getVoucherList({required String longitude, required String latitude, int page = 0, int limit = 0, String merchantId = ""});

  Future<dynamic> getVoucherDetails({required String voucherId});

  Future<dynamic> purchaseVoucher({required String voucherId, required bool purchaseByCash, String transactionId = "", String accountId = "", String transactionDatetime = "", num amount = 0.0});

  Future<dynamic> getPurchaseVoucherList({String merchantId = "", int page = 0, int limit = 0});

  Future<dynamic> getPurchaseVoucherDetails({required String voucherCode});

  Future<dynamic> useVoucher({required String voucherCode});

  Future<dynamic> shareVoucher({required String voucherCode, required String sendToMobileNumber});

  Future<dynamic> sharePoints({String businessId = "", String sendToMobileNumber = "", required String keyword, required num transferAmount});

  Future<dynamic> pointExpenseHistory({int limit = 0, int page = 0});
}




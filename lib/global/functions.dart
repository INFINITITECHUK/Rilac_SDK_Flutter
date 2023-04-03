

abstract class Functions{

  Future<String> getProjectInfo();

  Future<dynamic> getMyPoint();

  Future<dynamic> getVoucherList({required String longitude, required String latitude, int page = 0, int limit = 0, String merchantId = ""});

  Future<dynamic> getVoucherDetails({required String voucherId});

  Future<dynamic> purchaseVoucher({required String voucherId, required bool purchaseByCash, String transactionId = "", String accountId = "", String transactionDatetime = "", num amount = 0.0});
}




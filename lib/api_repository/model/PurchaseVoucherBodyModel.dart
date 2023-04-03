/// voucherid : "PD00203"
/// purchase_by_cash : true
/// transectionid : "123"
/// accountid : "1223"
/// transection_datetime : "123"
/// amount : 5

class PurchaseVoucherBodyModel {
  PurchaseVoucherBodyModel({
      String? voucherid, 
      bool? purchaseByCash, 
      String? transectionid, 
      String? accountid, 
      String? transectionDatetime, 
      num? amount,}){
    _voucherid = voucherid;
    _purchaseByCash = purchaseByCash;
    _transectionid = transectionid;
    _accountid = accountid;
    _transectionDatetime = transectionDatetime;
    _amount = amount;
}

  PurchaseVoucherBodyModel.fromJson(dynamic json) {
    _voucherid = json['voucherid'];
    _purchaseByCash = json['purchase_by_cash'];
    _transectionid = json['transectionid'];
    _accountid = json['accountid'];
    _transectionDatetime = json['transection_datetime'];
    _amount = json['amount'];
  }
  String? _voucherid;
  bool? _purchaseByCash;
  String? _transectionid;
  String? _accountid;
  String? _transectionDatetime;
  num? _amount;
PurchaseVoucherBodyModel copyWith({  String? voucherid,
  bool? purchaseByCash,
  String? transectionid,
  String? accountid,
  String? transectionDatetime,
  num? amount,
}) => PurchaseVoucherBodyModel(  voucherid: voucherid ?? _voucherid,
  purchaseByCash: purchaseByCash ?? _purchaseByCash,
  transectionid: transectionid ?? _transectionid,
  accountid: accountid ?? _accountid,
  transectionDatetime: transectionDatetime ?? _transectionDatetime,
  amount: amount ?? _amount,
);
  String? get voucherid => _voucherid;
  bool? get purchaseByCash => _purchaseByCash;
  String? get transectionid => _transectionid;
  String? get accountid => _accountid;
  String? get transectionDatetime => _transectionDatetime;
  num? get amount => _amount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['voucherid'] = _voucherid;
    map['purchase_by_cash'] = _purchaseByCash;
    map['transectionid'] = _transectionid;
    map['accountid'] = _accountid;
    map['transection_datetime'] = _transectionDatetime;
    map['amount'] = _amount;
    return map;
  }

}
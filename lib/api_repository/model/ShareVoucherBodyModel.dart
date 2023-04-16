/// voucher_code : "VP-0017"
/// to_mobile_no : "1234567890"

class ShareVoucherBodyModel {
  ShareVoucherBodyModel({
      String? voucherCode, 
      String? toMobileNo,}){
    _voucherCode = voucherCode;
    _toMobileNo = toMobileNo;
}

  ShareVoucherBodyModel.fromJson(dynamic json) {
    _voucherCode = json['voucher_code'];
    _toMobileNo = json['to_mobile_no'];
  }
  String? _voucherCode;
  String? _toMobileNo;
  ShareVoucherBodyModel copyWith({  String? voucherCode,
  String? toMobileNo,
}) => ShareVoucherBodyModel(  voucherCode: voucherCode ?? _voucherCode,
  toMobileNo: toMobileNo ?? _toMobileNo,
);
  String? get voucherCode => _voucherCode;
  String? get toMobileNo => _toMobileNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['voucher_code'] = _voucherCode;
    map['to_mobile_no'] = _toMobileNo;
    return map;
  }

}
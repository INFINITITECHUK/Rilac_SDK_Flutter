
class VoucherUserBodyModel {
  VoucherUserBodyModel({
      String? voucherCode,}){
    _voucherCode = voucherCode;
}

  VoucherUserBodyModel.fromJson(dynamic json) {
    _voucherCode = json['voucher_code'];
  }
  String? _voucherCode;
VoucherUserBodyModel copyWith({  String? voucherCode,
}) => VoucherUserBodyModel(  voucherCode: voucherCode ?? _voucherCode,
);
  String? get voucherCode => _voucherCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['voucher_code'] = _voucherCode;
    return map;
  }

}
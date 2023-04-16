/// to_mobile_no : "01234567890"
/// bussiness_id : "1677495583539"
/// keyword : "C2MP"
/// transfer_amount : 1

class SharePointBodyModel {
  SharePointBodyModel({
      String? toMobileNo, 
      String? bussinessId, 
      String? keyword, 
      num? transferAmount,}){
    _toMobileNo = toMobileNo;
    _bussinessId = bussinessId;
    _keyword = keyword;
    _transferAmount = transferAmount;
}

  SharePointBodyModel.fromJson(dynamic json) {
    _toMobileNo = json['to_mobile_no'];
    _bussinessId = json['bussiness_id'];
    _keyword = json['keyword'];
    _transferAmount = json['transfer_amount'];
  }
  String? _toMobileNo;
  String? _bussinessId;
  String? _keyword;
  num? _transferAmount;
SharePointBodyModel copyWith({  String? toMobileNo,
  String? bussinessId,
  String? keyword,
  num? transferAmount,
}) => SharePointBodyModel(  toMobileNo: toMobileNo ?? _toMobileNo,
  bussinessId: bussinessId ?? _bussinessId,
  keyword: keyword ?? _keyword,
  transferAmount: transferAmount ?? _transferAmount,
);
  String? get toMobileNo => _toMobileNo;
  String? get bussinessId => _bussinessId;
  String? get keyword => _keyword;
  num? get transferAmount => _transferAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['to_mobile_no'] = _toMobileNo;
    map['bussiness_id'] = _bussinessId;
    map['keyword'] = _keyword;
    map['transfer_amount'] = _transferAmount;
    return map;
  }

}
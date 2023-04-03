/// refresh_token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjkiLCJlbWFpbCI6InN1ajk3NjNAZ21haWwuY29tIiwibW9iaWxlIjoiOTg0OTEzMTM5OSIsImRldmljZV9pZCI6InEiLCJqdGkiOiIxNjc5ODk4MTY1OTM4XzZOODRhOTBCZzciLCJpYXQiOjE2Nzk4OTgxNjUsImV4cCI6MTY4NzY3NDE2NX0.j-dKyLyPnb7HcN4Cr3NDdYUWcFCjiCAi1s-Jj5sSVdA"
/// phone_os : "q"
/// phone_brand : "q"
/// device_id : "q"
/// phone_model : "q"

class RefreshTokenBodyModel {
  RefreshTokenBodyModel({
      String? refreshToken, 
      String? phoneOs, 
      String? phoneBrand, 
      String? deviceId, 
      String? phoneModel,}){
    _refreshToken = refreshToken;
    _phoneOs = phoneOs;
    _phoneBrand = phoneBrand;
    _deviceId = deviceId;
    _phoneModel = phoneModel;
}

  RefreshTokenBodyModel.fromJson(dynamic json) {
    _refreshToken = json['refresh_token'];
    _phoneOs = json['phone_os'];
    _phoneBrand = json['phone_brand'];
    _deviceId = json['device_id'];
    _phoneModel = json['phone_model'];
  }
  String? _refreshToken;
  String? _phoneOs;
  String? _phoneBrand;
  String? _deviceId;
  String? _phoneModel;
RefreshTokenBodyModel copyWith({  String? refreshToken,
  String? phoneOs,
  String? phoneBrand,
  String? deviceId,
  String? phoneModel,
}) => RefreshTokenBodyModel(  refreshToken: refreshToken ?? _refreshToken,
  phoneOs: phoneOs ?? _phoneOs,
  phoneBrand: phoneBrand ?? _phoneBrand,
  deviceId: deviceId ?? _deviceId,
  phoneModel: phoneModel ?? _phoneModel,
);
  String? get refreshToken => _refreshToken;
  String? get phoneOs => _phoneOs;
  String? get phoneBrand => _phoneBrand;
  String? get deviceId => _deviceId;
  String? get phoneModel => _phoneModel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['refresh_token'] = _refreshToken;
    map['phone_os'] = _phoneOs;
    map['phone_brand'] = _phoneBrand;
    map['device_id'] = _deviceId;
    map['phone_model'] = _phoneModel;
    return map;
  }

}
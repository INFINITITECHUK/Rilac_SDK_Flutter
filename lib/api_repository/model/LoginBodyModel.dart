
class LoginBodyModel {
  LoginBodyModel({
      String? username, 
      String? password, 
      String? cusMobileno, 
      String? phoneOs, 
      String? phoneBrand, 
      String? deviceId, 
      String? phoneModel,}){
    _username = username;
    _password = password;
    _cusMobileno = cusMobileno;
    _phoneOs = phoneOs;
    _phoneBrand = phoneBrand;
    _deviceId = deviceId;
    _phoneModel = phoneModel;
}

  LoginBodyModel.fromJson(dynamic json) {
    _username = json['username'];
    _password = json['password'];
    _cusMobileno = json['cus_mobileno'];
    _phoneOs = json['phone_os'];
    _phoneBrand = json['phone_brand'];
    _deviceId = json['device_id'];
    _phoneModel = json['phone_model'];
  }
  String? _username;
  String? _password;
  String? _cusMobileno;
  String? _phoneOs;
  String? _phoneBrand;
  String? _deviceId;
  String? _phoneModel;
LoginBodyModel copyWith({  String? username,
  String? password,
  String? cusMobileno,
  String? phoneOs,
  String? phoneBrand,
  String? deviceId,
  String? phoneModel,
}) => LoginBodyModel(  username: username ?? _username,
  password: password ?? _password,
  cusMobileno: cusMobileno ?? _cusMobileno,
  phoneOs: phoneOs ?? _phoneOs,
  phoneBrand: phoneBrand ?? _phoneBrand,
  deviceId: deviceId ?? _deviceId,
  phoneModel: phoneModel ?? _phoneModel,
);
  String? get username => _username;
  String? get password => _password;
  String? get cusMobileno => _cusMobileno;
  String? get phoneOs => _phoneOs;
  String? get phoneBrand => _phoneBrand;
  String? get deviceId => _deviceId;
  String? get phoneModel => _phoneModel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['password'] = _password;
    map['cus_mobileno'] = _cusMobileno;
    map['phone_os'] = _phoneOs;
    map['phone_brand'] = _phoneBrand;
    map['device_id'] = _deviceId;
    map['phone_model'] = _phoneModel;
    return map;
  }

}
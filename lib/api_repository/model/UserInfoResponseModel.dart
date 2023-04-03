/// issuccess : true
/// statusCode : 200
/// payload : {"id":"9","email":"suj9763@gmail.com","mobile":"9849131399","firstname":"test","lastname":"test","pointBalance":0.0,"device_id":"q","access_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjkiLCJlbWFpbCI6InN1ajk3NjNAZ21haWwuY29tIiwibW9iaWxlIjoiOTg0OTEzMTM5OSIsImRldmljZV9pZCI6InEiLCJqdGkiOiIxNjc5ODk4MTY1OTM3X2NERmF3UUNPNm0iLCJpYXQiOjE2Nzk4OTgxNjUsImV4cCI6MTY4MDA3MDk2NX0.uIJcN9YKeTxsthjgg12fzbC0hXYEaIHadWXLYLXXG94","access_token_expires":"1680070965","refresh_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjkiLCJlbWFpbCI6InN1ajk3NjNAZ21haWwuY29tIiwibW9iaWxlIjoiOTg0OTEzMTM5OSIsImRldmljZV9pZCI6InEiLCJqdGkiOiIxNjc5ODk4MTY1OTM4XzZOODRhOTBCZzciLCJpYXQiOjE2Nzk4OTgxNjUsImV4cCI6MTY4NzY3NDE2NX0.j-dKyLyPnb7HcN4Cr3NDdYUWcFCjiCAi1s-Jj5sSVdA","refresh_token_expires":"1687674165"}
/// message : "The request has succeeded"

class UserInfoResponseModel {
  UserInfoResponseModel({
      bool? issuccess, 
      num? statusCode, 
      Payload? payload, 
      String? message,}){
    _issuccess = issuccess;
    _statusCode = statusCode;
    _payload = payload;
    _message = message;
}

  UserInfoResponseModel.fromJson(dynamic json) {
    _issuccess = json['issuccess'];
    _statusCode = json['statusCode'];
    _payload = json['payload'] != null ? Payload.fromJson(json['payload']) : null;
    _message = json['message'];
  }
  bool? _issuccess;
  num? _statusCode;
  Payload? _payload;
  String? _message;
UserInfoResponseModel copyWith({  bool? issuccess,
  num? statusCode,
  Payload? payload,
  String? message,
}) => UserInfoResponseModel(  issuccess: issuccess ?? _issuccess,
  statusCode: statusCode ?? _statusCode,
  payload: payload ?? _payload,
  message: message ?? _message,
);
  bool? get issuccess => _issuccess;
  num? get statusCode => _statusCode;
  Payload? get payload => _payload;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['issuccess'] = _issuccess;
    map['statusCode'] = _statusCode;
    if (_payload != null) {
      map['payload'] = _payload?.toJson();
    }
    map['message'] = _message;
    return map;
  }

}

/// id : "9"
/// email : "suj9763@gmail.com"
/// mobile : "9849131399"
/// firstname : "test"
/// lastname : "test"
/// pointBalance : 0.0
/// device_id : "q"
/// access_token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjkiLCJlbWFpbCI6InN1ajk3NjNAZ21haWwuY29tIiwibW9iaWxlIjoiOTg0OTEzMTM5OSIsImRldmljZV9pZCI6InEiLCJqdGkiOiIxNjc5ODk4MTY1OTM3X2NERmF3UUNPNm0iLCJpYXQiOjE2Nzk4OTgxNjUsImV4cCI6MTY4MDA3MDk2NX0.uIJcN9YKeTxsthjgg12fzbC0hXYEaIHadWXLYLXXG94"
/// access_token_expires : "1680070965"
/// refresh_token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjkiLCJlbWFpbCI6InN1ajk3NjNAZ21haWwuY29tIiwibW9iaWxlIjoiOTg0OTEzMTM5OSIsImRldmljZV9pZCI6InEiLCJqdGkiOiIxNjc5ODk4MTY1OTM4XzZOODRhOTBCZzciLCJpYXQiOjE2Nzk4OTgxNjUsImV4cCI6MTY4NzY3NDE2NX0.j-dKyLyPnb7HcN4Cr3NDdYUWcFCjiCAi1s-Jj5sSVdA"
/// refresh_token_expires : "1687674165"

class Payload {
  Payload({
      String? id, 
      String? email, 
      String? mobile, 
      String? firstname, 
      String? lastname, 
      num? pointBalance, 
      String? deviceId, 
      String? accessToken,
      num? accessTokenExpires,
      String? refreshToken, 
      num? refreshTokenExpires,}){
    _id = id;
    _email = email;
    _mobile = mobile;
    _firstname = firstname;
    _lastname = lastname;
    _pointBalance = pointBalance;
    _deviceId = deviceId;
    _accessToken = accessToken;
    _accessTokenExpires = accessTokenExpires;
    _refreshToken = refreshToken;
    _refreshTokenExpires = refreshTokenExpires;
}

  Payload.fromJson(dynamic json) {
    _id = json['id'];
    _email = json['email'];
    _mobile = json['mobile'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _pointBalance = json['pointBalance'];
    _deviceId = json['device_id'];
    _accessToken = json['access_token'];
    _accessTokenExpires = json['access_token_expires'];
    _refreshToken = json['refresh_token'];
    _refreshTokenExpires = json['refresh_token_expires'];
  }
  String? _id;
  String? _email;
  String? _mobile;
  String? _firstname;
  String? _lastname;
  num? _pointBalance;
  String? _deviceId;
  String? _accessToken;
  num? _accessTokenExpires;
  String? _refreshToken;
  num? _refreshTokenExpires;
Payload copyWith({  String? id,
  String? email,
  String? mobile,
  String? firstname,
  String? lastname,
  num? pointBalance,
  String? deviceId,
  String? accessToken,
  num? accessTokenExpires,
  String? refreshToken,
  num? refreshTokenExpires,
}) => Payload(  id: id ?? _id,
  email: email ?? _email,
  mobile: mobile ?? _mobile,
  firstname: firstname ?? _firstname,
  lastname: lastname ?? _lastname,
  pointBalance: pointBalance ?? _pointBalance,
  deviceId: deviceId ?? _deviceId,
  accessToken: accessToken ?? _accessToken,
  accessTokenExpires: accessTokenExpires ?? _accessTokenExpires,
  refreshToken: refreshToken ?? _refreshToken,
  refreshTokenExpires: refreshTokenExpires ?? _refreshTokenExpires,
);
  String? get id => _id;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get firstname => _firstname;
  String? get lastname => _lastname;
  num? get pointBalance => _pointBalance;
  String? get deviceId => _deviceId;
  String? get accessToken => _accessToken;
  num? get accessTokenExpires => _accessTokenExpires;
  String? get refreshToken => _refreshToken;
  num? get refreshTokenExpires => _refreshTokenExpires;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['pointBalance'] = _pointBalance;
    map['device_id'] = _deviceId;
    map['access_token'] = _accessToken;
    map['access_token_expires'] = _accessTokenExpires;
    map['refresh_token'] = _refreshToken;
    map['refresh_token_expires'] = _refreshTokenExpires;
    return map;
  }

}
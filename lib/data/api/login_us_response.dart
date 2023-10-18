/// status : "success"
/// message : "Login successful"
/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImZiM2Y5MWJkMWVhOGJkMzg2NTgzZmIwMjI3Njc1NGIzNDgwNDhjYmE0MWVhYTE4NWM0MDQ3NTQ1MmVhNDRhMWY2MjFlY2QyYTEyYjI0NjRhIn0.eyJhdWQiOiIxIiwianRpIjoiZmIzZjkxYmQxZWE4YmQzODY1ODNmYjAyMjc2NzU0YjM0ODA0OGNiYTQxZWFhMTg1YzQwNDc1NDUyZWE0NGExZjYyMWVjZDJhMTJiMjQ2NGEiLCJpYXQiOjE2OTYzMDc5OTQsIm5iZiI6MTY5NjMwNzk5NCwiZXhwIjoxNzI3OTMwMzk0LCJzdWIiOiIzMzkiLCJzY29wZXMiOltdfQ.ImYujIacXXZpKbpjcXWf1FfD_1BmNI5EMlXLDDUJqanU7iMFiKe3ezBZjdYZGr-RgFsejETQtYzhLifo2YHYWZjOYKzssr0qCMCb2Wg0gI9NaGhiOkkXORXJllESZQqHfYdwUaWWldGV7EH-ei0cqaUy9cxmT-WsjxkoT09Z3bffia4AXbc0WsWGSLJd4wAp0uY9kswFLMsMkHBitUCyurk2pWU-JITu4RFNrL-VSSEOZt5uNYFfau9syTCXE1JmrhygmJDfi3oXb1iKwCEs1oA-WTIGGe40FL2WIFIrXZEwDx1AnG2KKkCbG_KPojv9kVeBGFRPO1goFjwAJIV_pz0o6FoEcmErSwoXVOLniW7LPDxvn3urXEPZWZDhLMFH4lievatnBd6Na6fchisz_1_3SkIGrzkor-NmU1kt9xRnNPPajw6bQZMsAz3a5FR6XgpUxtZN2CY9tn_zkvupslgLv0C5_XJ0vJt13jqRQrAcwIllPFdKr1bZnHpewzGBtvQvWln5DJIaNHo7REvMf_-hYZLASdePqi2-QZ2PkjSfNNylUy5UhXSirb1P2Tu3_hJVdk_ftdKOjPDza1YolFTxfDLZKPkzNls8XJu2BgFgXTMk3Lx8vPKKnkn6WbRqMB6aTytld4cnFvPXDritxKzCQYbUc5enN-Z3q4uzkDU"
/// userModel : {"userid":339,"Name":"basheer","MobileNo":"7293651279"}
/// code : 1

class LoginUsResponse {
  LoginUsResponse({
      String? status, 
      String? message, 
      String? token, 
      UserModel? userModel, 
      num? code,}){
    _status = status;
    _message = message;
    _token = token;
    _userModel = userModel;
    _code = code;
}

  LoginUsResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _token = json['token'];
    _userModel = json['userModel'] != null ? UserModel.fromJson(json['userModel']) : null;
    _code = json['code'];
  }
  String? _status;
  String? _message;
  String? _token;
  UserModel? _userModel;
  num? _code;
LoginUsResponse copyWith({  String? status,
  String? message,
  String? token,
  UserModel? userModel,
  num? code,
}) => LoginUsResponse(  status: status ?? _status,
  message: message ?? _message,
  token: token ?? _token,
  userModel: userModel ?? _userModel,
  code: code ?? _code,
);
  String? get status => _status;
  String? get message => _message;
  String? get token => _token;
  UserModel? get userModel => _userModel;
  num? get code => _code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['token'] = _token;
    if (_userModel != null) {
      map['userModel'] = _userModel?.toJson();
    }
    map['code'] = _code;
    return map;
  }

}

/// userid : 339
/// Name : "basheer"
/// MobileNo : "7293651279"

class UserModel {
  UserModel({
      num? userid, 
      String? name, 
      String? mobileNo,}){
    _userid = userid;
    _name = name;
    _mobileNo = mobileNo;
}

  UserModel.fromJson(dynamic json) {
    _userid = json['userid'];
    _name = json['Name'];
    _mobileNo = json['MobileNo'];
  }
  num? _userid;
  String? _name;
  String? _mobileNo;
UserModel copyWith({  num? userid,
  String? name,
  String? mobileNo,
}) => UserModel(  userid: userid ?? _userid,
  name: name ?? _name,
  mobileNo: mobileNo ?? _mobileNo,
);
  num? get userid => _userid;
  String? get name => _name;
  String? get mobileNo => _mobileNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userid'] = _userid;
    map['Name'] = _name;
    map['MobileNo'] = _mobileNo;
    return map;
  }

}
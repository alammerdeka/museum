part of 'models.dart';
class GlobalResponse {
  String? message;
  String? pengEmail;
  bool? status;
  String? pwdNew;
  String? pengPass;

  GlobalResponse({this.message,this.pengEmail, this.status, this.pwdNew, this.pengPass});

  GlobalResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    pengEmail = json['pengEmail'];
    status = json['status'];
    pwdNew = json['new'];
    pengPass = json['pengPass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['pengEmail'] = pengEmail;
    data['status'] = status;
    data['new'] = pwdNew;
    data['pengPass'] = pengPass;
    return data;
  }
}
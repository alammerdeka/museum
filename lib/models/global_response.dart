part of 'models.dart';
class GlobalResponse {
  String? message;
  String? pengEmail;
  bool? status;

  GlobalResponse({this.message,this.pengEmail, this.status});

  GlobalResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    pengEmail = json['pengEmail'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['pengEmail'] = pengEmail;
    data['status'] = status;
    return data;
  }
}
part of 'models.dart';
class Tentang {
  String? tentangId;
  String? tentangIsi;

  Tentang({this.tentangId, this.tentangIsi});

  Tentang.fromJson(Map<String, dynamic> json) {
    tentangId = json['tentangId'];
    tentangIsi = json['tentangIsi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tentangId'] = this.tentangId;
    data['tentangIsi'] = this.tentangIsi;
    return data;
  }
}
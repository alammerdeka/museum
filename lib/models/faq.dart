part of 'models.dart';
class Faq {
  String? faqId;
  String? faqJudul;
  String? faqIsi;

  Faq({this.faqId, this.faqJudul, this.faqIsi});

  Faq.fromJson(Map<String, dynamic> json) {
    faqId = json['faqId'];
    faqJudul = json['faqJudul'];
    faqIsi = json['faqIsi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['faqId'] = this.faqId;
    data['faqJudul'] = this.faqJudul;
    data['faqIsi'] = this.faqIsi;
    return data;
  }
}
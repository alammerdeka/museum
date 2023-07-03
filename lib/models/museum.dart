part of 'models.dart';
class Museum {
  String? museumId;
  String? museumNama;
  String? museumDitemukan;
  String? museumDitemukanPada;
  String? museumTerbuat;
  String? museumFoto;
  String? museumVideo;
  String? museumDeskripsi;
  String? museumDibuatPada;
  String? tautanvideo;
  String? tautanfoto;

  Museum(
      {this.museumId,
        this.museumNama,
        this.museumDitemukan,
        this.museumDitemukanPada,
        this.museumTerbuat,
        this.museumFoto,
        this.museumVideo,
        this.museumDeskripsi,
        this.museumDibuatPada,
        this.tautanvideo,
        this.tautanfoto});

  Museum.fromJson(Map<String, dynamic> json) {
    museumId = json['museumId'];
    museumNama = json['museumNama'];
    museumDitemukan = json['museumDitemukan'];
    museumDitemukanPada = json['museumDitemukanPada'];
    museumTerbuat = json['museumTerbuat'];
    museumFoto = json['museumFoto'];
    museumVideo = json['museumVideo'];
    museumDeskripsi = json['museumDeskripsi'];
    museumDibuatPada = json['museumDibuatPada'];
    tautanvideo = json['tautanvideo'];
    tautanfoto = json['tautanfoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['museumId'] = this.museumId;
    data['museumNama'] = this.museumNama;
    data['museumDitemukan'] = this.museumDitemukan;
    data['museumDitemukanPada'] = this.museumDitemukanPada;
    data['museumTerbuat'] = this.museumTerbuat;
    data['museumFoto'] = this.museumFoto;
    data['museumVideo'] = this.museumVideo;
    data['museumDeskripsi'] = this.museumDeskripsi;
    data['museumDibuatPada'] = this.museumDibuatPada;
    data['tautanvideo'] = this.tautanvideo;
    data['tautanfoto'] = this.tautanfoto;
    return data;
  }
}
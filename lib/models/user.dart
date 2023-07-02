part of 'models.dart';
class User {
  String? pengId;
  String? pengNama;
  String? pengInstansi;
  String? pengEmail;
  String? pengPass;
  String? pengTlp;
  String? pengFoto;
  String? pengStatus;
  String? pengDibuatPada;
  String? pengIpAddress;
  String? pengPemilihAktif;
  String? pengKodeAktivasi;
  String? pengPemilihLupaSandi;
  String? pengKodeLupaSandi;
  String? pengWaktuLupaSandi;
  String? pengIngatPemilih;
  String? pengIngatKode;
  String? pengLoginTerakhir;
  String? pengAktif;
  String? pengDeskripsiPerusahaan;
  String? pengLinkPerusahaan;
  String? pengJenisKelamin;
  bool? status;

  User(
      {this.pengId,
        this.pengNama,
        this.pengInstansi,
        this.pengEmail,
        this.pengPass,
        this.pengTlp,
        this.pengFoto,
        this.pengStatus,
        this.pengDibuatPada,
        this.pengIpAddress,
        this.pengPemilihAktif,
        this.pengKodeAktivasi,
        this.pengPemilihLupaSandi,
        this.pengKodeLupaSandi,
        this.pengWaktuLupaSandi,
        this.pengIngatPemilih,
        this.pengIngatKode,
        this.pengLoginTerakhir,
        this.pengAktif,
        this.pengDeskripsiPerusahaan,
        this.pengLinkPerusahaan,
        this.pengJenisKelamin,
        this.status});

  User.fromJson(Map<String, dynamic> json) {
    pengId = json['pengId'];
    pengNama = json['pengNama'];
    pengInstansi = json['pengInstansi'];
    pengEmail = json['pengEmail'];
    pengPass = json['pengPass'];
    pengTlp = json['pengTlp'];
    pengFoto = json['pengFoto'];
    pengStatus = json['pengStatus'];
    pengDibuatPada = json['pengDibuatPada'];
    pengIpAddress = json['pengIpAddress'];
    pengPemilihAktif = json['pengPemilihAktif'];
    pengKodeAktivasi = json['pengKodeAktivasi'];
    pengPemilihLupaSandi = json['pengPemilihLupaSandi'];
    pengKodeLupaSandi = json['pengKodeLupaSandi'];
    pengWaktuLupaSandi = json['pengWaktuLupaSandi'];
    pengIngatPemilih = json['pengIngatPemilih'];
    pengIngatKode = json['pengIngatKode'];
    pengLoginTerakhir = json['pengLoginTerakhir'];
    pengAktif = json['pengAktif'];
    pengDeskripsiPerusahaan = json['pengDeskripsiPerusahaan'];
    pengLinkPerusahaan = json['pengLinkPerusahaan'];
    pengJenisKelamin = json['pengJenisKelamin'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pengId'] = this.pengId;
    data['pengNama'] = this.pengNama;
    data['pengInstansi'] = this.pengInstansi;
    data['pengEmail'] = this.pengEmail;
    data['pengPass'] = this.pengPass;
    data['pengTlp'] = this.pengTlp;
    data['pengFoto'] = this.pengFoto;
    data['pengStatus'] = this.pengStatus;
    data['pengDibuatPada'] = this.pengDibuatPada;
    data['pengIpAddress'] = this.pengIpAddress;
    data['pengPemilihAktif'] = this.pengPemilihAktif;
    data['pengKodeAktivasi'] = this.pengKodeAktivasi;
    data['pengPemilihLupaSandi'] = this.pengPemilihLupaSandi;
    data['pengKodeLupaSandi'] = this.pengKodeLupaSandi;
    data['pengWaktuLupaSandi'] = this.pengWaktuLupaSandi;
    data['pengIngatPemilih'] = this.pengIngatPemilih;
    data['pengIngatKode'] = this.pengIngatKode;
    data['pengLoginTerakhir'] = this.pengLoginTerakhir;
    data['pengAktif'] = this.pengAktif;
    data['pengDeskripsiPerusahaan'] = this.pengDeskripsiPerusahaan;
    data['pengLinkPerusahaan'] = this.pengLinkPerusahaan;
    data['pengJenisKelamin'] = this.pengJenisKelamin;
    data['status'] = this.status;
    return data;
  }
}
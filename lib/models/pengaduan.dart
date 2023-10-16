class Pengaduan {
  String? idPengaduan;
  String? tglPengaduan;
  String? nik;
  String? isiLaporan;
  String? foto;
  String? url;
  String? status;
  String? createdAt;
  String? updatedAt;

  Pengaduan(
      {this.idPengaduan,
        this.tglPengaduan,
        this.nik,
        this.isiLaporan,
        this.foto,
        this.url,
        this.status,
        this.createdAt,
        this.updatedAt});

  Pengaduan.fromJson(Map<String, dynamic> json) {
    idPengaduan = json['id_pengaduan'];
    tglPengaduan = json['tgl_pengaduan'];
    nik = json['nik'];
    isiLaporan = json['isi_laporan'];
    foto = json['foto'];
    url = json['url'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_pengaduan'] = this.idPengaduan;
    data['tgl_pengaduan'] = this.tglPengaduan;
    data['nik'] = this.nik;
    data['isi_laporan'] = this.isiLaporan;
    data['foto'] = this.foto;
    data['url'] = this.url;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
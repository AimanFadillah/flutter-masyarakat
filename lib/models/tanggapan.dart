class Tanggapan {
  String? idTanggapan;
  String? tglTanggapan;
  String? tanggapan;
  String? createdAt;
  String? updatedAt;
  String? idPengaduan;
  String? idPetugas;
  Pengaduan? pengaduan;
  Petuga? petuga;

  Tanggapan(
      {this.idTanggapan,
        this.tglTanggapan,
        this.tanggapan,
        this.createdAt,
        this.updatedAt,
        this.idPengaduan,
        this.idPetugas,
        this.pengaduan,
        this.petuga});

  Tanggapan.fromJson(Map<String, dynamic> json) {
    idTanggapan = json['id_tanggapan'];
    tglTanggapan = json['tgl_tanggapan'];
    tanggapan = json['tanggapan'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    idPengaduan = json['id_pengaduan'];
    idPetugas = json['id_petugas'];
    pengaduan = json['pengaduan'] != null
        ? new Pengaduan.fromJson(json['pengaduan'])
        : null;
    petuga =
    json['petuga'] != null ? new Petuga.fromJson(json['petuga']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_tanggapan'] = this.idTanggapan;
    data['tgl_tanggapan'] = this.tglTanggapan;
    data['tanggapan'] = this.tanggapan;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['id_pengaduan'] = this.idPengaduan;
    data['id_petugas'] = this.idPetugas;
    if (this.pengaduan != null) {
      data['pengaduan'] = this.pengaduan!.toJson();
    }
    if (this.petuga != null) {
      data['petuga'] = this.petuga!.toJson();
    }
    return data;
  }
}

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

class Petuga {
  String? idPetugas;
  String? namaPetugas;
  String? username;
  String? password;
  String? telp;
  String? level;
  String? createdAt;
  String? updatedAt;

  Petuga(
      {this.idPetugas,
        this.namaPetugas,
        this.username,
        this.password,
        this.telp,
        this.level,
        this.createdAt,
        this.updatedAt});

  Petuga.fromJson(Map<String, dynamic> json) {
    idPetugas = json['id_petugas'];
    namaPetugas = json['nama_petugas'];
    username = json['username'];
    password = json['password'];
    telp = json['telp'];
    level = json['level'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_petugas'] = this.idPetugas;
    data['nama_petugas'] = this.namaPetugas;
    data['username'] = this.username;
    data['password'] = this.password;
    data['telp'] = this.telp;
    data['level'] = this.level;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

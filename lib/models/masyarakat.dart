class Masyarakat {
  String? nik;
  String? nama;
  String? username;
  String? password;
  String? telp;
  String? createdAt;
  String? updatedAt;

  Masyarakat(
      {this.nik,
        this.nama,
        this.username,
        this.password,
        this.telp,
        this.createdAt,
        this.updatedAt});

  Masyarakat.fromJson(Map<String, dynamic> json) {
    nik = json['nik'];
    nama = json['nama'];
    username = json['username'];
    password = json['password'];
    telp = json['telp'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nik'] = this.nik;
    data['nama'] = this.nama;
    data['username'] = this.username;
    data['password'] = this.password;
    data['telp'] = this.telp;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as fetch ;
import 'package:masyarakat/models/Pesan.dart';
import 'package:masyarakat/models/petugas.dart';

class PetugasController extends GetxController {

  RxBool loading = RxBool(false);
  RxList<Petugas> data = RxList<Petugas>([]);

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData () async {
    try{
      data.value = [];
      loading.value = true;
      var response = await fetch.get(Uri.parse("http://localhost:5000/petugas"));
      loading.value = false;
      if(response.statusCode == 200){
        final dataPengaduan = jsonDecode(response.body);
        for(Map<String,dynamic> pengaduan in dataPengaduan){
          data.add(Petugas.fromJson(pengaduan));
        }
      }else{
        print("Terjadi Kesalahan");
      }
    }catch(e){
      print(e.toString());
    }
  }

  createData (String nama_petugas,String username,String password,String telp) async {
    try{
      loading.value = true;
      var response = await fetch.post(
        Uri.parse("http://localhost:5000/petugas"),
        body:jsonEncode({
         "nama_petugas" : nama_petugas,
          "username" : username,
          "password" : password,
          "confPassword" : password,
          "telp" : telp
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      loading.value = false;

      getData();
      if (response.statusCode == 201) {
        print("Data berhasil dibuat");
      } else {
        final hasil = Pesan.fromJson(jsonDecode(response.body));
        return hasil.msg.toString();
      }
    }catch(e){
      print(e.toString());
    }
  }

  updateData (id,String nama_petugas,String username,String telp) async {
    try{
      loading.value = true;
      var response = await fetch.put(
        Uri.parse("http://localhost:5000/petugas/${id}"),
        body:jsonEncode({
          "nama_petugas" : nama_petugas,
          "username" : username,
          "telp" : telp
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      loading.value = false;

      getData();
      if (response.statusCode == 201) {
        print("Data berhasil dibuat");
      } else {
        final hasil = Pesan.fromJson(jsonDecode(response.body));
        return hasil.msg.toString();
      }
    }catch(e){
      print(e.toString());
    }
  }

  destroyData (id) async {
    try{
      loading.value = true;
      var response = await fetch.delete(
        Uri.parse("http://localhost:5000/petugas/${id}"),
      );
      loading.value = false;

      getData();
      if (response.statusCode == 201) {
        print("Data berhasil dibuat");
      } else {
        print("Gagal membuat data. Status code: ${response.body}");
      }
    }catch(e){
      print(e.toString());
    }
  }

}
import 'dart:convert';
import 'package:get/get.dart';
import 'package:masyarakat/models/Pesan.dart';
import 'package:masyarakat/models/masyarakat.dart';
import 'package:http/http.dart' as fetch ;

class MasyarakatController extends GetxController {

  RxBool loading = RxBool(false);
  RxList<Masyarakat> data = RxList<Masyarakat>([]);
  RxString msg = RxString("");

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData () async {
    try{
      data.value = [];
      loading.value = true;
      var response = await fetch.get(Uri.parse("http://localhost:5000/masyarakat")); // proses
      loading.value = false;
      final dataPengaduan = jsonDecode(response.body); // output
      for(Map<String,dynamic> pengaduan in dataPengaduan){
        data.add(Masyarakat.fromJson(pengaduan));
      }
    }catch(e){
      print(e.toString());
    }
  }

  createData (String nik,String nama,String username,String password,String telp) async {
    try{
      loading.value = true;
      var response = await fetch.post(
        Uri.parse("http://localhost:5000/masyarakat"),
        body:jsonEncode({
          "nik":nik,
          "nama":nama,
          "username":username,
          "password":password,
          "telp":telp,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      loading.value = false;

      getData();

      final hasil = Pesan.fromJson(jsonDecode(response.body));
      return hasil.msg.toString();
    }catch(e){
      print(e.toString());
    }
  }

  updateData (nik,String nama,String username,String telp) async {
    try{
      loading.value = true;
      var response = await fetch.put(
        Uri.parse("http://localhost:5000/masyarakat/${nik}"),
        body:jsonEncode({
          "nama":nama,
          "username":username,
          "telp":telp,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      loading.value = false;

      getData();
      if (response.statusCode == 200) {
        print("Data berhasil diupdate");
      } else {
        print("Gagal update data. Status code: ${response.body}");
      }
    }catch(e){
      print(e.toString());
    }
  }

  destroyData (nik) async {
    try{
      loading.value = true;
      var response = await fetch.delete(
        Uri.parse("http://localhost:5000/masyarakat/${nik}"),
      );
      loading.value = false;

      getData();
      if (response.statusCode == 200) {
        print("Data berhasil dihapus");
      } else {
        print("Gagal menghapus data. Status code: ${response.body}");
      }
    }catch(e){
      print(e.toString());
    }
  }

}
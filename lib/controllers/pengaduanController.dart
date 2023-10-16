import 'dart:convert';

import 'package:get/get.dart';
import "package:http/http.dart" as fetch;
import 'package:masyarakat/models/pengaduan.dart';

class PengaduanController extends GetxController{

  static final PengaduanController _instance = PengaduanController._internal();

  factory PengaduanController() {
    return _instance;
  }

  PengaduanController._internal();

  RxBool loading = RxBool(false);
  RxList<Pengaduan> data = RxList<Pengaduan>([]);

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData () async {
    try{
      data.value = [];
      loading.value = true;
      var response = await fetch.get(Uri.parse("http://localhost:5000/pengaduan"));
      loading.value = false;
      if(response.statusCode == 200){
        final dataPengaduan = jsonDecode(response.body);
        for(Map<String,dynamic> pengaduan in dataPengaduan){
          data.add(Pengaduan.fromJson(pengaduan));
        }
      }else{
        print("Terjadi Kesalahan");
      }
    }catch(e){
      print(e.toString());
    }
  }



  destroyData (id) async {
    try{
      loading.value = true;
      var response = await fetch.delete(
        Uri.parse("http://localhost:5000/pengaduan/${id}"),
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
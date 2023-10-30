import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as fetch;
import 'package:masyarakat/models/pengaduan.dart';

class PengaduanController extends GetxController{
  RxBool loading = RxBool(false);
  RxList<Pengaduan> data = RxList<Pengaduan>([]);
  RxBool web = RxBool(false);
  PlatformFile? imagePicked;
  Uint8List ? fileWeb;

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

  createData (Map data) async {
    if(data["status"] != "0" && data["status"] != "proses" && data["status"] != "selesai") return "Status antara proses,selesai atau 0";
    if(!web.value) return "tidak ada gambar";

    final url = Uri.parse('http://localhost:5000/pengaduan');
    var request = fetch.MultipartRequest('POST', url);
    request.files.add(
      fetch.MultipartFile.fromBytes(
        'foto',
        Uint8List.fromList(imagePicked!.bytes!),
        filename: imagePicked!.name!,
      ),
    );

    data.forEach((key, value) {
      request.fields[key] = value;
    });

    var response = await request.send();
    final responseBody = await response.stream.bytesToString();
    print(responseBody);
    getData();
    web.value = false;
    return "success";
  }

  destroyData (id) async {
    try{
      loading.value = true;
      var response = await fetch.delete(
        Uri.parse("http://localhost:5000/pengaduan/${id}"),
      );
      loading.value = false;

      getData();
    }catch(e){
      print(e.toString());
    }
  }

  pickImage () async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    if(result == null) return false;
    imagePicked = result.files.first;
    fileWeb = Uint8List.fromList(imagePicked!.bytes!);
    web.value = true;
  }


}
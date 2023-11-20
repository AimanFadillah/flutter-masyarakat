import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/pengaduanController.dart';

class EditPengaduan extends StatelessWidget {
  const EditPengaduan({super.key});

  @override
  Widget build(BuildContext context) {
    int index = Get.arguments["index"];
    PengaduanController pengaduanController = Get.put(PengaduanController());
    var pengaduan = pengaduanController.data[index];
    Map data = {
      "isi_laporan" : pengaduan.isiLaporan,
      "tgl_pengaduan" : pengaduan.tglPengaduan,
      "status" : pengaduan.status,
      "nik" : pengaduan.nik
    };
    var hasil;
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.lightGreen,
          title:  const Text("Pengaduan Masyarakat",style: TextStyle(color: Colors.white))),
      body: Container(
        padding: const EdgeInsets.all(20),
        child:SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: TextEditingController(text: data["isi_laporan"]),
                decoration:const InputDecoration(
                  label:Text("Isi Laporan"),
                ),
                onChanged: (value) => data["isi_laporan"] = value,
              ),
              TextField(
                decoration:const InputDecoration(
                  label:Text("Status"),
                ),
                controller: TextEditingController(text: data["status"]),
                onChanged: (value) => data["status"] = value ,
              ),
              TextField(
                decoration:const InputDecoration(
                  label:Text("Tanggal Pengaduan"),
                ),
                controller: TextEditingController(text: data["tgl_pengaduan"]),
                onChanged: (value) => data["tgl_pengaduan"] = value,
              ),
              TextField(
                decoration:const InputDecoration(
                  label:Text("Nik"),
                ),
                controller: TextEditingController(text: data["nik"]),
                onChanged: (value) => data["nik"] = value,
              ),
              const SizedBox(height: 20),
              Obx(() => pengaduanController.fileWeb["file"] == ""  ?
                Column(
                  children: [
                    Image.network(pengaduanController.data[index].url.toString(),width: 300),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        pengaduanController.pickImage();
                      },
                      child:const Text("Update Image"),
                    ),
                  ],
                ) :
                GestureDetector(
                    onTap: () {
                      pengaduanController.pickImage();
                    },
                    child: Image.memory(pengaduanController.fileWeb["file"]!,width: 300)
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  hasil = await pengaduanController.updateData(data,pengaduan.idPengaduan);
                  if(hasil != "success") {
                    Get.snackbar("Error",hasil.toString());
                    return;
                  };
                  Get.toNamed("/pengaduan");
                },
                child:const Text("update"),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

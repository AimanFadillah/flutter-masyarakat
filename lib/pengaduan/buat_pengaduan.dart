import 'package:flutter/material.dart';

class BuatPengaduan extends StatelessWidget {
  const BuatPengaduan({super.key});

  @override
  Widget build(BuildContext context) {
    String isi_laporan = "";
    String status = "";
    String tgl_pengaduan = "";

    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.lightGreen,
          title:  const Text("Pengaduan Masyarakat",style: TextStyle(color: Colors.white))),
      body: Container(
        padding: const EdgeInsets.all(20),
        child:Column(
          children: [
            TextField(
              decoration:const InputDecoration(
                label:Text("Isi Laporan"),
              ),
              onChanged: (value) => isi_laporan = value,
            ),
            TextField(
              decoration:const InputDecoration(
                label:Text("Status"),
              ),
              onChanged: (value) => status = value,
            ),
            TextField(
              decoration:const InputDecoration(
                label:Text("Tanggal Pengaduan"),
              ),
              onChanged: (value) => tgl_pengaduan = value,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("${isi_laporan} ${tgl_pengaduan} ${status}");
                // masyarakatController.createData(nik.text, nama.text, username.text, password.text, telp.text);
                // Get.toNamed("/");
              },
              child:const Text("Create"),
            ),
          ],
        ),
      ),
    );
  }
}

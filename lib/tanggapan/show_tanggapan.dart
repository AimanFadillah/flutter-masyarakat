import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masyarakat/controllers/tanggapanController.dart';

class ShowTanggapan extends StatelessWidget {
  const ShowTanggapan({super.key});

  @override
  Widget build(BuildContext context) {
    int index = Get.arguments["index"];
    TanggapanController tanggapanController = Get.put(TanggapanController());
    var tanggapan = tanggapanController.data[index];
    DateTime tanggalTanggapan = DateTime.parse(tanggapan.tglTanggapan.toString());
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.lightGreen,
          title:  const Text("Pengaduan Masyarakat",style: TextStyle(color: Colors.white))),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Pengaduan :"),
                Text("${tanggapan.pengaduan?.isiLaporan}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Petugas :"),
                Text("${tanggapan.petuga?.namaPetugas}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Tanggapan :"),
                Text("${tanggapan.tanggapan}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Tanggal Tanggapan :"),
                Text("${tanggalTanggapan.day}-${tanggalTanggapan.month}-${tanggalTanggapan.year}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("CreatedAt :"),
                Text("${tanggapan.createdAt}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("UpdatedAt :"),
                Text("${tanggapan.updatedAt}"),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed("/tanggapan/edit",arguments: {"index":index});
                },
                child:const Text("Edit")
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  tanggapanController.destroyData(tanggapan.idTanggapan);
                  Get.toNamed("/tanggapan");
                },
                child:const Text("Hapus")
            ),
          ],
        ),
      ),
    );
  }
}

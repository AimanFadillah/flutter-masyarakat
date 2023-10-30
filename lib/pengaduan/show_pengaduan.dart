import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masyarakat/controllers/pengaduanController.dart';

class ShowPengaduan extends StatelessWidget {
  const ShowPengaduan({super.key});

  @override
  Widget build(BuildContext context) {
    PengaduanController pengaduanController = Get.put(PengaduanController());
    final index = Get.arguments["index"];
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.lightGreen,
          title:  const Text("Pengaduan Masyarakat",style: TextStyle(color: Colors.white))),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.network(pengaduanController.data[index].url.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Nik :"),
                Text("${pengaduanController.data[index].nik}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Isi Laporan :"),
                Text("${pengaduanController.data[index].isiLaporan}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Status :"),
                Text("${pengaduanController.data[index].status}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("CreatedAt :"),
                Text("${pengaduanController.data[index].createdAt}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("UpdatedAt :"),
                Text("${pengaduanController.data[index].updatedAt}"),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed("/petugas/edit",arguments: {"index":index});
                },
                child:const Text("Edit")
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  pengaduanController.destroyData(pengaduanController.data[index].idPengaduan);
                  Get.toNamed("/pengaduan");
                },
                child:const Text("Hapus")
            ),
          ],
        ),
      ),
    );
  }
}

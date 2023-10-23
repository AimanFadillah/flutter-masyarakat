import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masyarakat/controllers/masyarakatController.dart';

class Show extends StatelessWidget {
  const Show({super.key});

  @override
  Widget build(BuildContext context) {
    int index = Get.arguments["index"];
    MasyarakatController masyarakatController = Get.put(MasyarakatController());
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
                const Text("Nama :"),
                Text("${masyarakatController.data[index].nama}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Username :"),
                Text("${masyarakatController.data[index].username}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Nik :"),
                Text("${masyarakatController.data[index].nik}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Telepon :"),
                Text("${masyarakatController.data[index].telp}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("CreatedAt :"),
                Text("${masyarakatController.data[index].createdAt}"),
              ],
            ),

            ElevatedButton(
                onPressed: () {
                  Get.toNamed("/edit",arguments: {"index":index});
                },
                child:const Text("Edit")
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  masyarakatController.destroyData(masyarakatController.data[index].nik);
                  Get.toNamed("/beranda");
                },
                child:const Text("Hapus")
            ),
          ],
        ),
      ),
    );
  }
}

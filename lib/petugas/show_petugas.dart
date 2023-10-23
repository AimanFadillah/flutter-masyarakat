import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masyarakat/controllers/petugasController.dart';

class ShowPetugas extends StatelessWidget {
  const ShowPetugas({super.key});

  @override
  Widget build(BuildContext context) {
    PetugasController petugasController = Get.put(PetugasController());
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Nama :"),
                Text("${petugasController.data[index].namaPetugas}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Username :"),
                Text("${petugasController.data[index].username}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Telepon :"),
                Text("${petugasController.data[index].telp}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("CreatedAt :"),
                Text("${petugasController.data[index].createdAt}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("UpdatedAt :"),
                Text("${petugasController.data[index].updatedAt}"),
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
                  petugasController.destroyData(petugasController.data[index].idPetugas);
                  Get.toNamed("/petugas");
                },
                child:const Text("Hapus")
            ),
          ],
        ),
      ),
    );
  }
}

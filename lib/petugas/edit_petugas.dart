import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masyarakat/controllers/petugasController.dart';

class EditPetugas extends StatelessWidget {
  const EditPetugas({super.key});

  @override
  Widget build(BuildContext context) {
    final index = Get.arguments["index"];
    PetugasController petugasController = Get.put(PetugasController());
    TextEditingController nama_petugas = TextEditingController(text: petugasController.data[index].namaPetugas);
    TextEditingController username = TextEditingController(text: petugasController.data[index].username);
    TextEditingController telp = TextEditingController(text: petugasController.data[index].telp);
    var hasil = "";
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
              controller:nama_petugas,
              decoration:const InputDecoration(
                label:Text("Nama Petugas"),
              ),
            ),
            TextField(
              controller:username,
              decoration:const InputDecoration(
                label:Text("Username"),
              ),
            ),
            TextField(
              controller:telp,
              decoration:const InputDecoration(
                label:Text("telp"),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                hasil = await petugasController.updateData(petugasController.data[index].idPetugas,nama_petugas.text,username.text,telp.text);
                if(hasil != "success") {
                  Get.snackbar("Error",hasil);
                  return;
                };
                Get.toNamed("/petugas");
              },
              child:const Text("Create"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masyarakat/controllers/petugasController.dart';

class BuatPetugas extends StatelessWidget {
  const BuatPetugas({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nama_petugas = TextEditingController();
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController telp = TextEditingController();
    PetugasController petugasController = Get.put(PetugasController());
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
              controller:password,
              decoration:const InputDecoration(
                label:Text("Password"),
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
                hasil = await petugasController.createData(nama_petugas.text,username.text,password.text,telp.text);
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

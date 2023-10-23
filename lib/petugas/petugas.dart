import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masyarakat/controllers/petugasController.dart';

class Petugas extends StatelessWidget {
  const Petugas({super.key});

  @override
  Widget build(BuildContext context) {
    PetugasController petugasController = Get.put(PetugasController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pengaduan Masyarakat",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.lightGreen,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
          padding:const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed("/petugas/create");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.fromLTRB(0,0,0,20),
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Text("Buat Petugas",
                      style: TextStyle(fontSize: 16,color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Obx(() => petugasController.loading.value ?
                const Center(
                  child: CircularProgressIndicator(),
                )
                    :
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: petugasController.data.length,
                  itemBuilder: (context,i) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed("/petugas/show",arguments: {"index":i});
                      },
                      child: ListTile(
                        splashColor: Colors.green,
                        leading: CircleAvatar(
                            radius: 30,
                            child: Text("${i + 1}")
                        ),
                        title: Text("${petugasController.data[i].namaPetugas}"),
                        subtitle: Text("${petugasController.data[i].createdAt}"),
                      ),
                    );
                  },
                )
                )
              ],
            ),
          )
      ),
    );
  }
}

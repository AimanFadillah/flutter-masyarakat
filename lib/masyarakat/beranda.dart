import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masyarakat/controllers/masyarakatController.dart';
import 'package:masyarakat/controllers/pengaduanController.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    MasyarakatController masyarakatController = Get.put(MasyarakatController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pengaduan Masyarakat",style: TextStyle(color: Colors.white),),
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        padding:const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed("/buat");
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.fromLTRB(0,0,0,20),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: const Text("Buat Masyarakat",
                    style: TextStyle(fontSize: 16,color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Obx(() => masyarakatController.loading.value ?
                  const Center(
                    child: CircularProgressIndicator(),
                  )
              :
              ListView.builder(
                shrinkWrap: true,
                itemCount: masyarakatController.data.length,
                itemBuilder: (context,i) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed("/show",arguments: {"index":i});
                    },
                    child: ListTile(
                        splashColor: Colors.green,
                        leading: CircleAvatar(
                          radius: 30,
                          child: Text("${i + 1}")
                        ),
                        title: Text("${masyarakatController.data[i].nama}"),
                        subtitle: Text("${masyarakatController.data[i].createdAt}"),
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

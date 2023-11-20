import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masyarakat/controllers/tanggapanController.dart';

class Tanggapan extends StatelessWidget {
  const Tanggapan({super.key});

  @override
  Widget build(BuildContext context) {
    TanggapanController tanggapanController = Get.put(TanggapanController());
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
                    Get.toNamed("/tanggapan/create");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.fromLTRB(0,0,0,20),
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Text("Buat Tanggapan",
                      style: TextStyle(fontSize: 16,color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Obx(() => tanggapanController.loading.value ?
                const Center(
                  child: CircularProgressIndicator(),
                )
                    :
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: tanggapanController.data.length,
                  itemBuilder: (context,i) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed("/tanggapan/show",arguments: {"index":i});
                      },
                      child: ListTile(
                        splashColor: Colors.green,
                        leading: CircleAvatar(
                            radius: 30,
                            child: Text("${i + 1}")
                        ),
                        title: Text("${tanggapanController.data[i].tanggapan}"),
                        subtitle: Text("${tanggapanController.data[i].createdAt}"),
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

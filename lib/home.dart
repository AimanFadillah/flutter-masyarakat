import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Pengaduan Masyarakat",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        padding:const EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed("/beranda");
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.fromLTRB(0,0,0,10),
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Text("Masyarakat",
                  style: TextStyle(fontSize: 16,color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed("/pengaduan");
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.fromLTRB(0,0,0,10),
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Text("Pengaduan",
                  style: TextStyle(fontSize: 16,color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed("/petugas");
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.fromLTRB(0,0,0,10),
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Text("Petugas",
                  style: TextStyle(fontSize: 16,color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

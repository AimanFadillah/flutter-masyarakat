import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masyarakat/beranda.dart';
import 'package:masyarakat/buat.dart';
import 'package:masyarakat/edit.dart';
import 'package:masyarakat/show.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pengadunan Masyarakat',
      debugShowCheckedModeBanner: false,
      getPages: [
          GetPage(name: "/buat", page: () => const Buat()),
          GetPage(name: "/show", page: () => const Show()),
          GetPage(name: "/edit", page: () => const Edit())
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      home: const Beranda(),
    );
  }
}


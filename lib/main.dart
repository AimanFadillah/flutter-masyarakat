import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masyarakat/masyarakat/beranda.dart';
import 'package:masyarakat/masyarakat/buat.dart';
import 'package:masyarakat/pengaduan/buat_pengaduan.dart';
import 'package:masyarakat/pengaduan/show_pengaduan.dart';
import 'package:masyarakat/petugas/buat_petugas.dart';
import 'package:masyarakat/masyarakat/edit.dart';
import 'package:masyarakat/home.dart';
import 'package:masyarakat/pengaduan/pengaduan.dart';
import 'package:masyarakat/petugas/edit_petugas.dart';
import 'package:masyarakat/petugas/petugas.dart';
import 'package:masyarakat/masyarakat/show.dart';
import 'package:masyarakat/petugas/show_petugas.dart';

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
          GetPage(name: "/edit", page: () => const Edit()),
          GetPage(name: "/beranda", page: () => const Beranda()),
          GetPage(name: "/pengaduan", page: () => const Pengaduan()),
          GetPage(name: "/pengaduan/show", page: () => const ShowPengaduan()),
          GetPage(name: "/pengaduan/create", page: () => const BuatPengaduan()),
          GetPage(name: "/petugas", page: () => const Petugas()),
          GetPage(name: "/petugas/create", page: () => const BuatPetugas()),
          GetPage(name: "/petugas/show", page: () => const ShowPetugas()),
          GetPage(name: "/petugas/edit", page: () => const EditPetugas()),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      home: const Home(),
    );
  }
}


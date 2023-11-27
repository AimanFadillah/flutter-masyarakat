import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masyarakat/controllers/masyarakatController.dart';
import '../controllers/pengaduanController.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:date_field/date_field.dart';

class EditPengaduan extends StatelessWidget {
  const EditPengaduan({super.key});

  @override
  Widget build(BuildContext context) {
    int index = Get.arguments["index"];
    PengaduanController pengaduanController = Get.put(PengaduanController());
    var pengaduan = pengaduanController.data[index];
    RxMap data = RxMap({
      "isi_laporan" : pengaduan.isiLaporan,
      "tgl_pengaduan" : pengaduan.tglPengaduan,
      "status" : pengaduan.status,
      "nik" : pengaduan.nik
    });
    MasyarakatController masyarakatController = Get.put(MasyarakatController());
    var hasil;
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.lightGreen,
          title:  const Text("Pengaduan Masyarakat",style: TextStyle(color: Colors.white))),
      body: Container(
        padding: const EdgeInsets.all(20),
        child:SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: TextEditingController(text: data["isi_laporan"]),
                decoration:const InputDecoration(
                  label:Text("Isi Laporan"),
                ),
                onChanged: (value) => data["isi_laporan"] = value,
              ),
              TextField(
                decoration:const InputDecoration(
                  label:Text("Status"),
                ),
                controller: TextEditingController(text: data["status"]),
                onChanged: (value) => data["status"] = value ,
              ),
              const SizedBox(height: 20),
              DateTimeFormField(
                decoration: const InputDecoration(
                  fillColor: Colors.lightGreen,
                  hintStyle: TextStyle(color: Colors.black45),
                  errorStyle: TextStyle(color: Colors.redAccent),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.event_note),
                  labelText: 'Tanggal Tanggapan',
                ),
                autovalidateMode: AutovalidateMode.always,
                onDateSelected: (DateTime value) {
                  data["tgl_pengaduan"] = value.toString();
                },
                initialValue: DateTime.parse(pengaduan.tglPengaduan.toString()),
              ),
              // TextField(
              //   decoration:const InputDecoration(
              //     label:Text("Tanggal Pengaduan"),
              //   ),
              //   controller: TextEditingController(text: data["tgl_pengaduan"]),
              //   onChanged: (value) => data["tgl_pengaduan"] = value,
              // ),
              // TextField(
              //   decoration:const InputDecoration(
              //     label:Text("Nik"),
              //   ),
              //   controller: TextEditingController(text: data["nik"]),
              //   onChanged: (value) => data["nik"] = value,
              // ),
              const SizedBox(height: 20),
              Obx(() =>
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: const Row(
                        children: [
                          Expanded(
                            child: Text('Pilih Nik',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      buttonStyleData: ButtonStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: Colors.black26),
                          color: Colors.lightGreen,
                        ),
                        elevation: 2,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.lightGreen,
                        ),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all(6),
                          thumbVisibility: MaterialStateProperty.all(true),
                        ),
                      ),
                      items: masyarakatController.data.map((masyarakat) => DropdownMenuItem(
                        value: masyarakat.nik,
                        child: Text(masyarakat.nik.toString(),style: const TextStyle(fontSize: 14,color: Colors.white)),
                      )).toList(),
                      value: data["nik"],
                      onChanged: (String? value) => data["nik"] = value!,
                    ),
                  ),
              ),
              const SizedBox(height: 20),
              Obx(() => pengaduanController.fileWeb["file"] == ""  ?
                Column(
                  children: [
                    Image.network(pengaduanController.data[index].url.toString(),width: 300),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        pengaduanController.pickImage();
                      },
                      child:const Text("Update Image"),
                    ),
                  ],
                ) :
                GestureDetector(
                    onTap: () {
                      pengaduanController.pickImage();
                    },
                    child: Image.memory(pengaduanController.fileWeb["file"]!,width: 300)
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  hasil = await pengaduanController.updateData(data,pengaduan.idPengaduan);
                  if(hasil != "success") {
                    Get.snackbar("Error",hasil.toString());
                    return;
                  };
                  Get.toNamed("/pengaduan");
                },
                child:const Text("update"),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

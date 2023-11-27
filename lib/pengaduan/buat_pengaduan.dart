import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masyarakat/controllers/masyarakatController.dart';
import 'package:masyarakat/controllers/pengaduanController.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:date_field/date_field.dart';

class BuatPengaduan extends StatelessWidget {
  const BuatPengaduan({super.key});

  @override
  Widget build(BuildContext context) {
    RxMap data = RxMap({
        "isi_laporan" : null,
        "status" : null,
        "tgl_pengaduan" : null,
        "nik" : null
    });
    var hasil;
    PengaduanController pengaduanController = Get.put(PengaduanController());
    MasyarakatController masyarakatController = Get.put(MasyarakatController());
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
                decoration:const InputDecoration(
                  label:Text("Isi Laporan"),
                ),
                onChanged: (value) => data["isi_laporan"] = value,
              ),
              TextField(
                decoration:const InputDecoration(
                  label:Text("Status"),
                ),
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
              ),
              // TextField(
              //   decoration:const InputDecoration(
              //     label:Text("Tanggal Pengaduan"),
              //   ),
              //   onChanged: (value) => data["tgl_pengaduan"] = value,
              // ),
              // TextField(
              //   decoration:const InputDecoration(
              //     label:Text("Nik"),
              //   ),
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
                ElevatedButton(
                  onPressed: () {
                    pengaduanController.pickImage();
                    // masyarakatController.createData(nik.text, nama.text, username.text, password.text, telp.text);
                    // Get.toNamed("/");
                  },
                  child:const Text("File Image"),
                )
                :
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
                  hasil = await pengaduanController.createData(data);
                  if(hasil != "success") {
                    Get.snackbar("Error",hasil.toString());
                    return;
                  };
                  Get.toNamed("/pengaduan");
                },
                child:const Text("Create"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:date_field/date_field.dart';
import 'package:get/get.dart';
import 'package:masyarakat/controllers/pengaduanController.dart';
import 'package:masyarakat/controllers/petugasController.dart';
import 'package:masyarakat/controllers/tanggapanController.dart';

class EditTanggal extends StatelessWidget {
  const EditTanggal({super.key});

  @override
  Widget build(BuildContext context) {
    int index = Get.arguments["index"];
    PengaduanController pengaduanController = Get.put(PengaduanController());
    PetugasController petugasController = Get.put(PetugasController());
    TanggapanController tanggapanController = Get.put(TanggapanController());
    var tanggapan = tanggapanController.data[index];
    RxMap data = RxMap({
      "id_pengaduan" : tanggapan.idPengaduan,
      "id_petugas" : tanggapan.idPetugas,
      "tgl_tanggapan" : tanggapan.tglTanggapan,
      "tanggapan" : tanggapan.tanggapan,
    });
    var hasil;
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.lightGreen,
          title:  const Text("Pengaduan Masyarakat",style: TextStyle(color: Colors.white))),
      body: Container(
        padding: const EdgeInsets.all(20),
        child:Column(
          children: [
            const SizedBox(height: 10),
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
              initialValue: DateTime.parse(tanggapan.tglTanggapan.toString()),
              onDateSelected: (DateTime value) {
                data["tgl_tanggapan"] = value;
              },
            ),
            const SizedBox(height: 10),
            TextField(
              controller: TextEditingController(text: tanggapan.tanggapan),
              decoration:const InputDecoration(
                label:Text("Tanggapan"),
              ),
              onChanged: (value) => data["tanggapan"] = value,
            ),
            const SizedBox(height: 10),
            Obx(() => pengaduanController.loading.value || pengaduanController.loading.value ?
            const Center(
              child: CircularProgressIndicator(),
            )
                : Column(
              children: [
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: const Row(
                      children: [
                        Expanded(
                          child: Text('Pilih Pengaduan',
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
                    items: pengaduanController.data.map((pengaduan) => DropdownMenuItem(
                      value: pengaduan.idPengaduan,
                      child: Text(pengaduan.isiLaporan.toString(),style: const TextStyle(fontSize: 14,color: Colors.white)),
                    )).toList(),
                    value: data["id_pengaduan"],
                    onChanged: (String? value) => data["id_pengaduan"] = value!,
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: const Row(
                      children: [
                        Expanded(
                          child: Text('Pilih Petugas',
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
                    items: petugasController.data.map((petugas) => DropdownMenuItem(
                      value: petugas.idPetugas,
                      child: Text(petugas.namaPetugas.toString(),style: const TextStyle(fontSize: 14,color: Colors.white)),
                    )).toList(),
                    value: data["id_petugas"],
                    onChanged: (String? value) => data["id_petugas"] = value!,
                  ),
                ),
              ],
            ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                hasil = await tanggapanController.updateData(data,tanggapan.idTanggapan);
                if(hasil != "success") {
                  Get.snackbar("Error",hasil.toString());
                  return;
                };
                Get.toNamed("/tanggapan");
              },
              child:const Text("Create"),
            ),
          ],
        ),
      ),
    );
  }
}

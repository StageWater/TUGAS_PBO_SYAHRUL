import 'package:flutter/material.dart';
import '../bin/mahasiswa.dart';
import '../bin/mata_kuliah.dart';
import '../bin/nilai.dart';

class InputNilaiPage extends StatelessWidget {
  final Mahasiswa mahasiswa;
  final List<MataKuliah> daftarMataKuliah;
  final List<Nilai> daftarNilai;

  InputNilaiPage({
    required this.mahasiswa,
    required this.daftarMataKuliah,
    required this.daftarNilai,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController nilaiController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Input Nilai")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: daftarMataKuliah.length,
          itemBuilder: (context, index) {
            final mataKuliah = daftarMataKuliah[index];
            return Card(
              child: ListTile(
                title: Text(mataKuliah.nama),
                subtitle: Text("${mataKuliah.kode} - ${mataKuliah.sks} SKS"),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Masukkan Nilai"),
                        content: TextField(
                          controller: nilaiController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(hintText: "Nilai"),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              double nilai = double.parse(nilaiController.text);
                              daftarNilai.add(Nilai(mataKuliah: mataKuliah, nilai: nilai));
                              Navigator.pop(context);
                            },
                            child: Text("Simpan"),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

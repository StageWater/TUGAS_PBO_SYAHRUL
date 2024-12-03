import 'package:flutter/material.dart';
import '../bin/mahasiswa.dart';
import '../bin/nilai.dart';

class TranskripNilaiPage extends StatelessWidget {
  final Mahasiswa mahasiswa;
  final List<Nilai> daftarNilai;

  TranskripNilaiPage({required this.mahasiswa, required this.daftarNilai});

  double hitungIPK(List<Nilai> daftarNilai) {
    double totalNilai = 0;
    int totalSKS = 0;

    for (var nilai in daftarNilai) {
      totalNilai += nilai.nilai * nilai.mataKuliah.sks;
      totalSKS += nilai.mataKuliah.sks;
    }

    return totalSKS > 0 ? totalNilai / totalSKS : 0.0;
  }

  @override
  Widget build(BuildContext context) {
    double ipk = hitungIPK(daftarNilai);

    return Scaffold(
      appBar: AppBar(title: Text("Transkrip Nilai")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: daftarNilai.length,
                itemBuilder: (context, index) {
                  var nilai = daftarNilai[index];
                  return Card(
                    elevation: 4,
                    child: ListTile(
                      title: Text(nilai.mataKuliah.nama),
                      subtitle: Text("${nilai.mataKuliah.sks} SKS - Nilai: ${nilai.nilai.toStringAsFixed(2)}"),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              "IPK: ${ipk.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

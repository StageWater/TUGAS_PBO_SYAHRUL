import 'package:flutter/material.dart';
import 'bin/mahasiswa.dart';
import 'bin/mata_kuliah.dart';
import 'bin/nilai.dart';
import 'bin/krs.dart';
import 'pages/cetak_krs_page.dart';
import 'pages/input_nilai_page.dart';
import 'pages/transkrip_nilai_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistem Akademik Sederhana',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Mahasiswa mahasiswa = Mahasiswa(nim: "123456", nama: "John Doe", semester: 3);
  List<MataKuliah> daftarMataKuliah = [
    MataKuliah(kode: "MK001", nama: "Pemrograman Mobile", sks: 3),
    MataKuliah(kode: "MK002", nama: "Kalkulus", sks: 4),
    MataKuliah(kode: "MK003", nama: "Jaringan Komputer", sks: 3),
  ];
  List<Nilai> daftarNilai = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sistem Akademik"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildMenuCard(
              context,
              title: "Cetak KRS",
              icon: Icons.list_alt,
              color: Colors.blue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CetakKRSPage(
                      krs: KRS(mahasiswa: mahasiswa, daftarMataKuliah: daftarMataKuliah),
                    ),
                  ),
                );
              },
            ),
            _buildMenuCard(
              context,
              title: "Input Nilai",
              icon: Icons.edit,
              color: Colors.green,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InputNilaiPage(
                      mahasiswa: mahasiswa,
                      daftarMataKuliah: daftarMataKuliah,
                      daftarNilai: daftarNilai,
                    ),
                  ),
                );
              },
            ),
            _buildMenuCard(
              context,
              title: "Lihat Transkrip",
              icon: Icons.school,
              color: Colors.orange,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TranskripNilaiPage(
                      mahasiswa: mahasiswa,
                      daftarNilai: daftarNilai,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context,
      {required String title, required IconData icon, required Color color, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: color.withOpacity(0.1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: color),
              SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

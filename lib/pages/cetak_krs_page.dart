import 'package:flutter/material.dart';
import '../bin/krs.dart';

class CetakKRSPage extends StatelessWidget {
  final KRS krs;

  CetakKRSPage({required this.krs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("KRS Mahasiswa")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: krs.daftarMataKuliah.length,
          itemBuilder: (context, index) {
            var mk = krs.daftarMataKuliah[index];
            return Card(
              elevation: 4,
              child: ListTile(
                title: Text(mk.nama),
                subtitle: Text("${mk.kode} - ${mk.sks} SKS"),
                leading: CircleAvatar(
                  child: Text(mk.kode.substring(0, 2)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

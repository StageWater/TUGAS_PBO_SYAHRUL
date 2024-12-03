import 'mahasiswa.dart';
import 'mata_kuliah.dart';

class KRS {
  Mahasiswa mahasiswa;
  List<MataKuliah> daftarMataKuliah;

  KRS({required this.mahasiswa, required this.daftarMataKuliah});
}

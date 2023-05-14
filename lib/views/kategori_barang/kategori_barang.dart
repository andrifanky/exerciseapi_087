import 'package:exerciseapi_087/controllers/kategori_barang_controller.dart';
import 'package:exerciseapi_087/models/kategori_barang_model.dart';
import 'package:exerciseapi_087/views/kategori_barang/add_kategori_barang.dart';
import 'package:exerciseapi_087/widgets/widget.dart';
import 'package:flutter/material.dart';

class KategoriBarang extends StatefulWidget {
  const KategoriBarang({super.key});

  @override
  State<KategoriBarang> createState() => _KategoriBarangState();
}

class _KategoriBarangState extends State<KategoriBarang> {

  final kategoriBarangController = KategoriBarangController();
  List<KategoriBarangModel> listKategoriBarang = [];

  @override
  void initState() {
    getKategoriBarang();
    super.initState();
  }

  getKategoriBarang() async {
    final kategoriBarang = await kategoriBarangController.getKategoriBarang();
    listKategoriBarang.clear();
    listKategoriBarang.addAll(kategoriBarang);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddKategoriBarang()));
        },
        child: const Icon(Icons.add_rounded),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      title: const Text('Kategori Barang'),
    );
  }

  Widget body() {
    return RefreshIndicator(
      onRefresh: () async {
        getKategoriBarang();
        return Future<void>.delayed(const Duration(seconds: 2));
      },
      child: ListView(
        padding: const EdgeInsets.only(bottom: 120),
        children: listKategoriBarang.map((e) {
          return KategoriBarangCard(kategoriBarang: e);
        }).toList(),
      ),
    );
  }
}

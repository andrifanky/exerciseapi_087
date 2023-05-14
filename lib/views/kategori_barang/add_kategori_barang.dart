import 'package:exerciseapi_087/controllers/kategori_barang_controller.dart';
import 'package:exerciseapi_087/models/kategori_barang_model.dart';
import 'package:exerciseapi_087/widgets/widget.dart';
import 'package:flutter/material.dart';

class AddKategoriBarang extends StatefulWidget {
  const AddKategoriBarang({super.key});

  @override
  State<AddKategoriBarang> createState() => _AddKategoriBarangState();
}

class _AddKategoriBarangState extends State<AddKategoriBarang> {

  final _formKey = GlobalKey<FormState>();

  final kategoriBarangController = KategoriBarangController();

  final _namaController = TextEditingController();

  addKategoriBarang() async {
    KategoriBarangModel kategoriBarang = KategoriBarangModel(nama: _namaController.text);
    await kategoriBarangController.addKategoriBarang(kategoriBarang);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      elevation: 0,
      title: const Text('Tambah Kategori Barang'),
    );
  }

  Widget body() {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const Text('Nama'),
          const SizedBox(height: 5),
          InputTextField(label: 'Nama', icon: const Icon(Icons.short_text_rounded), hint: 'Nama kategori barang', textEditingController: _namaController, textInputType: TextInputType.name, textInputAction: TextInputAction.done, validatorMessage: 'Nama tidak boleh kosong', minLength: 0),
          const SizedBox(height: 30),
          SizedBox(
            height: 55,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  addKategoriBarang();
                  
                  const snackBar = SnackBar(
                    content: Text('Kategori barang berhasil disimpan')
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  Navigator.pop(context);
                }
              },
              child: const Text('SIMPAN')
            ),
          ),
        ],
      ),
    );
  }
}

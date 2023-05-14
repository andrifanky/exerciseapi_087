import 'package:exerciseapi_087/controllers/kategori_barang_controller.dart';
import 'package:exerciseapi_087/models/kategori_barang_model.dart';
import 'package:exerciseapi_087/widgets/widget.dart';
import 'package:flutter/material.dart';

class EditKategoriBarang extends StatefulWidget {
  const EditKategoriBarang({
    super.key,
    required this.kategoriBarang
  });

  final KategoriBarangModel kategoriBarang;

  @override
  State<EditKategoriBarang> createState() => _EditKategoriBarangState();
}

class _EditKategoriBarangState extends State<EditKategoriBarang> {

  final _formKey = GlobalKey<FormState>();

  final kategoriBarangController = KategoriBarangController();

  final _namaController = TextEditingController();

  @override
  void initState() {
    _namaController.text = widget.kategoriBarang.nama;
    super.initState();
  }

  updateKategoriBarang() async {
    // KategoriBarangModel kategoriBarang = KategoriBarangModel(nama: _namaController.text);
    // await kategoriBarangController.updateKategoriBarang(kategoriBarang);
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
      title: const Text('Ubah Kategori Barang'),
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

                  updateKategoriBarang();
                  
                  const snackBar = SnackBar(
                    content: Text('Kategori barang berhasil diubah')
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

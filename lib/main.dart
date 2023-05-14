import 'package:exerciseapi_087/views/kategori_barang/kategori_barang.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barang',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const KategoriBarang(),
      debugShowCheckedModeBanner: false
    );
  }
}

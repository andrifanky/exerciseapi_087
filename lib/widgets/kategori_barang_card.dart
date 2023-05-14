part of 'widget.dart';

class KategoriBarangCard extends StatelessWidget {
  KategoriBarangCard({
    super.key,
    required this.kategoriBarang
  });

  final KategoriBarangModel kategoriBarang;

  final kategoriBarangController = KategoriBarangController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
        },
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(kategoriBarang.nama, style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EditKategoriBarang(kategoriBarang: kategoriBarang)));
                },
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.edit_rounded, color: Colors.blue)
              ),
              IconButton(
                onPressed: () {
                  deleteDialog(kategoriBarang, context);
                },
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.delete_rounded, color: Colors.red)
              ),
            ],
          ),
        ),
      ),
    );
  }

  deleteDialog(KategoriBarangModel kategoriBarang, BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Hapus Kategori Barang'),
          content: const  Text('Apakah anda yakin?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('BATAL')
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                kategoriBarangController.deleteKategoriBarang(kategoriBarang.id!);

                const snackBar = SnackBar(
                  content: Text('Kategori barang berhasil dihapus')
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text('YA', style: TextStyle(color: Colors.red))
            ),
          ],
        );
      }
    );
  }
}

part of 'widget.dart';

class KategoriBarangCard extends StatelessWidget {
  const KategoriBarangCard({
    super.key,
    required this.kategoriBarang
  });

  final KategoriBarangModel kategoriBarang;

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
              const Icon(Icons.check_box_outline_blank_rounded),
              const SizedBox(width: 10),
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
}

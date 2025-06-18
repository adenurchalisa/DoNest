import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/header_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List<Map<String, dynamic>> _donasiDataMendesak = [
    {
      'imageUrl': 'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
      'title': 'Bantuan untuk anak-anak',
      'terkumpul': 5000000,
      'target': 10000000,
      'donatur': 200,
      'sisaHari': 3,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1465101046530-73398c7f28ca',
      'title': 'Pakaian & kebutuhan untuk tunawisma',
      'terkumpul': 9500000,
      'target': 10000000,
      'donatur': 300,
      'sisaHari': 5,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
      'title': 'Bantuan buku untuk sekolah desa',
      'terkumpul': 3500000,
      'target': 7000000,
      'donatur': 150,
      'sisaHari': 2,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1500534314209-a25ddb2bd429',
      'title': 'Sembako untuk keluarga prasejahtera',
      'terkumpul': 4200000,
      'target': 9000000,
      'donatur': 110,
      'sisaHari': 1,
    },
  ];

  final List<Map<String, dynamic>> _donasiDataPilihan = [
    {
      'imageUrl': 'https://images.unsplash.com/photo-1465101046530-73398c7f28ca',
      'title': 'Bantuan biaya sekolah',
      'terkumpul': 3500000,
      'target': 5000000,
      'donatur': 80,
      'sisaHari': 10,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1465101178521-c1a9136a3b99',
      'title': 'Pengobatan gratis lansia',
      'terkumpul': 2200000,
      'target': 5000000,
      'donatur': 55,
      'sisaHari': 8,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1464983953574-0892a716854b',
      'title': 'Bantuan air bersih desa',
      'terkumpul': 4800000,
      'target': 8000000,
      'donatur': 130,
      'sisaHari': 6,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1500534623283-312aade485b7',
      'title': 'Perlengkapan sekolah yatim',
      'terkumpul': 2700000,
      'target': 4000000,
      'donatur': 70,
      'sisaHari': 12,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xfff6f8fa),
      body: Stack(
        children: [
          SafeArea(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                HeaderHome(
                  username: "Dermawan",
                  totalDonation: 1600000,
                  onTopUp: () {
                    // aksi isi saldo
                  },
                ),
                const SizedBox(height: 28),
                // Search Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Cari program donasi",
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.blue, width: 1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Section Donasi Mendesak
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Donasi Mendesak',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Lihat semua',
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                // Card donasi mendesak (horizontal)
                SizedBox(
                  height: 250,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: _donasiDataMendesak.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 16),
                    itemBuilder: (context, i) {
                      final d = _donasiDataMendesak[i];
                      return _donasiCard(
                        imageUrl: d['imageUrl'],
                        title: d['title'],
                        terkumpul: d['terkumpul'],
                        target: d['target'],
                        donatur: d['donatur'],
                        sisaHari: d['sisaHari'],
                        width: 260,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),
                // Section Donasi Pilihan
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Donasi Pilihan',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Lihat semua',
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                // Filter kategori donasi
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      _categoryChip('Semua', true),
                      const SizedBox(width: 8),
                      _categoryChip('Pendidikan', false),
                      const SizedBox(width: 8),
                      _categoryChip('Makanan', false),
                      const SizedBox(width: 8),
                      _categoryChip('Kesehatan', false),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                // Card donasi pilihan (vertical, lebar penuh)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: _donasiDataPilihan.map((d) => Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: _donasiCard(
                        imageUrl: d['imageUrl'],
                        title: d['title'],
                        terkumpul: d['terkumpul'],
                        target: d['target'],
                        donatur: d['donatur'],
                        sisaHari: d['sisaHari'],
                        width: screenWidth - 40, // full width dikurangi padding
                      ),
                    )).toList(),
                  ),
                ),
                const SizedBox(height: 100), // ruang untuk nav bar melayang
              ],
            ),
          ),
          // Bottom nav bar melayang
          BottomNavBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _donasiCard({
    required String imageUrl,
    required String title,
    required int terkumpul,
    required int target,
    required int donatur,
    required int sisaHari,
    double? width,
  }) {
    return Container(
      width: width,
      margin: EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar campaign
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
            child: Image.network(
              imageUrl,
              height: 92,
              width: width ?? double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 6),
                Text(
                  'Rp${_formatRupiah(terkumpul)} terkumpul dari\nRp${_formatRupiah(target)} target',
                  style: TextStyle(fontSize: 11, color: Colors.black54),
                ),
                const SizedBox(height: 8),
                // Progress bar
                LinearProgressIndicator(
                  minHeight: 5,
                  value: terkumpul / target,
                  color: Colors.blue,
                  backgroundColor: Colors.blue[100],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.people, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text('$donatur donatur', style: TextStyle(fontSize: 12, color: Colors.black54)),
                    const SizedBox(width: 14),
                    Icon(Icons.calendar_today, size: 15, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text('$sisaHari hari lagi', style: TextStyle(fontSize: 12, color: Colors.black54)),
                    const Spacer(),
                    Icon(Icons.bookmark_border, size: 19, color: Colors.grey[400]),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryChip(String label, bool selected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.blue : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue, width: 1.5),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : Colors.blue,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  String _formatRupiah(int number) {
    String str = number.toString();
    String result = '';
    for (int i = 0; i < str.length; i++) {
      int pos = str.length - i;
      result = str[pos - 1] + result;
      if (i % 3 == 2 && i != str.length - 1) result = '.' + result;
    }
    return result;
  }
}
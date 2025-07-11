import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/header_home.dart';
import '../pages/detail_donasi_page.dart';
import '../../utils/format_rupiah.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List<Map<String, dynamic>> _donasiDataMendesak = [
    {
      "imageUrl": "https://images.unsplash.com/photo-1576381330792-d759250b35ec?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "title": "Bantuan untuk anak-anak",
      "terkumpul": 5000000,
      "target": 10000000,
      "donatur": 200,  
      "sisaHari": 3,
      "deskripsi": "Bantuan untuk anak-anak yang membutuhkan akses pendidikan.",
      "penyelenggara": "Yayasan Anak Ceria",
      "kontak": "081234567890",
    },
    {
      "imageUrl": "https://cdn.antaranews.com/cache/1200x800/2022/11/02/Screenshot_20221101-182556_Facebook.jpg",
      "title": "Pakaian & kebutuhan untuk tunawisma",
      "terkumpul": 9500000,
      "target": 10000000,
      "donatur": 300,
      "sisaHari": 5,
      "deskripsi": "Bantuan pakaian dan kebutuhan dasar untuk tunawisma.",
      "penyelenggara": "Yayasan Peduli Sesama",
      "kontak": "081234567891",
    },
    {
      "imageUrl": "https://awsimages.detik.net.id/community/media/visual/2022/07/19/kelas-jauh-milik-sdn-118-di-desa-sendana-kecamatan-bittuang-tana-toraja-sulsel_169.jpeg?w=1200",
      "title": "Bantuan buku untuk sekolah desa",
      "terkumpul": 3500000,
      "target": 7000000,
      "donatur": 150,
      "sisaHari": 2,
      "deskripsi": "Pengadaan buku dan alat tulis untuk sekolah di desa terpencil.",
      "penyelenggara": "Yayasan Pendidikan Indonesia",
      "kontak": "081234567892",
    },
    {
      "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQe4zIaSnTslfefcZ7eyeuPpdisfDjO_FUwfw&sg",
      "title": "Sembako untuk keluarga prasejahtera",
      "terkumpul": 4200000,
      "target": 9000000,
      "donatur": 110,
      "sisaHari": 1,
      "deskripsi": "Bantuan sembako untuk keluarga prasejahtera.",
      "penyelenggara": "Yayasan Kemanusiaan",
      "kontak": "081234567893",
    },
  ];
  
  final List<Map<String, dynamic>> _donasiDataPilihan = [
    {
      "imageUrl": "https://www.purbalinggakab.go.id/wp-content/uploads/2020/01/IMG-20200115-WA0004-1280x640.jpg",
      "title": "Bantuan biaya sekolah",
      "terkumpul": 3500000,
      "target": 5000000,
      "donatur": 80,
      "sisaHari": 10,
      "deskripsi": "Bantuan biaya sekolah untuk anak-anak kurang mampu.",
      "penyelenggara": "Yayasan Pendidikan",
      "kontak": "081234567894",
    },
    {
      "imageUrl": "https://cdn.antaranews.com/cache/1200x800/2023/03/15/RS-Bhayangkara.jpg",
      "title": "Pengobatan gratis lansia",
      "terkumpul": 2200000,
      "target": 5000000,
      "donatur": 55,
      "sisaHari": 8,
      "deskripsi": "Pengobatan gratis untuk lansia di daerah terpencil.",
      "penyelenggara": "Yayasan Kesehatan",
      "kontak": "081234567895",
    },
    {
      "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjDzzwg3pJe0yoInNGnsM5Lp0Cy3mjJfdGjg&s",
      "title": "Bantuan air bersih desa",
      "terkumpul": 4800000,
      "target": 8000000,
      "donatur": 130,
      "sisaHari": 6,
      "deskripsi": "Bantuan air bersih untuk desa yang kekurangan sumber air.",
      "penyelenggara": "Yayasan Lingkungan",
      "kontak": "081234567896",
    },
    {
      "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaqckXSun9An1DjZQwYh4TuvXRaNJ3nEGd9cyHB2wpvM5a7y-aoBEqMAHuPDdaUMPR5B8&usqp=CAU",
      "title": "Perlengkapan sekolah yatim",
      "terkumpul": 2700000,
      "target": 4000000,
      "donatur": 70,
      "sisaHari": 12,
      "deskripsi": "Pengadaan perlengkapan sekolah untuk anak-anak yatim.",
      "penyelenggara": "Yayasan Yatim Piatu",
      "kontak": "081234567897",
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
                    _showTopUpDialog(context);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Donasi Mendesak",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Lihat semua",
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  height: 250,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: _donasiDataMendesak.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 16),
                    itemBuilder: (context, i) {
                      final d = _donasiDataMendesak[i];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailDonasiPage(campaign: d),
                            ),
                          );
                        },
                        child: _donasiCard(
                          imageUrl: d["imageUrl"],
                          title: d["title"],
                          terkumpul: d["terkumpul"],
                          target: d["target"],
                          donatur: d["donatur"],
                          sisaHari: d["sisaHari"],
                          width: 260,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 28),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Donasi Pilihan",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Lihat semua",
                          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      _categoryChip("Semua", true),
                      const SizedBox(width: 8),
                      _categoryChip("Pendidikan", false),
                      const SizedBox(width: 8),
                      _categoryChip("Makanan", false),
                      const SizedBox(width: 8),
                      _categoryChip("Kesehatan", false),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: _donasiDataPilihan.map((d) => Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailDonasiPage(campaign: d),
                            ),
                          );
                        },
                        child: _donasiCard(
                          imageUrl: d["imageUrl"],
                          title: d["title"],
                          terkumpul: d["terkumpul"],
                          target: d["target"],
                          donatur: d["donatur"],
                          sisaHari: d["sisaHari"],
                          width: screenWidth - 40,
                        ),
                      ),
                    )).toList(),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
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
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
            child: Image.network(
              imageUrl,
              height: 92,
              width: width ?? double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 92,
                  width: width ?? double.infinity,
                  color: Colors.grey[300],
                  child: Icon(Icons.image_not_supported, color: Colors.grey[500]),
                );
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  height: 92,
                  width: width ?? double.infinity,
                  color: Colors.grey[200],
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                    ),
                  ),
                );
              },
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
                  "Rp${_formatRupiah(terkumpul)} terkumpul dari\nRp${_formatRupiah(target)} target",
                  style: TextStyle(fontSize: 11, color: Colors.black54),
                ),
                const SizedBox(height: 8),
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
                    Text("$donatur donatur", style: TextStyle(fontSize: 12, color: Colors.black54)),
                    const SizedBox(width: 14),
                    Icon(Icons.calendar_today, size: 15, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text("$sisaHari hari lagi", style: TextStyle(fontSize: 12, color: Colors.black54)),
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
    return formatRupiah(number);
  }
  
  void _showTopUpDialog(BuildContext context) {
    final TextEditingController amountController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Top Up Saldo'),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: amountController,
                  decoration: InputDecoration(
                    labelText: 'Nominal Top Up',
                    prefixText: 'Rp ',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nominal tidak boleh kosong';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Masukkan angka yang valid';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                Text('Pilih Nominal Cepat:'),
                SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _quickTopUpAmount('10000', amountController),
                    _quickTopUpAmount('50000', amountController),
                    _quickTopUpAmount('100000', amountController),
                    _quickTopUpAmount('500000', amountController),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  int amount = int.parse(amountController.text);
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Top Up sebesar Rp${formatRupiah(amount)} berhasil!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                  
                  Navigator.of(context).pop();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Text(
                'Top Up', 
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
  
  Widget _quickTopUpAmount(String amount, TextEditingController controller) {
    return ElevatedButton(
      onPressed: () {
        controller.text = amount;
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[200],
        foregroundColor: Colors.black,
      ),
      child: Text('Rp $amount'),
    );
  }
}
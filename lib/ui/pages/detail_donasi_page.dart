import 'package:flutter/material.dart';
import 'donation_form_page.dart';

class DetailDonasiPage extends StatelessWidget {
  final Map<String, dynamic> campaign;
  const DetailDonasiPage({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    final double terkumpul = campaign['terkumpul'] * 1.0;
    final double target = campaign['target'] * 1.0;

    return Scaffold(
      backgroundColor: const Color(0xfff6f8fa),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              // Header gambar utama
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
                child: Image.network(
                  campaign['imageUrl'],
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              // Judul & progress
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      campaign['title'] ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 12),
                    LinearProgressIndicator(
                      value: terkumpul / target,
                      minHeight: 8,
                      color: Colors.blue,
                      backgroundColor: Colors.blue[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          "Rp${_formatRupiah(campaign['terkumpul'])}",
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const Text(
                          " terkumpul dari ",
                          style: TextStyle(fontSize: 13, color: Colors.black54),
                        ),
                        Text(
                          "Rp${_formatRupiah(campaign['target'])}",
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.people, size: 18, color: Colors.grey),
                        const SizedBox(width: 3),
                        Text('${campaign['donatur']} donatur', style: TextStyle(fontSize: 13, color: Colors.black54)),
                        const SizedBox(width: 14),
                        Icon(Icons.calendar_today, size: 17, color: Colors.grey),
                        const SizedBox(width: 3),
                        Text('${campaign['sisaHari']} hari lagi', style: TextStyle(fontSize: 13, color: Colors.black54)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Deskripsi campaign
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  campaign['deskripsi'] ??
                      "Belum ada deskripsi untuk program ini. Tambahkan deskripsi pada data donasi untuk tampilan lebih informatif.",
                  style: const TextStyle(fontSize: 15, color: Colors.black87),
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 30),
              // Info penyelenggara (dummy)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.blue[100],
                      child: Icon(Icons.volunteer_activism, color: Colors.blue, size: 28),
                    ),
                    const SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          campaign['penyelenggara'] ?? "Yayasan Kebaikan",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          campaign['kontak'] ?? "08123456789",
                          style: TextStyle(color: Colors.black54, fontSize: 13),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(Icons.share, color: Colors.blue),
                      onPressed: () {
                        // aksi share campaign
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100), // untuk tombol donasi
            ],
          ),
          // Tombol Donasi Sekarang
          Positioned(
            left: 0,
            right: 0,
            bottom: 24,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DonationFormPage(campaign: campaign),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(double.infinity, 54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 8,
                ),
                child: const Text(
                  "Donasi Sekarang",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static String _formatRupiah(int number) {
    String str = number.toString();
    String result = '';
    for (int i = 0; i < str.length; i++) {
      int pos = str.length - i;
      result = str[pos - 1] + result;
      if (i % 3 == 2 && i != str.length - 1) result = '.$result';
    }
    return result;
  }
}